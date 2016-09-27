library ieee;
use ieee.std_logic_1164.all;
entity suma is 
	port(
		A,B: in std_logic_vector(3 downto 0);
		S: out std_logic_vector(3 downto 0);
		Cin: in std_logic;
		Cout: out std_logic
		);

attribute pin_numbers of suma: entity is
"A(0):1 " & "A(1):2 " & "A(2):3 " & "A(3):4 " & "B(0):5 " & "B(1):6 " & "B(2):7 " & "B(3):8 ";
end suma;
architecture arqsuma of suma is
signal C:std_logic_vector(3 downto 0);
begin
	C(0)<=Cin;
	S(0)<=A(0) xor B(0) xor C(0);
	C(1)<=(A(0) and B(0))or (C(0) and (A(0) or B(0)));
	S(1)<= A(1) xor B(1) xor C(1);
	C(2)<=(A(1)and B(1)) or (C(1) and (A(1) or B(1)));
	S(2)<= A(2) xor B(2) xor C(2);
	C(3)<=(A(2) and B(2))or(C(2) and (A(2) or B(2)));
	S(3)<= A(3) xor B(3) xor C(3);
	Cout<=(A(3) and B(3))or(C(3) and (A(3) or B(3)));
end arqsuma;