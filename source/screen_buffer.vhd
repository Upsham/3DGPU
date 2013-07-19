

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity screen_buffer is 
	port(
		clk: in std_logic;
		strb_screen: in std_logic;
		screen_cor: in std_logic_vector(7 downto 0);
		X0,X1,Y0,Y1 : out std_logic_vector(7 downto 0)
		
	);
end screen_buffer;
architecture beh of screen_buffer is 
signal reg1 : std_logic_vector(31 downto 0);
 
begin
process(clk,reg1)
begin
	if rising_edge(clk) then
		if strb_screen = '1' then 
			reg1 <= reg1(23 downto 0) & screen_cor(7 downto 0);
		end if;
	end if;
end process;
X0 <= reg1 (31 downto 24);
X1 <= reg1(23 downto 16);
Y0 <= reg1(15 downto 8);
Y1 <= reg1(7 downto 0);
end beh;
