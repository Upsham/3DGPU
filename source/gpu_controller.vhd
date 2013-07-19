
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
entity  gpu_controller is

	port (  databus :inout std_logic_vector(15 downto 0); --- micro input
		strb_in : in std_logic; --- micro input
		clk : in std_logic;  --- 
		rst_n : in std_logic;
            gpu_done: out std_logic; -- output to micro to say gpu is executing the instrcution/free
            ram_in_use: in std_logic;
             
		---- raster signals
		rast_done: in std_logic;
		init_rast: out std_logic;
		rast_addr: in std_logic_vector(15 downto 0);
		rast_strb: in std_logic;
		rast_index: in std_logic_vector(3 downto 0);
		---- math signals
		math_done : in std_logic;
		init_math: out std_logic;
		strb_matrix: out std_logic;
		strb_cor: out std_logic;
		err: in std_logic;
		-----The output address
		addr_out: out std_logic_vector(14 downto 0);
		re_out :out std_logic;
		we_out : out std_logic;
		databus_out : out std_logic_vector(15 downto 0);
		opp: out std_logic_vector(15 downto 0)
	  );
end gpu_controller; 

architecture struct of gpu_controller is
constant loadmatrix : STD_LOGIC_VECTOR (15 downto 0):=x"0001"; 
constant loadline : STD_LOGIC_VECTOR (15 downto 0):=x"0002"; 
 type stateType is (idle,get_opcode,got_opcode,get_addr,memcont,math_act,rasterize,wait_state,delaystate,latchdata,get_data,delaystate2,gettingdata,storing,delaystate3);
  signal state, nextstate : stateType;
signal tem ,tem2,op_strb,strb_reg1,strb_reg2,strb :std_logic;
signal op_code_reg1,op_code_reg2,op_code: std_logic_vector (15 downto 0);
signal nextopcode,opcode,nextaddr: std_logic_vector(15 downto 0);
signal addr: std_logic_vector(15 downto 0);
signal counter,nextcounter : std_logic_vector (4 downto 0);
signal nextre,nextwe,re,we: std_logic;
signal rasterize_input : std_logic_vector(15 downto 0);
signal data_reg,nextdata_reg: std_logic_vector(15 downto 0);
signal decoded_index: std_logic_vector(15 downto 0);
begin
opp <= opcode;
--- Decoding the rast_index which is the bit location that needs to be set in memory location pointed by rast_addr.
decoder : process(rast_index)
begin
	case rast_index is 
	when x"0" =>
		decoded_index <= "0000000000000001" ;
	when x"1" => 
		decoded_index <= x"0002";
      when x"2" =>
      	decoded_index <= x"0004" ;
      when x"3" =>
      	decoded_index <= x"0008" ;			     
      when x"4" =>
      	decoded_index <= x"0010" ;
      when x"5" =>
      	decoded_index <= x"0020" ;
      when x"6" =>
      	decoded_index <= x"0040" ;
      when x"7" =>
      	decoded_index <= x"0080" ;	
	when x"8" =>
		decoded_index <= x"0100" ;
	when x"9" => 
		decoded_index <= x"0200";
      when x"A" =>
      	decoded_index <= x"0400" ;
      when x"B" =>
      	decoded_index <= x"0800" ;			     
      when x"C" =>
      	decoded_index <= x"1000" ;
      when x"D" =>
      	decoded_index <= x"2000" ;
      when x"E" =>
      	decoded_index <= x"4000" ;
      when x"F" =>
      	decoded_index <= x"8000" ;    
      when others =>
      	decoded_index <= x"FFFF";
      end case;  			     
end process decoder;
---- The control of the bidiretional databus.
dataa: process(re,ram_in_use,rasterize_input,databus,we)
begin

	if ram_in_use = '0' and re = '0'and we = '1' then 		
			databus <= rasterize_input;	
	else
		databus <= (others => 'Z');	
	end if;

end process dataa;
	databus_out <= op_code;	
reg1: process(clk,op_strb,rst_n)
begin
        if rst_n = '0' then
	   state <= idle;
           opcode <= (others => '0');
           addr <= x"0000";
           tem <= '0';
           tem2 <= '0';
           counter <= (others => '0');
           re <= '0';
           we <= '0';
	elsif rising_edge(clk) then
               opcode <= nextopcode;
               addr <= nextaddr;
               data_reg <= nextdata_reg;
		state <= nextstate;
		tem2 <= tem;
            tem <= strb;
            counter <= nextcounter;
            re <= nextre;
            we <= nextwe;
	end if;
