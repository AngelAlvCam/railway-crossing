-- TOP sensores
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;
USE ieee.numeric_std.all; 

entity sensores is
	port(
		clk: in std_logic; -- Señal de reloj de entrada
		sensor1, sensor2: in std_logic;
		rotar: buffer std_logic
	);
end entity;

architecture arch_sensores of sensores is
signal clkl: std_logic;
begin
	U1: entity work.divf(arch_divf) port map('0',clk,clkl);
	U2: entity work.maquina_sensores(arch_maquina_sensores) port map(clkl,sensor1,sensor2,rotar);
end architecture;