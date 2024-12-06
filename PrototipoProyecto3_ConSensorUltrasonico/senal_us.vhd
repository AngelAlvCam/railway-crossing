-- Modulador de ancho de pulso
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity senal_us is
	generic(
		num: integer := 500000
	);
	port(
		clk: in std_logic;
		snl: out std_logic
	);
end entity;

architecture arch_senal_us of senal_us is
signal contador: integer range 0 to 1000000 := 0;
begin	
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (contador < num) then
				snl <= '1';	-- Lanza pulso de 1 [us] respecto a iteraciones	
			else
				snl <= '0';
			end if;
			
			if (contador = 1000000) then
				contador <= 0;
			else
				contador <= contador + 1;
			end if;
			
		end if;
	end process;
end architecture;