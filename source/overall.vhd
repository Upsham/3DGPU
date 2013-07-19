

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;

entity overall is
	port(
		databus: inout std_logic_vector(15 downto 0);
		addr_out : out std_logic_vector(14 downto 0 );
		re_out : out std_logic;
		we_out : out std_logic;
		strb_in : in std_logic;
		ram_in_use : in std_logic;
		gpu_done : out std_logic;
		clk,rst_n : in std_logic
	);
end overall;
architecture struct of overall is
-----Screen_Buffer component declaration  
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
   component matrix_math
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
  component gpu_controller
    PORT(
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
         err: in std_logic;
         databus_out : out std_logic_vector(15 downto 0);
         		opp: out std_logic_vector(15 downto 0)
    );
  end component;
	    component Rasterizer
    PORT(
         clk : in std_logic;
         X0 : in std_logic_vector (7 DOWNTO 0);
         X1 : in std_logic_vector (7 DOWNTO 0);
         Y0 : in std_logic_vector (7 DOWNTO 0);
         Y1 : in std_logic_vector (7 DOWNTO 0);
         init_rast : in std_logic;
         RST_N : in std_logic;
         rast_done : out std_logic;
         rast_strb : out std_logic;
         rast_index : out std_logic_vector(3 downto 0);
         rast_addr : out std_logic_vector(15 downto 0)
    );
  end component;
  signal rast_done : std_logic;
  signal init_rast : std_logic;
  signal rast_addr : std_logic_vector(15 downto 0);
  signal rast_strb : std_logic;
  signal rast_index : std_logic_vector(3 downto 0);
  signal math_done : std_logic;
  signal init_math : std_logic;
  signal strb_matrix : std_logic;
  signal strb_cor : std_logic;
  signal databus_out : std_logic_vector(15 downto 0);
  signal opp:  std_logic_vector(15 downto 0);
  signal row_sel : std_logic_vector(1 downto 0);
  signal row : std_logic_vector(63 downto 0);
  signal sel : std_logic;
  signal point : std_logic_vector(47 downto 0);
  signal strb_screen: std_logic;
  signal screen_cor: std_logic_vector(7 downto 0);
  signal X0 : std_logic_vector (7 DOWNTO 0);
  signal X1 : std_logic_vector (7 DOWNTO 0);
  signal Y0 : std_logic_vector (7 DOWNTO 0);
  signal Y1 : std_logic_vector (7 DOWNTO 0);
  signal err: std_logic;

begin
  DUT5: matrix_math port map(
                clk => clk,
                rst_n => rst_n,
                math_done => math_done,
                init_matrix => init_math,
                point => point,
                row => row,
                screen_cor => screen_cor,
                strb_screen => strb_screen,
                row_sel => row_sel,
		    err => err,
                sel => sel
                );
							
  DUT4: Rasterizer port map(
                clk => clk,
                X0 => X0,
                X1 => X1,
                Y0 => Y0,
                Y1 => Y1,
                init_rast => init_rast,
                RST_N => RST_N,
                rast_done => rast_done,
                rast_strb => rast_strb,
                rast_index => rast_index,
                rast_addr => rast_addr
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
                err => err,
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
                databus_out => databus_out,
	               opp => opp
                );
end struct;
