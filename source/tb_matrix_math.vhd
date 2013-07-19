
library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_matrix_math is
generic (Period : Time := 10 ns);
end tb_matrix_math;

architecture TEST of tb_matrix_math is

  function INT_TO_STD_LOGIC( X: INTEGER; NumBits: INTEGER )
     return STD_LOGIC_VECTOR is
    variable RES : STD_LOGIC_VECTOR(NumBits-1 downto 0);
    variable tmp : INTEGER;
  begin
    tmp := X;
    for i in 0 to NumBits-1 loop
      if (tmp mod 2)=1 then
        res(i) := '1';
      else
        res(i) := '0';
      end if;
      tmp := tmp/2;
    end loop;
    return res;
  end;

  component matrix_math
    PORT(
         screen_cor : out std_logic_vector(7 downto 0);
         init_matrix : in std_logic;
         clk : in std_logic;
         rst_n : in std_logic;
         row_sel : out std_logic_vector(1 downto 0);
         sel : out std_logic;
         math_done : out std_logic;
         strb_screen : out std_logic;
         point : in std_logic_vector(47 downto 0);
	   err : out std_logic;
         row : in std_logic_vector(63 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal screen_cor : std_logic_vector(7 downto 0);
  signal init_matrix : std_logic;
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal row_sel : std_logic_vector(1 downto 0);
  signal sel : std_logic;
  signal math_done : std_logic;
  signal strb_screen : std_logic;
  signal point : std_logic_vector(47 downto 0);
  signal row : std_logic_vector(63 downto 0);
  signal err: std_logic;
-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: matrix_math port map(
                screen_cor => screen_cor,
                init_matrix => init_matrix,
                clk => clk,
                rst_n => rst_n,
                row_sel => row_sel,
                sel => sel,
                math_done => math_done,
                strb_screen => strb_screen,
                point => point,
                row => row,
                err =>err
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

  init_matrix <= '0';
  rst_n <= '0';
  point <= x"000000000000";
  row <= x"0000000000000000";
  wait for 10 ns;
  rst_n <= '1';
  wait for 10 ns;
  point <= x"FFFFFFFFFFFF";
  row <= x"FFFFFFFFFFFFFFFF";
  init_matrix <= '1';
  wait for 10 ns;
  init_matrix <= '0';
  wait;


  end process;
end TEST;
