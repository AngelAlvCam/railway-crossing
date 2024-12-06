-- Proyecto 2
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity proyecto2 is
	port(
		clk: in std_logic;
		rotar: in std_logic;
		mov_motor: out std_logic_vector(3 downto 0)
	);
end entity;

architecture arch_proyecto2 of proyecto2 is
signal estado: std_logic_vector(3 downto 0);	-- Estado de la ALU automatizada
signal enable: std_logic; -- Activa al motor por un momento, es la salida trigger de 6 segundos
signal dir: std_logic;	-- Dirección de rotación actual (abrir o cerrar)
begin 
	U2: entity work.contseg(arch_contseg) generic map(4) port map(clk, rotar, enable);	
	U3: entity work.dir_rot(arch_dir_rot) port map(clk, enable, dir);	-- Máquina de estados que establece dirección en función del estado actual
	U4: entity work.ALUauto(arch_alu) generic map(100000) port map(clk, '0', '0', "000", "000", open, open, estado);	-- Siempre está activo este autómata
	U5: entity work.rom(arch_rom) port map(enable, dir & estado, mov_motor);
end architecture;