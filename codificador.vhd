library ieee;
use ieee.std_logic_1164.all;

entity codificador is
	port(
		I	: in std_logic_vector(9 downto 0);
		O	: out std_logic_vector(3 downto 0)
	);
end codificador;

architecture ar_codificador of codificador is
begin
	O <= "1001" when I(0) = '1' else
    	 "0001" when I(1) = '1' else
		 "1110" when I(2) = '1' else
		 "0110" when I(3) = '1' else
		 "1010" when I(4) = '1' else
		 "0010" when I(5) = '1' else
		 "1100" when I(6) = '1' else
		 "0100" when I(7) = '1' else
		 "1000" when I(8) = '1' else
		 "0000" when I(9) = '1' else
		 "1111";
end ar_codificador;
