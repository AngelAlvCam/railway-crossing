-- Módulo triggger
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;


entity triggger is
	generic(
		seg: integer := 5 -- Debe ser menor a 20
	);
	port(
		clk0, clk: in std_logic;
		disparar: in std_logic;
		snl: out std_logic;
		num: out integer
	);
end entity;

architecture arch of triggger is
signal conteo: integer range 0 to 20;
signal disparo: std_logic;
signal fin_senal: std_logic;
begin
	process(clk0,disparar,fin_senal)
	begin
		if (rising_edge(clk0)) then
			if (disparar = '1') then
				disparo <= '1';
			elsif (fin_senal = '1') then
				disparo <= '0';
			end if;
		end if;
	end process;
	
	process(clk,disparo)
	begin
		if (rising_edge(clk)) then
			if (disparo = '1') then
				snl <= '1';
				conteo <= conteo + 1;
				if (conteo < seg) then
					fin_senal <= '0';
				else
					fin_senal <= '1';
					conteo <= 0;
				end if;
			else
				snl <= '0';
				conteo <= 0;
			end if;
		end if;
		num <= conteo;
	end process;
	
end architecture;