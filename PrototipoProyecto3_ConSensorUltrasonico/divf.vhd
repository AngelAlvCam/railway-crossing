-- Divisor de frecuencia
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity divf is
	generic(
		num: integer := 25000000
	);
	port(
		pausa: in std_logic;	-- Función de pausa
		clk: in std_logic;
		clk_div: buffer std_logic	-- Salida: Frecuencia dividida
	);
end entity;

architecture arch_divf of divf is
signal contador: integer range 0 to num := 0;
begin
	divisor: process(clk)
	begin
		if (rising_edge(clk)) then
			if (pausa = '0') then	-- Si la pausa está en nivel bajo
				if (contador = num) then
					contador <= 0;
					clk_div <= not clk_div;
				else
					contador <= contador + 1;
				end if;
			end if;
		end if;
	end process;
end architecture;