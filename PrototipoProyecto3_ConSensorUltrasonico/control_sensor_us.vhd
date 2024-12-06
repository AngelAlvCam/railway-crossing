-- TOP del proyecto de control de sensor ultrasónico
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity control_sensor_us is
	generic(
		lim: integer := 1235
	);
	port(
		clk:	in std_logic; 
		echo: in std_logic;
		trigger: buffer std_logic;
		led: out std_logic;
		D1,D0: out std_logic_vector(6 downto 0)
	);
end entity;

architecture arch of control_sensor_us is
signal clk_aux: std_logic;
signal distancia: integer;

begin
	U1: entity work.divf(arch_divf) generic map(25) port map('0',clk,clk_aux);	-- Genera una señal con frecuencia de 1 [MHz] ~ T = 1 [μs]
	U2: entity work.senal_us(arch_senal_us) generic map(10) port map(clk_aux,trigger); -- Genera señal de entrada para trig en sensor u, PWM
	U3: entity work.contador_us(arch_contador_us) generic map(lim) port map(clk_aux,trigger,echo,led,distancia);	-- Se realiza el cálculo de distancia
	U4: entity work.display_us(arch_display_us) port map(distancia,D1,D0); -- Imprime la distancia en display
end architecture;