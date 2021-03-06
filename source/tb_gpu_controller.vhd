
library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use std.textio.all;
--use work.txt_util.all;

--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model
LIBRARY ECE337_IP;
USE ECE337_IP.all;
entity tb_gpu_controller is
generic (Period : Time := 10 ns
		);

end tb_gpu_controller;

architecture TEST of tb_gpu_controller is

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
  
-----Screen_Buffer component declaration  


  component coordinate_buffer
    PORT(
         strb_cor : in std_logic;
         databus_out : in std_logic_vector(15 downto 0);
         clk : in std_logic;
         sel : in std_logic;
         point : out std_logic_vector(47 downto 0)
    );
  end component;

  component world_matrix_buffer
    PORT(
         strb_matrix : in std_logic;
         databus_out : in std_logic_vector(15 downto 0);
         clk : in std_logic;
         row_sel : in std_logic_vector(1 downto 0);
         row : out std_logic_vector(63 downto 0)
    );
  end component;
  component gpu_controller
    PORT(
         err: in std_logic;
         databus : inout std_logic_vector(15 downto 0);
         strb_in : in std_logic;
         clk : in std_logic;
         rst_n : in std_logic;
         gpu_done : out std_logic;
         ram_in_use : in std_logic;
         rast_done : in std_logic;
         init_rast : out std_logic;
         rast_addr : in std_logic_vector(15 downto 0);
         rast_strb : in std_logic;
         rast_index : in std_logic_vector(3 downto 0);
         math_done : in std_logic;
         init_math : out std_logic;
         strb_matrix : out std_logic;
         strb_cor : out std_logic;
         addr_out : out std_logic_vector(14 downto 0);
         re_out ,we_out: out std_logic;
         databus_out : out std_logic_vector(15 downto 0);
         		opp: out std_logic_vector(15 downto 0)
    );
  end component;

	component scalable_off_chip_sram is
		generic (
						-- Memory Model parameters
						ADDR_SIZE_BITS	: natural	:= 16;		-- Address bus size in bits/pins with addresses corresponding to 
																								-- the starting word of the accesss
						WORD_SIZE_BYTES	: natural	:= 2;			-- Word size of the memory in bytes
						DATA_SIZE_WORDS	: natural	:= 1;			-- Data bus size in "words"
						READ_DELAY			: time		:= 10 ns;	-- Delay/latency per read access (total time between start of supplying address and when the data read from memory appears on the r_data port)
																								-- Keep the 10 ns delay for on-chip SRAM
						WRITE_DELAY			: time		:= 10 ns		-- Delay/latency per write access (total time between start of supplying address and when the w_data value is written into memory)
																								-- Keep the 10 ns delay for on-chip SRAM
					);
	port 	(
					-- Test bench control signals
					mem_clr				: in	boolean;
					mem_init			: in	boolean;
					mem_dump			: in	boolean;
					verbose				: in	boolean;
					init_filename	: in 	string;
					dump_filename	: in 	string;
					start_address	: in	natural;
					last_address	: in	natural;
					
					-- Memory interface signals
					r_enable	: in		std_logic;
					w_enable	: in		std_logic;
					addr			: in		std_logic_vector((addr_size_bits - 1) downto 0);
					data			: inout	std_logic_vector(((data_size_words * word_size_bytes * 8) - 1) downto 0)
				);
	end component scalable_off_chip_sram;




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
  signal tb_mem_clr,tb_mem_init,tb_mem_dump,tb_verbose : boolean ;
  signal  tb_init_filename : string (1 to 24);
  signal tb_dump_filename : string (1 to 19);	
  signal  tb_start_address,tb_last_address: natural;
  signal databus: std_logic_vector(15 downto 0);
  signal strb_in : std_logic;
  signal clk : std_logic;
  signal rst_n : std_logic;
  signal gpu_done : std_logic;
  signal ram_in_use : std_logic;
  signal rast_done : std_logic;
  signal init_rast : std_logic;
  signal rast_addr : std_logic_vector(15 downto 0);
  signal rast_strb : std_logic;
  signal rast_index : std_logic_vector(3 downto 0);
  signal math_done : std_logic;
  signal init_math : std_logic;
  signal strb_matrix : std_logic;
  signal strb_cor : std_logic;
  signal addr_out_ram : std_logic_vector(15 downto 0);
  signal addr_out : std_logic_vector(14 downto 0);
  signal re_out,we_out : std_logic;
  signal databus_out : std_logic_vector(15 downto 0);
  signal opp:  std_logic_vector(15 downto 0);
  signal row_sel : std_logic_vector(1 downto 0);
  signal row : std_logic_vector(63 downto 0);
  signal sel : std_logic;
  signal point : std_logic_vector(47 downto 0);
  signal strb_screen: std_logic;
  signal screen_cor: std_logic_vector(7 downto 0);
  signal screen_line : std_logic_vector(95 downto 0);
  signal X0 : std_logic_vector(7 downto 0);
  signal X1 : std_logic_vector(7 downto 0);
  signal Y0 : std_logic_vector(7 downto 0);
  signal Y1 : std_logic_vector(7 downto 0);
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
	Memory: scalable_off_chip_sram
		generic map (
									-- Memory interface parameters
									ADDR_SIZE_BITS	=> 16,
									WORD_SIZE_BYTES	=> 2,
									DATA_SIZE_WORDS	=> 1,
									READ_DELAY			=> 10 ns,	-- CLK is 2 ns longer than access delay for conservative padding for flipflop setup times and propagation delays from the external SRAM chip to the internal flipflops
									WRITE_DELAY			=> 10 ns		-- CLK is 2 ns longer than access delay for conservative padding for Real SRAM hold times and propagation delays from the internal flipflops to the external SRAM chip
								)
		port map	(
								-- Test bench control signals
								mem_clr				=> tb_mem_clr,
								mem_init			=> tb_mem_init,
								mem_dump			=> tb_mem_dump,
								verbose				=> tb_verbose,
								init_filename	=> tb_init_filename,
								dump_filename	=> tb_dump_filename,
								start_address	=> tb_start_address,
								last_address	=> tb_last_address,
								
								-- Memory interface signals
								r_enable	=> re_out,
								w_enable	=> we_out,
								addr			=> addr_out_ram,
								data			=> databus
							);
  

  DUT3: screen_buffer port map(
                clk => clk,
                strb_screen => strb_screen,
                screen_cor => screen_cor,
                X0 => X0,
                X1 => X1,
                Y0 => Y0,
                Y1 => Y1
                );

  DUT2: world_matrix_buffer port map(
                strb_matrix => strb_matrix,
                databus_out => databus_out,
                clk => clk,
                row_sel => row_sel,
                row => row
                );
  DUT1: coordinate_buffer port map(
                strb_cor => strb_cor,
                databus_out => databus_out,
                clk => clk,
                sel => sel,
                point => point
                );							

  DUT: gpu_controller port map(
                databus => databus,
                strb_in => strb_in,
                clk => clk,
                rst_n => rst_n,
                gpu_done => gpu_done,
                ram_in_use => ram_in_use,
                rast_done => rast_done,
                init_rast => init_rast,
                rast_addr => rast_addr,
                rast_strb => rast_strb,
                rast_index => rast_index,
                math_done => math_done,
                init_math => init_math,
                strb_matrix => strb_matrix,
                strb_cor => strb_cor,
                addr_out => addr_out,
                re_out => re_out,
                we_out => we_out,
		err => err,
                databus_out => databus_out,
	               opp => opp
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);

