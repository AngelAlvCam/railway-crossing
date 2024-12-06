-- TOP de proyecto 3
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity proyecto3 is
	port(
		clk:	in std_logic; 
		echo1,echo2: in std_logic;	-- echo sensor
		trigger1,trigger2: buffer std_logic;	-- Trigger sensor
		mov_motor: out std_logic_vector(3 downto 0);	-- Vector de movimiento del motor
		led1,led2: out std_logic
	);
end entity;

architecture arch_proyecto3 of proyecto3 is
signal sensor1,sensor2: std_logic;	-- Distancia de lectura de sensores con T = 588 [μs] -> D ~ 5 [cm]
signal rotar: std_logic;
begin
	U1: entity work.control_sensor_us(arch) generic map(588) port map(clk,echo1,trigger1,sensor1,open,open);
	U2: entity work.control_sensor_us(arch) generic map(588) port map(clk,echo2,trigger2,sensor2,open,open);
	U3: entity work.sensores(arch_sensores) port map(clk,sensor1,sensor2,rotar);
	U4: entity work.proyecto2(arch_proyecto2) port map(clk,rotar,mov_motor);
	led1 <= sensor1;
	led2 <= sensor2;
end architecture;	