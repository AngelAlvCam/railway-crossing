-- Maquina de estados para control de activación de sensores
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;

entity maquina_sensores is
	port(
		clk: in std_logic; -- Señal de reloj de entrada
		sensor1, sensor2: in std_logic;
		rotar: out std_logic
	);
end entity;

architecture arch_maquina_sensores of maquina_sensores is
subtype estado is std_logic_vector(2 downto 0);
constant s0: estado := "000";
constant s1: estado := "001";
constant s2: estado := "010";
constant s3: estado := "011";
constant s4: estado := "100";
signal estado_actual, estado_siguiente: estado := "000";
begin
	process(clk)
	begin
		if (rising_edge(clk)) then
			estado_actual <= estado_siguiente;
		end if;
	end process;
	
	process(estado_actual, sensor1, sensor2)
	begin
		case estado_actual is
			when s0 =>
				if (sensor1 = '1' and sensor2 = '0') then
					estado_siguiente <= s1;
					rotar <= '1';
				else 
					estado_siguiente <= s0;
					rotar <= '0';
				end if;
				
			when s1 =>
				rotar <= '0';
				if (sensor1 = '1' and sensor2 = '1') then
					estado_siguiente <= s2;
				elsif (sensor1 = '0' and sensor2 = '0') then
					estado_siguiente <= s3;
				else
					estado_siguiente <= s1;
				end if;
				
			when s2 =>
				rotar <= '0';
				if (sensor1 = '0' and sensor2 = '1') then
					estado_siguiente <= s4;
				else
					estado_siguiente <= s2;
				end if;
				
			when s3 =>
				rotar <= '0';
				if (sensor1 = '0' and sensor2 = '1') then
					estado_siguiente <= s4;
				else
					estado_siguiente <= s3;
				end if;
			
			when s4 => 
				if (sensor1 = '0' and sensor2 = '0') then
					rotar <= '1';
					estado_siguiente <= s0;
				else
					rotar <= '0';
					estado_siguiente <= s4;
				end if;
			
			when others =>
				estado_siguiente <= s0;
				rotar <= '0';
		
		end case;
	end process;
end architecture;