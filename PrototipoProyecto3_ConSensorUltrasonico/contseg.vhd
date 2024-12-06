-- TOP
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;
entity contseg is
	generic(
		seg: integer := 5
	);
	port(
		clk: in std_logic;
		iniciar_cuenta: in std_logic;
		contando: buffer std_logic
	);
end entity;

architecture arch_contseg of contseg is
signal clkl: std_logic;
signal seg_contados: std_logic;
signal num: integer;
begin
	U1: entity work.divf(arch_divf) port map('0', clk, clkl);
	U2: entity work.triggger(arch) generic map(seg) port map(clk, clkl, iniciar_cuenta, contando, num);
end architecture;