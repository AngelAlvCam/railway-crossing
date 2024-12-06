-- Unidad aritmética lógica
-- MODIFICACION: Se añadió la salida "sal_estados"

library ieee;
use ieee.std_logic_1164.all;

entity ALUauto is
	generic(
		num_divisor: integer := 25000000
	);
	port(
		clk, reset, pausa: in std_logic;
		A,B: in std_logic_vector(2 downto 0);	-- Operandos A y B de la ALU, no se usan por los valores fijos
		c_out: out std_logic;	-- bit de acarreo de salida
		sal_alu: out std_logic_vector(2 downto 0); -- Salida de la operación entre A y B
		sal_estados: out std_logic_vector(3 downto 0)
	);
end entity;

architecture arch_alu of ALUauto is
signal clk_l: std_logic;	-- Reloj lento
signal sel: std_logic_vector(3 downto 0);	-- Salida, máquina de estados para automatizar alu
begin
	U1: entity work.divf(arch_divf) generic map(num_divisor) port map('0', clk, clk_l);
	U2: entity work.maquina_ALUauto(arch_maquina_ALUauto) port map(clk_l, reset, pausa, sel);	-- Automatización de ALU respecto a selector y cin en ALU
	U3: entity work.ALU(arch_ALU) port map("100", "011", sel(3), sel(2 downto 0), c_out, sal_alu);
	
	sal_estados <= sel;	-- MODIFICACIÓN REALIZADA PARA EL PROYECTO 2
end architecture;