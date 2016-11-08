library ieee;
use ieee.std_logic_1164.all;

entity mux is 
	port(
		A,B,C,D	: in std_logic_vector(1 downto 0);
		S		: in std_logic;
		W,X,Y,Z	: out std_logic
	);
	attribute pin_numbers of mux:entity is
	"W:14 " & "X:15 " & "Y:16 " & "Z:17 ";
end mux;

architecture ar_mux of mux is
begin
	W <= (A(0) and (not S)) or (A(1) and S);
	X <= (B(0) and (not S)) or (B(1) and S);
	Y <= (C(0) and (not S)) or (C(1) and S);
	Z <= (D(0) and (not S)) or (D(1) and S);
end ar_mux;
