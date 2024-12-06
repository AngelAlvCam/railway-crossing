-- Display
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity display is
	port(
		num: in integer;
		sal: out std_logic_vector(6 downto 0)
	);
end entity;

architecture arch_display of display is
subtype digito is std_logic_vector(6 downto 0);
constant d0: digito := "1000000";
constant d1: digito := "1111001";
constant d2: digito := "0100100";
constant d3: digito := "0110000";
constant d4: digito := "0011001";
constant d5: digito := "0010010";
constant d6: digito := "0000010";
constant d7: digito := "0111000";
constant d8: digito := "0000000";
constant d9: digito := "0011000";
constant dN: digito := "1111111";
begin
	with num select sal <=
		d0 when 0,
		d1 when 1,
		d2 when 2,
		d3 when 3,
		d4 when 4,
		d5 when 5,
		d6 when 6,
		d7 when 7,
		d8 when 8,
		d9 when 9,
		dN when others;
end architecture;