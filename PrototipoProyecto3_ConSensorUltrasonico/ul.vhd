-- Unidad lógica
-- Alumno: Angel Alvarado Campos

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ul is
	port(
		A,B: in std_logic_vector(2 downto 0);
		sel_op: in std_logic_vector(1 downto 0);	-- Selector de modo de operación de	2 bits
		sal_ul: out std_logic_vector(2 downto 0);	-- Salida de unidad lógica de 3 bits
		c_out: out std_logic := '0'	-- Bit de acarreo de salida se anula siempre en este módulo
	);
end entity;


architecture arch_ul of ul is
begin
	with sel_op select
		sal_ul <= A and B when "00", 
					 A or B when "01",
					 A xor B when "10",
					 not A when "11";
end architecture;