-- Unidad aritmética lógica
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port(
		A, B: in std_logic_vector(2 downto 0);	-- Operando A de 3 bits
		c_in: in std_logic;	-- bit de acarreo de entrada
		sel_op: in std_logic_vector(2 downto 0);	-- Selector de modo de operación y operación en sí
		c_out: out std_logic;	-- bit de acarreo de salida
		sal_alu: out std_logic_vector(2 downto 0) -- Salida de la operación entre A y B
	);
end entity;

architecture arch_ALU of ALU is
signal mid_ua, mid_ul: std_logic_vector(2 downto 0);
signal mid_cout_ua, mid_cout_ul: std_logic;
begin
	U1: entity work.ua(arch_ua) port map(A, B, c_in, sel_op(1 downto 0), mid_ua, mid_cout_ua);
	U2: entity work.ul(arch_ul) port map(A, B, sel_op(1 downto 0), mid_ul, mid_cout_ul);
	U3: entity work.mux2x1(arch_mux2x1) port map(mid_ua, mid_ul, mid_cout_ua, mid_cout_ul, sel_op(2), sal_alu, c_out);
end architecture;