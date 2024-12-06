-- Multiplexor 2x1: Selector de modo de ALU, lógico o aritmético
-- Alumno: Angel Alvarado Campos

library IEEE;
use IEEE.STD_LOGIC_1164.all;


entity mux2x1 is
	port(
		sal_ua, sal_ul: in std_logic_vector(2 downto 0); -- Salidas de UA y UL, de 3 bits
		cout_ua, cout_ul: in std_logic;
		sel_mode: in std_logic; -- Bit de selección de modo, lógico o aritmético
		sal_mux: out std_logic_vector(2 downto 0); -- Salida seleccionada dentro del módulo, lógica o aritmética de 3 bits
		cout_mux: out std_logic
	);
end entity;

architecture arch_mux2x1 of mux2x1 is
begin
	with sel_mode select
		sal_mux <= sal_ua when '0',	-- Selecciona salida de unidad aritmética
					  sal_ul when '1';	-- Selecciona salida de unidad lógica
					  
	with sel_mode select
		cout_mux <= cout_ua when '0',
						cout_ul when '1';

end architecture;