----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:53:32 10/18/2017 
-- Design Name: 
-- Module Name:    Mem_datos - RAM 
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

entity Mem_datos is
	GENERIC( 
		NBITS_ADDR : INTEGER := 8;
		NBITS_DATA : INTEGER := 16
		);
    Port ( CLK 	: in  STD_LOGIC;
           WE 		: in  STD_LOGIC;
           ADDR 	: in  STD_LOGIC_VECTOR (NBITS_ADDR-1 downto 0);
           DIN 	: in  STD_LOGIC_VECTOR (NBITS_DATA-1 downto 0);
           DOUT 	: out STD_LOGIC_VECTOR (NBITS_DATA-1 downto 0)
			 );

end Mem_datos;

architecture RAM of Mem_datos is
TYPE MEM_TYPE IS ARRAY (0 TO 2**NBITS_ADDR-1) OF STD_LOGIC_VECTOR(DIN'RANGE);
SIGNAL MEM : MEM_TYPE;
begin
-- ESCRITURA DE MEMORIA
	PMEM : PROCESS( CLK )
	BEGIN
		IF( RISING_EDGE(CLK) )THEN
			IF( WE = '1' )THEN
				MEM(CONV_INTEGER(ADDR)) <= DIN;
			END IF;			
		END IF;
	END PROCESS PMEM;
-- LECTURA DE MEMORIA
	DOUT <= MEM(CONV_INTEGER(ADDR));


end RAM;

