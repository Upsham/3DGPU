library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model

entity tb_world_matrix_buffer is
generic (Period : Time := 10 ns);
end tb_world_matrix_buffer;

architecture TEST of tb_world_matrix_buffer is

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

  component world_matrix_buffer
    PORT(
         strb_matrix : in std_logic;
         databus_out : in std_logic_vector(15 downto 0);
         clk : in std_logic;
         row_sel : in std_logic_vector(1 downto 0);
         row : out std_logic_vector(63 downto 0)
    );
  end component;

-- Insert signals Declarations here
  signal strb_matrix : std_logic;
  signal databus_out : std_logic_vector(15 downto 0);
  signal clk : std_logic;
  signal row_sel : std_logic_vector(1 downto 0);
  signal row : std_logic_vector(63 downto 0);

-- signal <name> : <type>;

begin

CLKGEN: process
  variable clk_tmp: std_logic := '0';
begin
  clk_tmp := not clk_tmp;
  clk <= clk_tmp;
  wait for Period/2;
end process;

  DUT: world_matrix_buffer port map(
                strb_matrix => strb_matrix,
                databus_out => databus_out,
                clk => clk,
                row_sel => row_sel,
                row => row
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

process

  begin
    strb_matrix <= '0';

    databus_out <= x"0000";

    row_sel <= "00";
-- Insert TEST BENCH Code Here
   for i in 65535 downto 65520 loop
   	databus_out <=INT_TO_STD_LOGIC(i,16);
   	wait for 2 ns;
   	strb_matrix <= '1';
   	wait for 10 ns;
   	strb_matrix <= '0';
   	
   end loop;
  
  assert (row /= x"FFFFFFFEFFFDFFFC")
        report "Test 1 PASSED!" severity note;
  
  assert (row = x"FFFFFFFEFFFDFFFC")
        report "Test 1 Failed!" severity error;
  wait for 10 ns;
        row_sel <= "01";
        wait for 2 ns;
  assert (row /= x"FFFBFFFAFFF9FFF8")
        report "Test 2 PASSED!" severity note;

  assert (row = x"FFFBFFFAFFF9FFF8")
        report "Test 2 Failed!" severity error; 
          wait for 10 ns;
        row_sel <= "10";
        wait for 2 ns;
  assert (row /= x"FFF7FFF6FFF5FFF4")
        report "Test 3 PASSED!" severity note;
  
  assert (row = x"FFF7FFF6FFF5FFF4")
        report "Test 3 Failed!" severity error; 
        wait for 10 ns; 
        row_sel <= "11";
        wait for 2 ns;
  assert (row /= x"FFF3FFF2FFF1FFF0")
        report "Test 4 PASSED!" severity note;
  
  assert (row = x"FFF3FFF2FFF1FFF0")
        report "Test 4 Failed!" severity error;
        wait for 10 ns;                       
   for i in 15 downto 0 loop
   	databus_out <=INT_TO_STD_LOGIC(i,16);
   	wait for 2 ns;
   	strb_matrix <= '1';
   	wait for 10 ns;
   	strb_matrix <= '0';
   	
   end loop;
  
  assert (row /= x"000F000E000D000C")
        report "Test 5 PASSED!" severity note;
  
  assert (row = x"000F000E000D000C")
        report "Test 5 Failed!" severity error;
  wait for 10 ns;
        row_sel <= "01";
        wait for 2 ns;
  assert (row /= x"000B000A00090008")
        report "Test 6 PASSED!" severity note;

  assert (row = x"000B000A00090008")
        report "Test 6 Failed!" severity error; 
          wait for 10 ns;
        row_sel <= "10";
        wait for 2 ns;
  assert (row /= x"0007000600050004")
        report "Test 7 PASSED!" severity note;
  
  assert (row = x"0007000600050004")
        report "Test 7 Failed!" severity error; 
        wait for 10 ns; 
        row_sel <= "11";
        wait for 2 ns;
  assert (row /= x"0003000200010000")
        report "Test 8 PASSED!" severity note;
  
  assert (row = x"0003000200010000")
        report "Test 8 Failed!" severity error;
        wait for 10 ns;                       

     for i in 65535 downto 65520 loop
   	databus_out <=INT_TO_STD_LOGIC(i,16);
   	wait for 2 ns;
   	strb_matrix <= '1';
   	wait for 10 ns;
   	strb_matrix <= '0';
   	
   end loop;
  
  assert (row /= x"FFFFFFFEFFFDFFFC")
        report "Test 9 PASSED!" severity note;
  
  assert (row = x"FFFFFFFEFFFDFFFC")
        report "Test 9 Failed!" severity error;
  wait for 10 ns;
        row_sel <= "01";
        wait for 2 ns;
  assert (row /= x"FFFBFFFAFFF9FFF8")
        report "Test 10 PASSED!" severity note;

  assert (row = x"FFFBFFFAFFF9FFF8")
        report "Test 10 Failed!" severity error; 
          wait for 10 ns;
        row_sel <= "10";
        wait for 2 ns;
  assert (row /= x"FFF7FFF6FFF5FFF4")
        report "Test 11 PASSED!" severity note;
  
  assert (row = x"FFF7FFF6FFF5FFF4")
        report "Test 11 Failed!" severity error; 
        wait for 10 ns; 
        row_sel <= "11";
        wait for 2 ns;
  assert (row /= x"FFF3FFF2FFF1FFF0")
        report "Test 12 PASSED!" severity note;
  
  assert (row = x"FFF3FFF2FFF1FFF0")
        report "Test 12 Failed!" severity error;
        wait for 10 ns;  
            wait;
  end process;

end TEST;
