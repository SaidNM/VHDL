----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:42 10/22/2017 
-- Design Name: 
-- Module Name:    archivoRegistros - arq_archivoRegistros 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity archivoRegistros is
	GENERIC(
		NBITS_ADDR : INTEGER :=4;
		NBITS_DATA :INTEGER := 16
		);
	PORT(
		CLK 			: in std_logic;
		SHE 			: in STD_LOGIC;
		WR  			: in STD_LOGIC;
		DIR 			: in STD_LOGIC;
		SHAMT 		: in STD_LOGIC_VECTOR (3 downto 0);
		ADDR_WR 		: in  STD_LOGIC_VECTOR (NBITS_ADDR-1 downto 0);
		ADDR_RDR1 	: in  STD_LOGIC_VECTOR (NBITS_ADDR-1 downto 0);
		ADDR_RDR2 	: in  STD_LOGIC_VECTOR (NBITS_ADDR-1 downto 0);
      WDATA 		: in  STD_LOGIC_VECTOR (NBITS_DATA-1 downto 0);
      RDATA1 		: inout STD_LOGIC_VECTOR (NBITS_DATA-1 downto 0);
		RDATA2 		: out STD_LOGIC_VECTOR (NBITS_DATA-1 downto 0)
	);
end archivoRegistros;

architecture arq_archivoRegistros of archivoRegistros is
TYPE MEM_TYPE IS ARRAY ((2**NBITS_ADDR)-1 DOWNTO 0) OF STD_LOGIC_VECTOR(WDATA'RANGE);
SIGNAL MEM : MEM_TYPE;
SIGNAL LSHIFT_OUT : STD_LOGIC_VECTOR(NBITS_DATA-1 DOWNTO 0);
SIGNAL RSHIFT_OUT : STD_LOGIC_VECTOR(NBITS_DATA-1 DOWNTO 0);
SIGNAL BS_OUT : STD_LOGIC_VECTOR(NBITS_DATA-1 DOWNTO 0);
SIGNAL MUX_DATA: STD_LOGIC_VECTOR(NBITS_DATA-1 DOWNTO 0);
begin
--BARREL SHIFTER
	LSHIFT : PROCESS( SHAMT, RDATA1 )
	VARIABLE SHIFT_DATA : STD_LOGIC_VECTOR( NBITS_DATA-1 DOWNTO 0 );
	VARIABLE INDICE : INTEGER RANGE -NBITS_DATA TO NBITS_DATA-1;
	BEGIN
		SHIFT_DATA := RDATA1;
		FOR I IN 0 TO 3 LOOP
			FOR J IN 15 DOWNTO 0 LOOP
				IF( SHAMT(I) = '1' )THEN
					INDICE := J - 2**I;
					IF( INDICE < 0 )THEN
						SHIFT_DATA(J) := '0';
					ELSE
						SHIFT_DATA(J) := SHIFT_DATA(INDICE);
					END IF;
				END IF;
			END LOOP;
		END LOOP;
		LSHIFT_OUT<=SHIFT_DATA;
	END PROCESS LSHIFT;

	RSHIFT : PROCESS (SHAMT, RDATA1)
	VARIABLE SHIFT_DATA1 : STD_LOGIC_VECTOR(NBITS_DATA-1 downto 0);
	VARIABLE INDICE1: INTEGER RANGE 0 to 31;
	BEGIN
		SHIFT_DATA1 := RDATA1;
		FOR I IN 0 TO 3 LOOP
			FOR J IN 0 TO 15 LOOP
				IF( SHAMT(I) = '1' )THEN
					INDICE1 := J +	2**I;
					IF( INDICE1 > NBITS_DATA-1 )THEN
						SHIFT_DATA1(J) := '0';
					ELSE
						SHIFT_DATA1(J) := SHIFT_DATA1(INDICE1);
					END IF;
				END IF;
			END LOOP;
		END LOOP;
		RSHIFT_OUT<=SHIFT_DATA1;
	END PROCESS RSHIFT;
	
	BS_OUT <= LSHIFT_OUT WHEN DIR = '1' else
					RSHIFT_OUT WHEN DIR = '0';

	MUX_DATA <= BS_OUT WHEN SHE ='1' else
				WDATA WHEN SHE='0';
	
-- ESCRITURA DE MEMORIA
	PMEM : PROCESS( CLK )
	BEGIN
		IF( RISING_EDGE(CLK) )THEN
			IF( WR = '1' )THEN
				MEM(CONV_INTEGER(ADDR_WR)) <= MUX_DATA;--'aqui va lo que salga del mux del barrel'
			END IF;
		END IF;
	END PROCESS PMEM;
-- LECTURA DE MEMORIA
	RDATA1 <= MEM(CONV_INTEGER(ADDR_RDR1));
	RDATA2 <= MEM(CONV_INTEGER(ADDR_RDR2));



end arq_archivoRegistros;

