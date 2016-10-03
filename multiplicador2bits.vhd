library IEEE;
use ieee.std_logic_1164.all;
entity multi is
port(a,b:in std_logic_vector (1 downto 0);
	so, c1, s2, s3, s1:out std_logic
	);
attribute pin_numbers of multi:entity is
"a(0):1 " & "a(1):2 " & "b(0):3 " & "b(1):4 " & "so:18 " & "s1:19 " & "s2:20 " & "s3:21 " & "c1:15 ";

end multi;
architecture ar_multi of multi is
begin 

so<=a(0) and b(0);
s1<=(a(1) and b(0)) xor (a(0) and b(1));
c1<=(a(1) and b(0)) and (a(0) and b(1));
s2<=c1 xor(a(1) and b(1));
s3<=c1 and (a(1) and b(1));

end ar_multi;

