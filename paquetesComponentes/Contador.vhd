----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:45:03 10/26/2017 
-- Design Name: 
-- Module Name:    Contador - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Contador is
    Port ( D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : inout  STD_LOGIC_VECTOR (3 downto 0);
           L : in  STD_LOGIC;
           I : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC);
end Contador;

architecture Behavioral of Contador is

begin

		PREG : PROCESS ( CLK , CLR )
	
	BEGIN
	
		IF( CLR = '1' ) THEN
			Q <= (OTHERS => '0');
		ELSIF( RISING_EDGE(CLK) )THEN
			IF( L = '1' ) THEN
				Q <= D;
			ELSIF( I = '1' ) THEN
				Q <= Q + 1;
			END IF;
		END IF;
				
	END PROCESS PREG;

end Behavioral;

