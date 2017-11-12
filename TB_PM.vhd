--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   18:35:29 10/01/2017
-- Design Name:   
-- Module Name:   C:/Users/saidn/Documents/Arquitectura/Program_Memory/TB_PM.vhd
-- Project Name:  Program_Memory
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PM
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;	--PERMITE USAR STD_LOGIC 
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_PM IS
END TB_PM;
 
ARCHITECTURE behavior OF TB_PM IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PM
    PORT(
         A : IN  std_logic_vector(15 downto 0);
         D : OUT  std_logic_vector(24 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(15 downto 0) := (others => '0');

 	--Outputs
   signal D : std_logic_vector(24 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
   -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PM PORT MAP (
          A => A,
          D => D
        );

   -- Clock process definitions
	-- <clock>_process :process
	-- begin
	--	<clock> <= '0';
	--	wait for <clock>_period/2;
	--	<clock> <= '1';
	--	wait for <clock>_period/2;
	-- end process;
 ---

   -- Stimulus process
   stim_proc: process

	file ARCH_OUT : TEXT;																					
	variable LINEA_OUT : line;
	variable VAR_D : STD_LOGIC_VECTOR(24 DOWNTO 0);
	variable VAR_OPCODE : STD_LOGIC_VECTOR(4 downto 0);
	variable VAR_4 : STD_LOGIC_VECTOR(3 downto 0);
	variable VAR_3 : STD_LOGIC_VECTOR(3 downto 0);
	variable VAR_2 : STD_LOGIC_VECTOR(3 downto 0);
	variable VAR_1 : STD_LOGIC_VECTOR(3 downto 0);
	variable VAR_FUNCODE : STD_LOGIC_VECTOR(3 downto 0);
	
	variable CADENA : STRING(1 to 6);
--	
	file ARCH_IN : TEXT;
	variable LINEA_IN : line;
	variable VAR_A : integer range 0 to 65535;
	
   begin		
		file_open(ARCH_OUT, "RESULTADO.TXT", WRITE_MODE); 	
		file_open(ARCH_IN, "ENTRADAS.TXT",READ_MODE);
		CADENA := "     A";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH);
		CADENA := "OPCODE";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	
		CADENA := "19..16";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	
		CADENA := "15..12";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	
		CADENA := "11...8";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	
		CADENA := "7....4";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	
		CADENA := "3....0";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	
		writeline(ARCH_OUT,LINEA_OUT);-- escribe la linea en el archivo
		
		FOR I IN 0 TO 7 LOOP
			readline(ARCH_IN,LINEA_IN); -- lee una linea completa
			read(LINEA_IN, VAR_A);
			A <= CONV_STD_LOGIC_VECTOR(VAR_A,16);
			wait for 50 ns;
			VAR_D := D;
			VAR_OPCODE := std_logic_vector(VAR_D(24 downto 20));
			VAR_4 := std_logic_vector(VAR_D(19 downto 16));
			VAR_3 := std_logic_vector(VAR_D(15 downto 12));
			VAR_2 := std_logic_vector(VAR_D(11 downto 8));
			VAR_1 := std_logic_vector(VAR_D(7 downto 4));
			VAR_FUNCODE := std_logic_vector(VAR_D(3 downto 0));
			Hwrite(LINEA_OUT, A, right, 6);	--ESCRIBE EL CAMPO A
			write(LINEA_OUT, VAR_OPCODE, right, 7);
			write(LINEA_OUT, VAR_4, right, 7);
			write(LINEA_OUT, VAR_3, right, 7);
			write(LINEA_OUT, VAR_2, right, 7);
			write(LINEA_OUT, VAR_1, right, 7);
			write(LINEA_OUT, VAR_FUNCODE, right, 7);
			writeline(ARCH_OUT,LINEA_OUT);-- escribe la linea en el archivo			
			WAIT FOR 100 NS;
			
		END LOOP;
		
		file_close(ARCH_IN);  -- cierra el archivo
		file_close(ARCH_OUT);  -- cierra el archivo

      wait;
   end process;

END;
