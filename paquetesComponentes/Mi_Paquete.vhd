--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package Mi_Paquete is

COMPONENT Contador is
    Port ( D : in  STD_LOGIC_VECTOR (3 downto 0);
           Q : inout  STD_LOGIC_VECTOR (3 downto 0);
           L : in  STD_LOGIC;
           I : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC);
end COMPONENT;


COMPONENT Registro is
    Port ( D : in  STD_LOGIC_VECTOR (7 downto 0);
           Q : inout  STD_LOGIC_VECTOR (7 downto 0);
           L : in  STD_LOGIC;
           SH : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC);
end COMPONENT;


COMPONENT Codigo is
    Port ( E : in  STD_LOGIC_VECTOR (3 downto 0);
           SAL : out  STD_LOGIC_VECTOR (6 downto 0));
end COMPONENT;


COMPONENT Control is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           INI : in  STD_LOGIC;
           Z : in  STD_LOGIC;
           A0 : in   STD_LOGIC;
           LA : out  STD_LOGIC;
           SH : out  STD_LOGIC;
           LB : out  STD_LOGIC;
           IB : out  STD_LOGIC;
           SD : out  STD_LOGIC);
end COMPONENT;

end Mi_Paquete;

package body Mi_Paquete is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end Mi_Paquete;
