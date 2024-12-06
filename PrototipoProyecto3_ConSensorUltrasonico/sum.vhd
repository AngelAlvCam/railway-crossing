-- Sumador de dos números binarios de 3 bits.
-- Alumno: Angel Alvarado Campos

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity sum is
	port(
		A, B: in STD_LOGIC_VECTOR(2 downto 0);	-- Operandos A y B de 3 bits
		c_in: in STD_LOGIC;	-- Bit de acarreo de entrada
		sal_sum: out STD_LOGIC_VECTOR (2 downto 0); -- salida de 3 bits
		c_out: out STD_LOGIC -- Bit de acarreo de salida
	);
end entity;


architecture arch_sum of sum is
signal mid_sal: STD_LOGIC_VECTOR(3 downto 0);	-- Salida intermedia de 4 bits
begin
	mid_sal <= ('0' & A) + ('0' & B) + c_in;
	sal_sum <= mid_sal(2 downto 0);	-- Se toman los 3 bits menos significativos de mid
	c_out <= mid_sal(3); -- Se toma al bit menos significativo de mid
end architecture;