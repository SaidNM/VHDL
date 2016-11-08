library IEEE;
use ieee.std_logic_1164.all;
entity hamming is
port(a:in std_logic_vector (3 downto 0);
	co, c1, c2, A, B, C, D:out std_logic
	);
attribute pin_numbers of hamming:entity is
"a(0):1 " & "a(1):2 " & "a(2):3 " & "a(3):4 " & "D:15 " & "C:16 " & "B:17 " & "c2:18 " & "A:19 " & "c1:20 "& "c0: 21";

end hamming;
architecture ar_hamming of hamming is
begin 

co<=((not a(3)) and a(2)) or (a(2) and a(0)) or ((not a(3)) and a(0));
c1<= a(3) xor a(1) xor a(0);
A<= a(3);
c2<= ((not a(1)) and a(0)) or (a(2) and (not a(1))) or (a(2) and (0));
B<= a(2);
C<= a(1);
D<= a(0);
end ar_hamming;
