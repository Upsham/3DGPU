LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity world_matrix_buffer is
	port(
		strb_matrix : in std_logic;
		databus_out : in std_logic_vector(15 downto 0);
		clk: in std_logic;
		row_sel : in std_logic_vector(1 downto 0);
		row: out std_logic_vector(63 downto 0)
	);
end world_matrix_buffer;

architecture behavorial of world_matrix_buffer is
signal regg: std_logic_vector(255 downto 0);
begin

reggg: process(clk,regg)
begin
	if rising_edge(clk) then
		if strb_matrix = '1' then 
			regg <= regg(239 downto 0) & databus_out(15 downto 0);
		end if;
	end if;
end process reggg;

data_out: process(regg,row_sel)
begin
	case row_sel is
		when "00" =>
			row <= regg(255 downto 192);
		when "01" => 
			row <= regg(191 downto 128 );
		when "10" =>
			row <= regg(127 downto 64);
		when "11" =>
			row <= regg(63 downto 0);
		when others =>
	end case;
end process data_out;
end behavorial;
