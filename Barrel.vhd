----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:45:28 10/22/2017 
-- Design Name: 
-- Module Name:    Barrel - barrel 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Barrel is
    Port ( DATA_IN : in  STD_LOGIC_VECTOR (15 downto 0);
				DIR 		: in STD_LOGIC;
           DATA_OUT : out  STD_LOGIC_VECTOR (15 downto 0);
           SHIFT : in  STD_LOGIC_VECTOR (3 downto 0)
			);
end Barrel;

architecture arq_barrel of Barrel is
SIGNAL LSHIFT_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
SIGNAL RSHIFT_OUT : STD_LOGIC_VECTOR(15 DOWNTO 0);
begin
	
	LSHIFT : PROCESS( SHIFT, DATA_IN )
	VARIABLE SHIFT_DATA : STD_LOGIC_VECTOR( 15 DOWNTO 0 );
	VARIABLE INDICE : INTEGER RANGE -16 TO 15;
	BEGIN
		SHIFT_DATA := DATA_IN;
		FOR I IN 0 TO 3 LOOP
			FOR J IN 15 DOWNTO 0 LOOP
				IF( SHIFT(I) = '1' )THEN
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

	RSHIFT : PROCESS (SHIFT, DATA_IN)
	VARIABLE SHIFT_DATA1 : STD_LOGIC_VECTOR(15 downto 0);
	VARIABLE INDICE1: INTEGER RANGE 0 to 31;
	BEGIN
		SHIFT_DATA1 := DATA_IN;
		FOR I IN 0 TO 3 LOOP
			FOR J IN 0 TO 15 LOOP
				IF( SHIFT(I) = '1' )THEN
					INDICE1 := J +	2**I;
					IF( INDICE1 > 15 )THEN
						SHIFT_DATA1(J) := '0';
					ELSE
						SHIFT_DATA1(J) := SHIFT_DATA1(INDICE1);
					END IF;
				END IF;
			END LOOP;
		END LOOP;
		RSHIFT_OUT<=SHIFT_DATA1;
	END PROCESS RSHIFT;
	
	DATA_OUT <= LSHIFT_OUT WHEN DIR = '0' else
					RSHIFT_OUT WHEN DIR = '1';
	
end arq_barrel;

