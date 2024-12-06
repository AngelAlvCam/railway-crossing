-- Multiplexor 4x1: Modifica al valor del operando B
-- Alumno: Angel Alvarado Campos

library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity mux4x1 is
	port(
		B: in STD_LOGIC_VECTOR(2 downto 0);	-- B es un num. de 3 bits
		sel_op: in STD_LOGIC_VECTOR(1 downto 0);	-- selector de operación de 2 bits
		mod_B: out STD_LOGIC_VECTOR(2 downto 0)	-- Salida del multiplexor
	);
end entity;


architecture arch_mux4x1 of mux4x1 is
begin
	with sel_op select
		mod_B <= (others => '0') when "00",	-- Salida = "111"
						not B when "01",	-- Salida = B complemento 1
						B when "10",	-- Salida = B
						(others => '1') when others;	-- Salida = "000"
end architecture;