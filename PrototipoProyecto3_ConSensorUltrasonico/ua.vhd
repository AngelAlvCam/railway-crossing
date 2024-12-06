-- Unidad aritmética
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity ua is
	port(
		A,B: in std_logic_vector(2 downto 0);	-- Operandos A y B de 3 bits
		c_in: in std_logic;	-- Bit de acarreo de entrada
		sel_op: in std_logic_vector(1 downto 0);	-- Selector de operación de 2 bits
		sal_ua: out std_logic_vector(2 downto 0); -- Salida de operación entre A y B
		c_out: out std_logic	-- Bit de acarreo de salida
	);
end entity;

architecture arch_ua of ua is
signal mod_B: std_logic_vector(2 downto 0);
begin
	U1: entity work.mux4x1(arch_mux4x1) port map(B, sel_op, mod_B);
	U2: entity work.sum(arch_sum) port map(A, mod_B, c_in, sal_ua, c_out);
end architecture;