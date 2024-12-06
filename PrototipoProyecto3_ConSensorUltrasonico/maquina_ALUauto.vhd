-- Máquina de estados: Automatización de ALU
-- Máquina de 4 bits, entonces max. 16 estados
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity maquina_ALUauto is
	port(
		clk, reset, pausa: in std_logic;
		sal: out std_logic_vector(3 downto 0)
	);
end entity;

architecture arch_maquina_ALUauto of maquina_ALUauto is
subtype estado is std_logic_vector(3 downto 0);
constant s0: estado := "0000";
constant s1: estado := "0001";
constant s2: estado := "0010";
constant s3: estado := "0011";
constant s4: estado := "0100";
constant s5: estado := "0101";
constant s6: estado := "0110";
constant s7: estado := "0111";
constant s8: estado := "1000";
constant s9: estado := "1001";
constant s10: estado := "1010";
constant s11: estado := "1011";
constant s12: estado := "1100";
constant s13: estado := "1101";
constant s14: estado := "1110";
constant s15: estado := "1111";
signal estado_actual, estado_siguiente: estado := s0;
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			if (reset = '1') then	-- Si reset está activado, se mantiene en estado s0
				estado_actual <= s0;
			elsif (pausa = '1') then
				estado_actual <= estado_actual;
			else
				estado_actual <= estado_siguiente;
			end if;
		end if;
	end process;
	
	process(estado_actual)
	begin
		case estado_actual is
			when s0 => estado_siguiente <= s1;
			when s1 => estado_siguiente <= s2;
			when s2 => estado_siguiente <= s3;
			when s3 => estado_siguiente <= s4;
			when s4 => estado_siguiente <= s5;
			when s5 => estado_siguiente <= s6;
			when s6 => estado_siguiente <= s7;
			when s7 => estado_siguiente <= s8;
			when s8 => estado_siguiente <= s9;
			when s9 => estado_siguiente <= s10;
			when s10 => estado_siguiente <= s11;
			when s11 => estado_siguiente <= s12;
			when s12 => estado_siguiente <= s13;
			when s13 => estado_siguiente <= s14;
			when s14 => estado_siguiente <= s15;
			when s15 => estado_siguiente <= s0;
			when others => estado_siguiente <= s0; -- Nunca se llega a este caso
		end case;
		sal <= estado_actual;	-- La salida de cada estado es la misma codificación de 4 bits del estado en sí
	end process;
end architecture;