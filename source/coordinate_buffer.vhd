

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;


entity coordinate_buffer is
	port(
		strb_cor: in std_logic;
		databus_out : in std_logic_vector(15 downto 0);
		clk: in std_logic;
		sel : in std_logic;
		point: out std_logic_vector(47 downto 0)
	);
end coordinate_buffer;

architecture behavorial of coordinate_buffer is
signal regg: std_logic_vector(95 downto 0);
begin

reggg: process(clk,regg)
begin
	if rising_edge(clk) then
		if strb_cor = '1' then 
			regg <= regg(79 downto 0) & databus_out(15 downto 0);
		end if;
	end if;
end process reggg;
data_out: process(regg,sel)
begin
	case sel is
		when '0' =>
			point <= regg(95 downto 48);
		when '1' => 
			point <= regg(47 downto 0);
		when others =>
	end case;
end process data_out;
end behavorial;
