----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:24:16 10/26/2017 
-- Design Name: 
-- Module Name:    Principal - Programa 
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
LIBRARY WORK;
use IEEE.STD_LOGIC_1164.ALL;
USE WORK.Mi_Paquete.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Principal is
    Port ( CLK 		: in  STD_LOGIC;
           CLR 		: in  STD_LOGIC;
           INI 		: in  STD_LOGIC;
           DATOS 		: in  STD_LOGIC_VECTOR (7 downto 0);
           DISP 		: out  STD_LOGIC_VECTOR (6 downto 0));
end Principal;

architecture Programa of Principal is

	SIGNAL QB 			 						: STD_LOGIC_VECTOR( 3 DOWNTO 0 );
	SIGNAL QA									: STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	SIGNAL SAL									: STD_LOGIC_VECTOR( 6 DOWNTO 0 );
	SIGNAL LB , IB , LA , SH , SD	, Z	: STD_LOGIC;


begin

	CONT 	: CONTADOR PORT MAP ( X"0" , QB , LB , IB , CLK , CLR );
	REG 	: REGISTRO PORT MAP ( DATOS , QA , LA , SH , CLK , CLR );
	COD 	: CODIGO   PORT MAP ( QB , SAL );
	CTL 	: CONTROL  PORT MAP ( CLK , CLR , INI , Z , QA(0) , LA , SH , LB , IB , SD );
	
	--Z
	Z <= '1' WHEN QA = X"00" ELSE '0';
	
	--DISP
	DISP <= "1111110" WHEN ( SD = '0' ) ELSE SAL;
	
end Programa;

