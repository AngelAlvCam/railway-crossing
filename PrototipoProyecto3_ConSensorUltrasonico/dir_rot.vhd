-- Autómara dirección de rotación
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity dir_rot is 
	port(
		clk: in std_logic; -- Señal de reloj de entrada de 50 MHz
		enable: in std_logic;
		dir: out std_logic
	);
end entity;

architecture arch_dir_rot of dir_rot is
subtype estado is std_logic_vector(1 downto 0);
constant s0: estado := "00";
constant s1: estado := "01";
constant s2: estado := "10";
constant s3: estado := "11";
signal estado_actual, estado_siguiente: estado;
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			estado_actual <= estado_siguiente;
		end if;
	end process;
	
	process(estado_actual)
	begin
		case estado_actual is
			when s0 =>
				if (enable = '1') then
					estado_siguiente <= s1;
					dir <= '1'; 
				else
					estado_siguiente <= s0;
				end if;
			
			when s1 =>
				if (enable = '0') then
					estado_siguiente <= s2;
				else
					estado_siguiente <= s1;
					dir <= '1';
				end if;
				
			when s2 =>
				if (enable = '1') then
					estado_siguiente <= s3;
					dir <= '0';
				else
					estado_siguiente <= s2;
				end if;
				
			when s3 =>
				if (enable = '0') then
					estado_siguiente <= s0;
				else
					estado_siguiente <= s3;
					dir <= '0';
				end if;
		end case;
		
	end process;
	
end architecture;