
library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_multiplier is
generic (Period : Time := 20 ns);
end tb_multiplier;

architecture TEST of tb_multiplier is

  component multiplier
    PORT(
         clk : in std_logic;
         rst_n : in std_logic;
         math_done : out std_logic;
         init_matrix : in std_logic;
         point : in std_logic_vector(47 downto 0);
         row : in std_logic_vector(63 downto 0);
         screen_cor : out std_logic_vector(7 downto 0);
         strb_screen : out std_logic;
         row_sel : out std_logic_vector(1 downto 0);
	 err : out std_logic;
         sel : out std_logic
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal math_done : std_logic;
  signal init_matrix : std_logic;
  signal point : std_logic_vector(47 downto 0);
  signal row : std_logic_vector(63 downto 0);
  signal screen_cor : std_logic_vector(7 downto 0);
  signal strb_screen : std_logic;
  signal row_sel : std_logic_vector(1 downto 0);
  signal sel : std_logic;
  signal err : std_logic;

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: multiplier port map(
                clk => clk,
                rst_n => rst_n,
                math_done => math_done,
                init_matrix => init_matrix,
                point => point,
                row => row,
                screen_cor => screen_cor,
                strb_screen => strb_screen,
                row_sel => row_sel,
		err => err,
                sel => sel
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here

    -- RESETTING THE SYSTEM
    rst_n <= '0'; -- Reset
    init_matrix <= '0'; -- Initalize init_matrix to 0
    wait for 20 ns;
    init_matrix <= '1'; -- Check that the rst_n actually works
    wait for 20 ns;
    rst_n <= '1'; -- Start system
    point <= "100011110000111100000000111100000000000000000001";-- First value is negative to check the whole process, the other two are positive (3 are passed in)
    row <= "0000000000000011100000000000001100000000000000110000000000000001"; -- The second value is negative to check the 
    wait for 20 ns; 
    init_matrix <= '0';
    wait for 60 ns; -- Change to second point to simulate sel = 1
    point <= "000001110000101100000000101100000000000000000101";   
    wait for 100 ns; -- Change to first point to simulate sel = 0 and second row to simulate row_sel = '01'
    row <= "0000100001000011000000000001000100100000000000110000000010000001";
    point <= "100011110000111100000000111100000000000000000001";
    wait for 100 ns; -- Change to second point to simulate sel = 1
    point <= "000001110000101100000000101100000000000000000101";
    wait for 100 ns; -- Change to first point to simulate sel = 0 and second row to simulate row_sel = '01'
    row <= "0000000001000011000000000001000100100000000000110000000010000001";
    point <= "100011110000111100000000111100000000000000000001";
    wait for 100 ns; -- Change to second point to simulate sel = 1
    point <= "000001110000101100000000101100000000000000000101";
-- Data that we can see
    wait for 20 ns;
    init_matrix <= '1';
    point <= x"000A002B0004";  
    row <= x"00FF000300080080";
    wait for 100 ns;
    init_matrix <= '0';
    point <= x"000100090040";
    wait for 100 ns;
    point <= x"000A002B0004"; 
    row <= x"0001000200030004";
    wait for 100 ns;
    point <= x"000100090040";   
    wait for 100 ns;
    point <= x"000A002B0004"; 
    row <= x"800AFFFF0000FF00";  
    wait; --Finito
    

  end process;
end TEST;