addr_out_ram <= '0' & addr_out;
process

  begin
    re_out <= 'Z';
    we_out <= 'Z';
  
  tb_mem_clr <= FALSE;
  tb_verbose <= TRUE;
  tb_mem_init <= FALSE;
  tb_mem_dump <= FALSE;
--- Insert TEST BENCH Code Here

  tb_init_filename <="source/mem_interface.txt";
  tb_dump_filename	<=	"source/mem_dump.txt";
  tb_mem_init <= TRUE; 
  wait for 2 ns;
  tb_mem_init <= FALSE;
  tb_mem_dump				<= TRUE;

	tb_start_address	<= 0; -- Can be any address 
	tb_last_address		<= 5; -- Can be any address larger than the start_address
	wait for 1 ns; -- Can be as long or as short as you like, as long as it is longer than 1 simulation time-step
	tb_mem_dump				<= FALSE;
--      databus <= x"FFFF";
-- 	re_out	<= '0';
--	we_out	<= '1';
	wait for 75 ns;
--	databus <=( others => 'Z');
--	we_out <= '0';
--	re_out <= '1';
	
--   wait for 20 ns;
--   	addr_out <= x"0001";
--   wait for 20 ns;
--   	addr_out <= x"0000";
--   wait for 10 ns;
--  tb_mem_dump				<= TRUE;

--	tb_start_address	<= 0; -- Can be any address 
--	tb_last_address		<= 5; -- Can be any address larger than the start_address
--	wait for 5 ns; -- Can be as long or as short as you like, as long as it is longer than 1 simulation time-step
--	tb_mem_dump				<= FALSE;   	
  addr_out <= (others => 'Z');
    ram_in_use <= '1';
    rast_done <= '0';
    math_done <= '0';
        strb_in <= '0';

    rst_n <= '0';
    wait for 5 ns;
    rst_n <= '1';
    wait for 10 ns;
    databus <= x"0001";
    strb_in <= '1';
    wait for 30 ns;
    strb_in <= '0';
    wait for 20 ns;
    databus <= x"1388";
    strb_in <= '1';
    wait for 35 ns;
    strb_in <= '0';
    databus <= (others => 'Z');
    wait for 10 ns;
    ram_in_use <= '0';
    wait until gpu_done = '1';
    ram_in_use <= '1';
 databus <= x"0002";
    strb_in <= '1';
    wait for 30 ns;
    strb_in <= '0';
    wait for 20 ns;
    databus <= x"1398";
    strb_in <= '1';
    wait for 35 ns;   
    strb_in <= '0';
    databus <= (others => 'Z');
    wait for 10 ns;
    ram_in_use <= '0';
    wait for 500 ns;
         
    wait;

  end process;
end TEST;
