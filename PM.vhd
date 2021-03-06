----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:29:34 10/01/2017 
-- Design Name: 
-- Module Name:    PM - Behavioral 
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

entity PM is
    Port ( A : in  STD_LOGIC_VECTOR (15 downto 0);
           D : out  STD_LOGIC_VECTOR (24 downto 0));
end PM;

architecture Behavioral of PM is
	CONSTANT OPCODE_TIPOR 	: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00000";
	CONSTANT OPCODE_LI 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00001";
	CONSTANT OPCODE_LWI 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00010";
	CONSTANT OPCODE_LW 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10111";
	CONSTANT OPCODE_SWI 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00011";
	CONSTANT OPCODE_SW 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00100";
	CONSTANT OPCODE_ADDI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00101";
	CONSTANT OPCODE_SUBI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00110";
	CONSTANT OPCODE_ANDI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "00111";
	CONSTANT OPCODE_ORI 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01000";
	CONSTANT OPCODE_XORI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01001";
	CONSTANT OPCODE_NANDI	: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01010";
	CONSTANT OPCODE_NORI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01011";
	CONSTANT OPCODE_XNORI	: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01100";
	CONSTANT OPCODE_BEQI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01101";
	CONSTANT OPCODE_BNEI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01110";
	CONSTANT OPCODE_BLTI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "01111";
	CONSTANT OPCODE_BLETI	: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10000";
	CONSTANT OPCODE_BGTI		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10001";
	CONSTANT OPCODE_BGETI	: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10010";
	CONSTANT OPCODE_B 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10011";
	CONSTANT OPCODE_CALL		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10100";
	CONSTANT OPCODE_RET 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10101";
	CONSTANT OPCODE_NOP 		: STD_LOGIC_VECTOR(4 DOWNTO 0) := "10110";
--	FUNCONDE	
	CONSTANT FUNCODE_ADD		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	CONSTANT FUNCODE_SUB		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
	CONSTANT FUNCODE_AND		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
	CONSTANT FUNCODE_OR		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
	CONSTANT FUNCODE_XOR		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
	CONSTANT FUNCODE_NAND	: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
	CONSTANT FUNCODE_NOR		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110";
	CONSTANT FUNCODE_XNOR	: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";
	CONSTANT FUNCODE_NOT		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
	CONSTANT FUNCODE_SLL		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
	CONSTANT FUNCODE_SRL		: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
-- REGISTROS	
	CONSTANT R0					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	CONSTANT R1					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0001";
	CONSTANT R2					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0010";
	CONSTANT R3					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0011";
	CONSTANT R4					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0100";
	CONSTANT R5					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0101";
	CONSTANT R6					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0110";
	CONSTANT R7					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0111";
	CONSTANT R8					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1000";
	CONSTANT R9					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1001";
	CONSTANT R10				: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1010";
	CONSTANT R11				: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1011";
	CONSTANT R12				: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1100";
	CONSTANT R13				: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1101";
	CONSTANT R14				: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1110";
	CONSTANT R15				: STD_LOGIC_VECTOR(3 DOWNTO 0) := "1111";
-- SIN USO	
	CONSTANT SU					: STD_LOGIC_VECTOR(3 DOWNTO 0) := "0000";
	
	
	TYPE ARR IS ARRAY (0 TO 2**16 - 1) OF STD_LOGIC_VECTOR(24 DOWNTO 0); 
	CONSTANT ROM : ARR := (
		OPCODE_LI&R0&X"0001",
		OPCODE_LI&R1&X"0007",
		OPCODE_TIPOR&R1&R1&R0&SU&FUNCODE_ADD,
		OPCODE_SWI&R1&X"0005",
		OPCODE_B&SU&X"0002",
		OTHERS=>(OTHERS=>'0')
	);
begin
	D <= ROM( CONV_INTEGER(A) );


end Behavioral;

