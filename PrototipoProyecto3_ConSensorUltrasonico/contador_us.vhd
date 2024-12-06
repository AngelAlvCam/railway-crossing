-- contador de distancia
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity contador_us is
	generic(
		lim: integer := 1235
	);
	port(
		clk: in std_logic;	-- Reloj
		trigger,echo: in std_logic;
		salida: out std_logic;
		distancia: out integer
	);
end entity;

architecture arch_contador_us of contador_us is
signal conteo: integer range 0 to 12000;	-- Conteo de distancias se hace en términos de microsegundos unitarios
signal contar: std_logic; -- '0' = no, '1' = si
begin
	process(clk,trigger,echo)
	begin
		if (trigger = '1') then
			conteo <= 0;
			salida <= '0';
			distancia <= 0;
		elsif (rising_edge(clk)) then
			if (echo = '1') then
				conteo <= conteo + 1;
			else
				if (conteo >= 117 and conteo < lim) then
					salida <= '1';
					distancia <= conteo;
				end if;
				conteo <= 0;
			end if;
		end if;
	end process;
end architecture;