end process reg1;
---- The control of the addresbus.
addr_put: process(ram_in_use,addr,re,we)
begin
	case ram_in_use is
		when '0' =>
			addr_out <= addr(14 downto 0);
			re_out <= re;
			we_out <= we;
		when others =>	
			we_out <= 'Z';
			re_out <= 'Z';
			addr_out <= "ZZZZZZZZZZZZZZZ";
	end case;

end process addr_put;
comb: process (state,ram_in_use,rast_addr,rast_strb,rast_done,math_done,op_code,op_strb,data_reg,counter,addr,opcode,err)
begin
     nextopcode <= opcode;
	nextaddr <=  addr;
	nextcounter <= counter;
	nextdata_reg <= data_reg;
	nextre <= '0';
	nextwe <= '0';
        nextstate <= state;
        init_math <= '0';
        gpu_done <= '0';
        init_rast <= '0';
        strb_cor <= '0';
        strb_matrix <= '0';
	case state is
  
	when idle =>                                        --- The idle state of the state machine.
		nextcounter <= (others => '0');
		gpu_done <= '1';
           if(op_strb = '1') then
           	gpu_done <= '0';
		nextstate <= get_opcode;
           else 
            	nextstate <= idle;
           end if;
	when get_opcode =>                                  --- Get the opcode that is put by the Micro-Controller on the databus.
           nextopcode <= op_code;
           nextstate <= got_opcode;
      when got_opcode =>
         if(op_strb = '1') then 
		nextstate <= get_addr;
	   end if;
        when get_addr=>							--- Get the address put on the databus by the Micro-Controller.
		nextaddr <= op_code;
		nextstate <= wait_state;
	when wait_state =>						-- Wait until the CPU/Micro -Controller frees the memory.
	     if ram_in_use = '0' then
	     		nextstate <= memcont;
	     end if;
	when memcont =>							-- Check the opcode given . If valid continue with operations. I										-- If invalid return to the idle state.
		if counter = "10000" and opcode = loadmatrix then  
			nextstate <= idle;
		elsif counter = "00110" and opcode = loadline then
			nextstate <= math_act;
		elsif opcode = loadline or opcode = loadmatrix then
	
           		nextstate <= delaystate;
           		nextre <= '1';
           	else
           		nextstate <= idle;
         	end if;
           		
           		
      when delaystate =>                                               --- The delay state along with the latch data load 													--the contents of the ram into the necessay buffers
      	nextre <= '1';								--based on the opcodes.	

      	nextstate <= latchdata;
      when latchdata => 
      	if opcode = loadmatrix then
      		strb_matrix <= '1';
      	elsif opcode = loadline then 
      		strb_cor <= '1';
      	end if;
      	nextstate <= memcont;
      	nextaddr <= addr + 1;
      	nextcounter <= counter + 1;
      when math_act =>				--- Gives the matrix_math block a signal to start procesing data and waits until 
      						-- its done
      	init_math <= '1';
           if math_done = '1' then
             if err = '0' then 
              nextstate <= rasterize;
               init_rast <= '1';
             else 
              nextstate <= idle;
             end if;
             
           end if;
-- The rasterizing process. The gpu send the rasterizer block a signal to start its process. Whenever it gets a signal ----- ---from rasterizer (rast_strb). It modifies the memory location pointed by rast_addr. It waits in this loop until it gets 
--rast_done signal from the rasterizer. 
      when rasterize => 
    	
    		  nextaddr <= rast_addr;
    		  if rast_done = '1' then 
    		  nextstate <= idle;
    		  
    		  elsif rast_strb = '1' then 
    		  	nextstate <= get_data;
    	            nextre <= '1';
    		  end if;
      when get_data =>
            nextre <= '1';
       	
     		nextstate <= delaystate2;
      when delaystate2 =>
            
	      nextdata_reg <= op_code;
       	nextstate <= gettingdata;
       	nextwe <= '1';
      when gettingdata =>
      	nextwe <= '1';
      	nextstate <= storing;
      when storing =>
      	
      	nextstate <= rasterize;
      when delaystate3 =>
      --	we <= '1';
      	nextstate <= rasterize;
        end case;
end process comb;
----- process dectedting the strobe.
edge1: process (tem,tem2)
    begin
   op_strb <= not tem2 and tem;
end process edge1;
   op_code <= databus;
   strb <= strb_in;
   rasterize_input <= data_reg or decoded_index;
end struct;

