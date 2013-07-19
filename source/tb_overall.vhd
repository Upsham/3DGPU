
library ieee;
--library gold_lib;   --UNCOMMENT if you're using a GOLD model
use ieee.std_logic_1164.all;
use std.textio.all;
--use gold_lib.all;   --UNCOMMENT if you're using a GOLD model
LIBRARY ECE337_IP;
USE ECE337_IP.all;
entity tb_overall is
generic (Period : Time := 10 ns);
end tb_overall;

architecture TEST of tb_overall is
function to_std_logic(c: character) return std_logic is 
    variable sl: std_logic;
    begin
      case c is
        when 'U' => 
           sl := 'U'; 
        when 'X' =>
           sl := 'X';
        when '0' => 
           sl := '0';
        when '1' => 
           sl := '1';
        when 'Z' => 
           sl := 'Z';
        when 'W' => 
           sl := 'W';
        when 'L' => 
           sl := 'L';
        when 'H' => 
           sl := 'H';
        when '-' => 
           sl := '-';
        when others =>
           sl := 'X'; 
    end case;
   return sl;
  end to_std_logic;

function to_std_logic_vector(s: string) return std_logic_vector is 
  variable slv: std_logic_vector(s'high-s'low downto 0);
  variable k: integer;
begin
   k := s'high-s'low;
  for i in s'range loop
     slv(k) := to_std_logic(s(i));
     k      := k - 1;
  end loop;
  return slv;
end to_std_logic_vector; 
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
  component overall
    PORT(
         databus : inout std_logic_vector(15 downto 0);
         addr_out : out std_logic_vector(14 downto 0 );
         re_out : out std_logic;
         we_out : out std_logic;
         strb_in : in std_logic;
         ram_in_use : in std_logic;
         gpu_done : out std_logic;
         clk : in std_logic;
         rst_n : in std_logic
    );
  end component;

-- Insert signals Declarations here
  signal tb_mem_clr,tb_mem_init,tb_mem_dump,tb_verbose : boolean ;
  signal  tb_init_filename,tb_dump_filename : string (1 to 19);	
  signal  tb_start_address,tb_last_address: natural;


  signal databus : std_logic_vector(15 downto 0);
  signal addr_out : std_logic_vector(14 downto 0 );
  signal addr_out_ram : std_logic_vector(15 downto 0);
  signal re_out : std_logic;
  signal we_out : std_logic;
  signal strb_in : std_logic;
  signal ram_in_use : std_logic;
  signal gpu_done : std_logic;
  signal clk : std_logic;
  signal rst_n : std_logic;

-- signal <name> : <type>;

begin
addr_out_ram(15) <= '0';
addr_out_ram(14 downto 0) <= addr_out;
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
  DUT: overall port map(
                databus => databus,
                addr_out => addr_out,
                re_out => re_out,
                we_out => we_out,
                strb_in => strb_in,
                ram_in_use => ram_in_use,
                gpu_done => gpu_done,
                clk => clk,
                rst_n => rst_n
                );

--   GOLD: <GOLD_NAME> port map(<put mappings here>);
load_opcodes: process
variable l: line;
variable s: string(1 to 16);
file op_data: TEXT open read_mode is "cube0";
file op_data1: TEXT open read_mode is "line1";
file op_data2: TEXT open read_mode is "cube1";
begin
	addr_out <= (others => 'Z');
        rst_n <= '0';
	tb_mem_init <= FALSE;
	tb_verbose <= TRUE;
	tb_start_address <= 0;
	tb_last_address <= 4096;
	ram_in_use <= '1';
	tb_mem_clr <= TRUE;
	re_out <= '0';
	we_out <= '0';
	strb_in <= '0';
	wait for 10 ns;
	tb_mem_clr <= FALSE;
