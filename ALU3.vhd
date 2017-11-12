----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:06:53 09/11/2017 
-- Design Name: 
-- Module Name:    ALU3 - Behavioral 
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

entity ALU3 is
	 GENERIC( N : INTEGER := 4 );
    Port ( A : in  STD_LOGIC_VECTOR (N-1 downto 0);
           B : in  STD_LOGIC_VECTOR (N-1 downto 0);
           binvert : in  STD_LOGIC;
           ainvert : in  STD_LOGIC;
           OP : in  STD_LOGIC_VECTOR (1 downto 0);
           res : out  STD_LOGIC_VECTOR (N-1 downto 0);
           cN : out  STD_LOGIC;
           bn : out  STD_LOGIC;
           bc : out  STD_LOGIC;
           bz : out  STD_LOGIC;
           bov : out  STD_LOGIC);
end ALU3;

architecture Behavioral of ALU3 is

begin

	AL:process(A, B, binvert, ainvert, OP)
	variable MUXA, MUXB, p, g: std_logic_vector (N-1 downto 0):="0000";
   variable c : std_logic_vector (N downto 0):="00000";
	variable pk,pi,t2,t3: std_logic;
	variable z,neg: std_logic;
	begin
	c:=(OTHERS=>'0'); -- todo el tamaño de c es 0 sin importar el tamaño ideal para generic (parametrizar)
	p:= (OTHERS=>'0'); -- estos valores se utilizan en la suma
	g:= (OTHERS=>'0');
	c(0):= binvert;
	z:='0';
	for i in 0 to N-1 loop 
	 	MUXA(i):= A(i) xor ainvert;
	 	MUXB(i):= B(i) xor binvert;
	   case op is
	   when "00" => 
	   		res(i)<= MUXA(i) and MUXB(i);
				z:=z or (MUXA(i) and MUXB(i));
				if(i=N-1)then
					neg:= MUXA(i) and MUXB(i);
				else 
					neg:='0';
				end if;
				
	   when "01" => 
	   		res(i)<= MUXA(i) or MUXB(i);
	   		z:=z or (MUXA(i) or MUXB(i));
				if(i=N-1)then
					neg:= MUXA(i) or MUXB(i);
				else 
					neg:='0';
				end if;
	   when "10" => 
	   		res(i)<= MUXA(i) xor MUXB(i);
	   		z:=z or (MUXA(i) xor MUXB(i));
				if(i=N-1)then
					neg:= MUXA(i) xor MUXB(i);
				else 
					neg:='0';
				end if;
	   when others=>

		p(i):= MUXA(i) xor MUXB(i);
		g(i):=MUXA(i) and MUXB(i);
		res(i) <= MUXA(i) xor MUXB(i) xor c(i);
		z:=z or (MUXA(i) xor MUXB(i) xor c(i)); --bandera z
		if(i=N-1)then
					neg:= MUXA(i) xor MUXB(i) xor c(i);
				else 
					neg:='0';
		end if;
		t2:='0';
		for j in 0 to i-1 loop
			pk:='1';
			for k in j+1 to i loop
				pk:=pk and p(k);
			end loop;
			t2:= (t2 or (g(j) and pk));
		end loop;
		pi:='1';
		t3:='1';
		for l in 0 to i loop
				pi:= pi and p(l);
		end loop;
		t3:= c(0)and pi;
		c(i+1):= (g(i) or t2 or t3);
	  end case;
	end loop;
	cN <= c(N);

	bn <= neg;------
	bz <= not z;----bien
	bc <= c(N);----bien
	bov <= c(N) xor c(N-1);------ bien
	end process AL;


end Behavioral;

