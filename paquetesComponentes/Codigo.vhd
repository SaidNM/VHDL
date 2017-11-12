----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:47:27 10/26/2017 
-- Design Name: 
-- Module Name:    Codigo - Convertidor 
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

entity Codigo is
    Port ( E : in  STD_LOGIC_VECTOR (3 downto 0);
           SAL : out  STD_LOGIC_VECTOR (6 downto 0));
end Codigo;

architecture Convertidor of Codigo is

	CONSTANT DIG0 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0000001";
	CONSTANT DIG1 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "1001111";
	CONSTANT DIG2 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0010010";
	CONSTANT DIG3 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0000110";
	CONSTANT DIG4 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "1001100";
	CONSTANT DIG5 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0100100";
	CONSTANT DIG6 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0100000";
	CONSTANT DIG7 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0001111";
	CONSTANT DIG8 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0000000";
	CONSTANT DIG9 : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0000100";
	CONSTANT DIGA : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0001000";
	CONSTANT DIGB : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "1100000";
	CONSTANT DIGC : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0110001";
	CONSTANT DIGD : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "1000010";
	CONSTANT DIGE : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0110000";
	CONSTANT DIGF : STD_LOGIC_VECTOR( 6 DOWNTO 0) := "0111000";

begin

	SAL <= 	DIG0 WHEN( E = X"0") ELSE
				DIG1 WHEN( E = X"1") ELSE
				DIG2 WHEN( E = X"2") ELSE
				DIG3 WHEN( E = X"3") ELSE
				DIG4 WHEN( E = X"4") ELSE
				DIG5 WHEN( E = X"5") ELSE
				DIG6 WHEN( E = X"6") ELSE
				DIG7 WHEN( E = X"7") ELSE
				DIG8 WHEN( E = X"8") ELSE
				DIG9 WHEN( E = X"9") ELSE
				DIGA WHEN( E = X"A") ELSE
				DIGB WHEN( E = X"B") ELSE
				DIGC WHEN( E = X"C") ELSE
				DIGD WHEN( E = X"D") ELSE
				DIGE WHEN( E = X"E") ELSE
				DIGF;
				

end Convertidor;

