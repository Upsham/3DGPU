
library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_coordinate_buffer is
generic (Period : Time := 10 ns);
end tb_coordinate_buffer;

architecture TEST of tb_coordinate_buffer is

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

  component coordinate_buffer
    PORT(
         strb_cor : in std_logic;
         databus_out : in std_logic_vector(15 downto 0);
         clk : in std_logic;
         sel : in std_logic;
         point : out std_logic_vector(47 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal strb_cor : std_logic;
  signal databus_out : std_logic_vector(15 downto 0);
  signal clk : std_logic;
  signal sel : std_logic;
  signal point : std_logic_vector(47 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: coordinate_buffer port map(
                strb_cor => strb_cor,
                databus_out => databus_out,
                clk => clk,
                sel => sel,
                point => point
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin

-- Insert TEST BENCH Code Here
    strb_cor <= '0';

    databus_out <= x"0000";

    sel <= '0';
-- Insert TEST BENCH Code Here
   for i in 5 downto 0 loop
   	databus_out <=INT_TO_STD_LOGIC(i,16);
   	wait for 2 ns;
   	strb_cor <= '1';
   	wait for 10 ns;
   	strb_cor <= '0';
   	
   end loop;
    wait for 20 ns;
  assert (point /= x"000500040003")
        report "Test 1 PASSED!" severity note;
  
  assert (point = x"000500040003")
        report "Test 1 Failed!" severity error;
        sel <= '1';
        wait for 20 ns;
  assert (point /= x"000200010000")
        report "Test 2 PASSED!" severity note;
  assert (point = x"000200010000")
        report "Test 2 Failed!" severity error;   
   sel <= '0';      
   for i in 65535 downto 65530 loop
   	databus_out <=INT_TO_STD_LOGIC(i,16);
   	wait for 2 ns;
   	strb_cor <= '1';
   	wait for 10 ns;
   	strb_cor <= '0';
   	
   end loop;
    sel <= '0';
    wait for 20 ns;

  assert (point /= x"FFFFFFFEFFFD")
        report "Test 3 PASSED!" severity note;
  
  assert (point = x"FFFFFFFEFFFD")
        report "Test 3 Failed!" severity error;  
        sel <= '1';
        wait for 20 ns;
  assert (point /= x"FFFCFFFBFFFA")
        report "Test 4 PASSED!" severity note;
  
  assert (point = x"FFFCFFFBFFFA")
        report "Test 4 Failed!" severity error;  
                             
  wait;

  end process;
end TEST;
