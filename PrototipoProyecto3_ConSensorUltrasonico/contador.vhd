-- Contador
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity contador is
	port(
		clk: in std_logic;
		incremento: in std_logic;
		cuenta: out integer
	);
end entity;

architecture arch_contador of contador is
signal cont: integer range 0 to 10 := 0;
begin
	process(clk, incremento)
	begin
		if (rising_edge(clk)) then
			if (incremento = '1') then
				if (cont < 9) then
					cont <= cont + 1;
				else
					cont <= 0;
				end if;
				cuenta <= cont;
			end if;
		end if;
	end process;

end architecture;