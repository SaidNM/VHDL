library ieee;
use ieee.std_logic_1164.all;

entity decod is
 	port(A: in std_logic_vector(3 downto 0);
		B:out std_logic_vector(6 downto 0));

attribute pin_numbers of decod: entity is 
"A(0):1 A(1):2 A(2):3 A(3):4 " & "B(0):14 B(1):15 B(2):16 B(3):17 B(4):18 B(5):19 B(6):20 ";


end decod;

architecture arq_deco of decod is 
begin 
process(A)begin
	case A is
	when "0000"=>B<="0000001";
	when "0001"=>B<="1001111";
	when "0010"=>B<="0010010";
	when "0011"=>B<="0000110";
	when "0100"=>B<="1001100";
	when "0101"=>B<="0100100";
	when "0110"=>B<="0100000";
	when "0111"=>B<="0001110";
	when "1000"=>B<="0000000";
	when "1001"=>B<="0000100";
	when "1010"=>B<="0001000";
	when "1011"=>B<="1100000";
	when "1100"=>B<="0110001";
	when "1101"=>B<="1000010";
	when "1110"=>B<="0110000";
	when "1111"=>B<="0111000";
	when others=>B<="1111111";
	end case;
end process;
end arq_deco;
