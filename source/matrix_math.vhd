
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.std_logic_arith.ALL;


entity matrix_math is
  port(
    screen_cor : out std_logic_vector(7 downto 0);
    init_matrix : in std_logic;   
    clk : in std_logic;
    rst_n : in std_logic;
    row_sel : out std_logic_vector(1 downto 0);
    sel : out std_logic;
    math_done : out std_logic;
    strb_screen: out std_logic;
    point : in std_logic_vector(47 downto 0);
    row: in std_logic_vector(63 downto 0)   ;
    err : out std_logic
);    
   
end matrix_math;


architecture math_behav of matrix_math is
  type state_type is (idle,multiply,delay,multiply1,delay1,multiply2,delay2,multiply3,delay3,done);
   constant cons_mul: signed(15 downto 0):=x"0100"; 
  signal state, nextstate : state_type;

  signal R1,R2,R3,R4,x,y,z: signed(15 downto 0);
  signal V1_std: std_logic_vector(7 downto 0);
  signal V1 : signed(31 downto 0);

begin
  clk_gen : process (clk, rst_n)
  begin
    if (rst_n = '0') then

      state <= idle;
    elsif (clk'event and clk = '1') then
      state <= nextstate;
    end if;
end process clk_gen;

  R1 <= signed(row( 63 downto 48));
  R2 <= signed(row( 47 downto 32));
  R3 <= signed(row( 31 downto 16 ));
  R4 <= signed(row(15 downto 0));
  x <= signed(point(47 downto 32));
  y <= signed(point(31 downto 16));
  z <= signed(point(15 downto 0));
  
  V1 <= R1*x+ R2*y + R3*z + R4*cons_mul;
  V1_std <= std_logic_vector(V1(23 downto 16));
  screen_cor <= not V1_std(7) & V1_std(6 downto 0);




  regg : process (state,init_matrix)
  begin
  nextstate <= state;
  strb_screen <= '0';
  math_done <= '0';
  err <= '0';
    case state is 
      when idle =>
      	sel <= '0';
      	row_sel <= "00";
      	if init_matrix = '1'  then
   		   nextstate <= multiply;
   		end if;
   	when multiply =>
   		row_sel <= "00";
   		sel <= '0'; 
   		nextstate <= delay;
   	when delay =>
   		sel <= '0';
      	row_sel <= "00";
   		strb_screen <= '1';
   		nextstate <= multiply1;
      when multiply1 =>
   		row_sel <= "00";
   		sel <= '1'; 
   		nextstate <= delay1;
   	when delay1 =>
      	row_sel <= "00";
   		sel <= '1'; 
   		strb_screen <= '1';
   		nextstate <= multiply2;
      when multiply2 =>
   		row_sel <= "01";
   		sel <= '0'; 
   		nextstate <= delay2;
   	when delay2 =>
   	   	row_sel <= "01";
   		sel <= '0';
   		strb_screen <= '1';
   		nextstate <= multiply3;   		
      when multiply3 =>
   		row_sel <= "01";
   		sel <= '1'; 
   		nextstate <= delay3;
   	when delay3 =>
   		row_sel <= "01";
   		sel <= '1'; 
   		strb_screen <= '1';
   		nextstate <= done;
   	when done =>
   	   	row_sel <= "00";
   		sel <= '0'; 
   		math_done <= '1';
   		nextstate <= idle;   		
    end case;
  end process regg;
        
end math_behav;

