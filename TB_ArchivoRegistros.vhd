--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:46:37 10/22/2017
-- Design Name:   
-- Module Name:   C:/Users/saidn/Downloads/Practica-5/Xor4/ArchivoRegistros/TB_ArchivoRegistros.vhd
-- Project Name:  ArchivoRegistros
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: archivoRegistros
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
USE ieee.std_logic_UNSIGNED.ALL;
USE ieee.std_logic_ARITH.ALL;
LIBRARY STD;
USE STD.TEXTIO.ALL;
USE ieee.std_logic_TEXTIO.ALL;

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY TB_ArchivoRegistros IS
END TB_ArchivoRegistros;
 
ARCHITECTURE behavior OF TB_ArchivoRegistros IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT archivoRegistros
    PORT(
         CLK : IN  std_logic;
         SHE : IN  std_logic;
         WR : IN  std_logic;
         DIR : IN  std_logic;
         SHAMT : IN  std_logic_vector(3 downto 0);
         ADDR_WR : IN  std_logic_vector(3 downto 0);
         ADDR_RDR1 : IN  std_logic_vector(3 downto 0);
         ADDR_RDR2 : IN  std_logic_vector(3 downto 0);
         WDATA : IN  std_logic_vector(15 downto 0);
         RDATA1 : INOUT  std_logic_vector(15 downto 0);
         RDATA2 : OUT  std_logic_vector(15 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal SHE : std_logic := '0';
   signal WR : std_logic := '0';
   signal DIR : std_logic := '0';
   signal SHAMT : std_logic_vector(3 downto 0) := (others => '0');
   signal ADDR_WR : std_logic_vector(3 downto 0) := (others => '0');
   signal ADDR_RDR1 : std_logic_vector(3 downto 0) := (others => '0');
   signal ADDR_RDR2 : std_logic_vector(3 downto 0) := (others => '0');
   signal WDATA : std_logic_vector(15 downto 0) := (others => '0');

	--BiDirs
   signal RDATA1 : std_logic_vector(15 downto 0);

 	--Outputs
   signal RDATA2 : std_logic_vector(15 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: archivoRegistros PORT MAP (
          CLK => CLK,
          SHE => SHE,
          WR => WR,
          DIR => DIR,
          SHAMT => SHAMT,
          ADDR_WR => ADDR_WR,
          ADDR_RDR1 => ADDR_RDR1,
          ADDR_RDR2 => ADDR_RDR2,
          WDATA => WDATA,
          RDATA1 => RDATA1,
          RDATA2 => RDATA2
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
	file ARCH_OUT : TEXT;
	variable LINEA_OUT  : line;	
	variable VAR_RD1	  : STD_LOGIC_VECTOR(15 downto 0);
	variable VAR_RD2	  : STD_LOGIC_VECTOR(15 downto 0);	
	variable CADENA : STRING(1 to 4);
--	
	file ARCH_IN : TEXT;
	variable LINEA_IN : line;
	variable VAR_RR1 	  : INTEGER RANGE 0 TO 15;
	variable VAR_RR2 	  : INTEGER RANGE 0 TO 15;
	variable VAR_SH  	  : INTEGER RANGE 0 TO 15;
	variable VAR_WREG	  : INTEGER RANGE 0 TO 15;
	variable VAR_WD	  : STD_LOGIC_VECTOR(15 downto 0);
	variable VAR_WR	  : STD_LOGIC;
	variable VAR_SHE	  : STD_LOGIC;
	variable VAR_DIR	  : STD_LOGIC;

   begin		
		file_open(ARCH_IN, "ENTRADAS.TXT", READ_MODE); 	
		file_open(ARCH_OUT, "RESULTADO.TXT", WRITE_MODE); 	

		CADENA := " RR1";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RR1"
		CADENA := " RR2";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RR2"
		CADENA := "  SH";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "  SH"
		CADENA := "WREG";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " WREG"
		CADENA := "  WD";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " WD"
		CADENA := "  WR";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA "  WR"
		CADENA := " SHE";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " SHE"
		CADENA := " DIR";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " DIR"
		CADENA := " RD1";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RD1"
		CADENA := " RD2";
		write(LINEA_OUT, CADENA, right, CADENA'LENGTH+1);	--ESCRIBE LA CADENA " RD2"
		writeline(ARCH_OUT,LINEA_OUT);-- escribe la linea en el archivo

		WAIT FOR 100 NS;

		FOR I IN 0 TO 8 LOOP
			readline(ARCH_IN,LINEA_IN); -- lee una linea completa
			read(LINEA_IN, VAR_RR1);
			ADDR_RDR1 <= CONV_STD_LOGIC_VECTOR(VAR_RR1,4);
			read(LINEA_IN,VAR_RR2);
			ADDR_RDR2 <= CONV_STD_LOGIC_VECTOR(VAR_RR2,4);
			read(LINEA_IN,VAR_SH);
			SHAMT <= CONV_STD_LOGIC_VECTOR(VAR_SH,4);
			read(LINEA_IN,VAR_WREG);
			ADDR_WR <= CONV_STD_LOGIC_VECTOR(VAR_WREG,4);
			Hread(LINEA_IN,VAR_WD);
			WDATA <= VAR_WD;
			read(LINEA_IN,VAR_WR);
			WR <= VAR_WR;
			read(LINEA_IN,VAR_SHE);
			SHE <= VAR_SHE;
			read(LINEA_IN,VAR_DIR);
			DIR <= VAR_DIR;
			WAIT UNTIL RISING_EDGE(CLK);	--ESPERO AL FLANCO DE SUBIDA 
			
			Hwrite(LINEA_OUT,CONV_STD_LOGIC_VECTOR(VAR_RR1,4),right,5);
			Hwrite(LINEA_OUT,CONV_STD_LOGIC_VECTOR(VAR_RR2,4),right,5);
			Hwrite(LINEA_OUT,CONV_STD_LOGIC_VECTOR(VAR_SH,4),right,5);
			Hwrite(LINEA_OUT,CONV_STD_LOGIC_VECTOR(VAR_WREG,4),right,5);
			Hwrite(LINEA_OUT,VAR_WD,right,5);
			write(LINEA_OUT,VAR_WR,right, 5);
			write(LINEA_OUT,VAR_SHE,right, 5);
			write(LINEA_OUT,VAR_DIR,right, 5);
			VAR_RD1:=RDATA1;
			Hwrite(LINEA_OUT,VAR_RD1,right,5);
			VAR_RD2:=RDATA2;
			Hwrite(LINEA_OUT,VAR_RD2,right,5);
			writeline(ARCH_OUT,LINEA_OUT);-- escribe la linea en el archivo
		end loop;
		file_close(ARCH_IN);  -- cierra el archivo
		file_close(ARCH_OUT);  -- cierra el archivo

      wait;
   end process;

END;
