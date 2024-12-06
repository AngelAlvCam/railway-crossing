-- Memoria
-- Módulo creado para este proyecto
-- Alumno: Angel Alvarado Campos

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity rom is
	port(
		cs: in std_logic;	-- Switch para activar memoria
		bus_dir: in std_logic_vector(4 downto 0);	-- Bit_direccion & estado_ALU_auto
		bus_datos: out std_logic_vector(3 downto 0) -- Vectores de salida de 4 bits
	);
end entity;

architecture arch_rom of rom is
subtype paso is std_logic_vector(3 downto 0);
constant p1: paso := "1000";	-- Paso 1
constant p2: paso := "1100";	-- Paso 2
constant p3: paso := "0100";	-- Paso 3
constant p4: paso := "0110";	-- Paso 4
constant p5: paso := "0010";	-- Paso 5
constant p6: paso := "0011";	-- Paso 6
constant p7: paso := "0001";	-- Paso 7
constant p8: paso := "1001";	-- Paso 8
type memoria is array(31 downto 0) of paso;
constant mem_rom: memoria := (p1,p2,p3,p4,p5,p6,p7,p8,
										p1,p2,p3,p4,p5,p6,p7,p8,
										p1,p8,p7,p6,p5,p4,p3,p2,
										p1,p8,p7,p6,p5,p4,p3,p2);
signal dato: paso;
begin
	process(bus_dir)
	begin
		dato <= mem_rom(conv_integer(bus_dir));
	end process;
	
	process(cs, dato)
	begin
		if (cs = '1') then	-- Si el switch de memoria está activado
			bus_datos <= dato;
		else
			bus_datos <= (others => 'Z');
		end if;
	end process;
end architecture;