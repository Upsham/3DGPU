
library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_screen_buffer is
generic (Period : Time := 10 ns);
end tb_screen_buffer;

architecture TEST of tb_screen_buffer is

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

  component screen_buffer
    PORT(
         clk : in std_logic;
         strb_screen : in std_logic;
         screen_cor : in std_logic_vector(7 downto 0);
         X0 : out std_logic_vector(7 downto 0);
         X1 : out std_logic_vector(7 downto 0);
         Y0 : out std_logic_vector(7 downto 0);
         Y1 : out std_logic_vector(7 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal clk : std_logic;
  signal strb_screen : std_logic;
  signal screen_cor : std_logic_vector(7 downto 0);
  signal X0 : std_logic_vector(7 downto 0);
  signal X1 : std_logic_vector(7 downto 0);
  signal Y0 : std_logic_vector(7 downto 0);
  signal Y1 : std_logic_vector(7 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: screen_buffer port map(
                clk => clk,
                strb_screen => strb_screen,
                screen_cor => screen_cor,
                X0 => X0,
                X1 => X1,
                Y0 => Y0,
                Y1 => Y1
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process



  begin

-- Insert TEST BENCH Code Here
      for i in 4 downto 1 loop
   	screen_cor <=INT_TO_STD_LOGIC(i,8);
   	wait for 2 ns;
   	strb_screen <= '1';
   	wait for 10 ns;
   	strb_screen <= '0';
   	
   end loop;
  assert (X0 /= x"04")
        report "Test 1 PASSED!" severity note;
  
  assert (X0  = x"04")
        report "Test 1 Failed!" severity error;
  assert (X1 /= x"03")
        report "Test 2 PASSED!" severity note;
  
  assert (X1  = x"03")
        report "Test 2 Failed!" severity error;
        
  assert (Y0 /= x"02")
        report "Test 3 PASSED!" severity note;
  
  assert (Y0  = x"02")
        report "Test 3 Failed!" severity error;        
  assert (Y1 /= x"01")
        report "Test 4 PASSED!" severity note;
  
  assert (Y1  = x"01")
        report "Test 4 Failed!" severity error;     
      for i in 255 downto 252 loop
   	screen_cor <=INT_TO_STD_LOGIC(i,8);
   	wait for 2 ns;
   	strb_screen <= '1';
   	wait for 10 ns;
   	strb_screen <= '0';
   	
   end loop;
  assert (X0 /= x"FF")
        report "Test 5 PASSED!" severity note;
  
  assert (X0  = x"FF")
        report "Test 5 Failed!" severity error;
  assert (X1 /= x"FE")
        report "Test 6 PASSED!" severity note;
  
  assert (X1  = x"FE")
        report "Test 6 Failed!" severity error;
        
  assert (Y0 /= x"FD")
        report "Test 7 PASSED!" severity note;
  
  assert (Y0  = x"FD")
        report "Test 7 Failed!" severity error;        
  assert (Y1 /= x"FC")
        report "Test 8 PASSED!" severity note;
  
  assert (Y1  = x"FC")
        report "Test 8 Failed!" severity error;              
  end process;
end TEST;