----Initializing the ram;
  rst_n <= '0';
  tb_init_filename <="source/memcube0.txt";
  tb_dump_filename	<=	"source/meocube0.txt";
  tb_mem_init <= TRUE; 
  wait for 2 ns;
  tb_mem_init <= FALSE;
  rst_n <= '1';
          while not endfile(op_data) loop
		ram_in_use <= '1';
		re_out <= '0';
		we_out <= '0';
          -- read digital data from input file 
          readline(op_data, l);
          read(l, s);
           databus <= to_std_logic_vector(s);

	  wait for 5 ns;
	  strb_in <= '1';
          wait for 30 ns;
	  strb_in <= '0';
          readline(op_data, l);
          read(l, s);
	  databus <= to_std_logic_vector(s);
	  wait for 11 ns;
	  strb_in <= '1';
	  wait for 30 ns;
	  strb_in <= '0';
	  ram_in_use <= '0';
	  databus <= (others => 'Z');
	  re_out <= 'Z';
	  we_out <= 'Z';
          wait until gpu_done = '1';
          
        end loop;
	tb_mem_dump <= TRUE;

	tb_start_address	<= 0; 
	tb_last_address		<= 4096; 
	wait for 5 ns; 
	tb_mem_dump<= FALSE; 
------Second test drawing a diagonal line
        rst_n <= '0';
	tb_mem_init <= FALSE;
	tb_verbose <= TRUE;
	tb_start_address <= 0;
	tb_last_address <= 4096;
	ram_in_use <= '1';
	tb_mem_clr <= TRUE;
	re_out <= '0';
	we_out <= '0';
	strb_in <= '0';
	wait for 10 ns;
	tb_mem_clr <= FALSE;
----Initializing the ram;
  rst_n <= '0';
  tb_init_filename <="source/memline1.txt";
  tb_dump_filename	<=	"source/meoline1.txt";
  tb_mem_init <= TRUE; 
  wait for 2 ns;
  tb_mem_init <= FALSE;
  rst_n <= '1';
          while not endfile(op_data1) loop
		ram_in_use <= '1';
		re_out <= '0';
		we_out <= '0';
          -- read digital data from input file 
          readline(op_data1, l);
          read(l, s);
           databus <= to_std_logic_vector(s);

	  wait for 5 ns;
	  strb_in <= '1';
          wait for 30 ns;
	  strb_in <= '0';
          readline(op_data1, l);
          read(l, s);
	  databus <= to_std_logic_vector(s);
	  wait for 10 ns;
	  strb_in <= '1';
	  wait for 30 ns;
	  strb_in <= '0';
	  ram_in_use <= '0';
	  databus <= (others => 'Z');
	  re_out <= 'Z';
	  we_out <= 'Z';
          wait until gpu_done = '1';
          
        end loop;
	tb_mem_dump <= TRUE;

	tb_start_address	<= 0; 
	tb_last_address		<= 4096; 
	wait for 5 ns; 
	tb_mem_dump<= FALSE; 

------Second test drawing a diagonal line and rotating it by 90 degrees.
        rst_n <= '0';
	tb_mem_init <= FALSE;
	tb_verbose <= TRUE;
	tb_start_address <= 0;
	tb_last_address <= 4096;
	ram_in_use <= '1';
	tb_mem_clr <= TRUE;
	re_out <= '0';
	we_out <= '0';
	strb_in <= '0';
	wait for 10 ns;
	tb_mem_clr <= FALSE;
----Initializing the ram;
  rst_n <= '0';
  tb_init_filename <="source/memcube1.txt";
  tb_dump_filename	<=	"source/meocube1.txt";
  tb_mem_init <= TRUE; 
  wait for 2 ns;
  tb_mem_init <= FALSE;
  rst_n <= '1';
          while not endfile(op_data2) loop
		ram_in_use <= '1';
		re_out <= '0';
		we_out <= '0';
          -- read digital data from input file 
          readline(op_data2, l);
          read(l, s);
           databus <= to_std_logic_vector(s);

	  wait for 5 ns;
	  strb_in <= '1';
          wait for 30 ns;
	  strb_in <= '0';
          readline(op_data2, l);
          read(l, s);
	  databus <= to_std_logic_vector(s);
	  wait for 10 ns;
	  strb_in <= '1';
	  wait for 30 ns;
	  strb_in <= '0';
	  ram_in_use <= '0';
	  databus <= (others => 'Z');
	  re_out <= 'Z';
	  we_out <= 'Z';
          wait until gpu_done = '1';
          
        end loop;
	tb_mem_dump <= TRUE;

	tb_start_address	<= 0; 
	tb_last_address		<= 4096; 
	wait for 5 ns; 
	tb_mem_dump<= FALSE; 
	
	
      wait;
end process load_opcodes;

end TEST;
