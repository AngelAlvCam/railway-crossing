-- Salida a display de 7 segmentos
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity display_us is
port(
	num: in integer;
	D1, D0: out std_logic_vector(6 downto 0)
);
end entity; 

architecture arch_display_us of display_us is
subtype digito is std_logic_vector(6 downto 0);
constant dig0: digito := "1000000";
constant dig1: digito := "1111001";
constant dig2: digito := "0100100";
constant dig3: digito := "0110000";
constant dig4: digito := "0011001";
constant dig5: digito := "0010010";
constant dig6: digito := "0000010";
constant dig7: digito := "0111000";
constant dig8: digito := "0000000";
constant dig9: digito := "0011000";
constant digNULL: digito := "1111111";

begin
	process(num)
	begin
		if (num >= 117 and num < 176) then	-- Distancia 2
			D1 <= digNULL;
			D0 <= dig2;
		elsif (num >= 176 and num < 235) then	-- Distancia 3
			D1 <= digNULL;
			D0 <= dig3;
		elsif (num >= 235 and num < 294) then	-- Distancia 4
			D1 <= digNULL;
			D0 <= dig4;
		elsif (num >= 294 and num < 352) then	-- Distancia 5
			D1 <= digNULL;
			D0 <= dig5;
		elsif (num >= 352 and num < 411) then	-- Distancia 6
			D1 <= digNULL;
			D0 <= dig6;
		elsif (num >= 411 and num < 470) then	-- Distancia 7
			D1 <= digNULL;
			D0 <= dig7;
		elsif (num >= 470 and num < 529) then	-- Distancia 8
			D1 <= digNULL;
			D0 <= dig8;
		elsif (num >= 529 and num < 588) then	-- Distancia 9
			D1 <= digNULL;
			D0 <= dig9;
		elsif (num >= 588 and num < 647) then	-- Distancia 10
			D1 <= dig1;
			D0 <= dig0;
		elsif (num >= 647 and num < 705) then	-- Distancia 11
			D1 <= dig1;
			D0 <= dig1;
		elsif (num >= 705 and num < 764) then	-- Distancia 12
			D1 <= dig1;
			D0 <= dig2;
		elsif (num >= 764 and num < 823) then	-- Distancia 13
			D1 <= dig1;
			D0 <= dig3;
		elsif (num >= 823 and num < 832) then	-- Distancia 14
			D1 <= dig1;
			D0 <= dig4;
		elsif (num >= 832 and num < 941) then	-- Distancia 15
			D1 <= dig1;
			D0 <= dig5;
		elsif (num >= 941 and num < 1000) then	-- Distancia 16
			D1 <= dig1;
			D0 <= dig6;
		elsif (num >= 1000 and num < 1058) then	-- Distancia 17
			D1 <= dig1;
			D0 <= dig7;
		elsif (num >= 1058 and num < 1117) then	-- Distancia 18
			D1 <= dig1;
			D0 <= dig8;
		elsif (num >= 1117 and num < 1176) then	-- Distancia 19
			D1 <= dig1;
			D0 <= dig9;
		elsif (num >= 1176 and num < 1235) then	-- Distancia 20
			D1 <= dig2;
			D0 <= dig0;
		else
			D1 <= digNULL;
			D0 <= digNULL;
		end if;
	end process;

end architecture;