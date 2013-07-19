

LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity Rasterizer is
port( clk : in std_logic;
  X0 : in std_logic_vector (7 DOWNTO 0);
  X1 : in std_logic_vector (7 DOWNTO 0);
Y0 : in std_logic_vector (7 DOWNTO 0);
Y1 : in std_logic_vector (7 DOWNTO 0);
init_rast : in std_logic;
RST_N : in std_logic;
rast_done: out std_logic;
rast_strb: out std_logic;
rast_index : out std_logic_vector(3 downto 0);
rast_addr : out std_logic_vector(15 downto 0)
);
end Rasterizer;

architecture Mixed of Rasterizer is
type state_type is (idle, setup1, setup2, setup3, setup4, setup5, addrcalc, inci, checkerr, yinc, xinc,
                    waitforsub,waitfordone,midwait);
signal state, nextstate : state_type;
  signal iX,iY,steep, iXn,iYn, steepn : std_logic;
  signal X,Y, Xn,Yn : std_logic_vector(7 downto 0);
  signal err, errn : std_logic_vector(11 downto 0);
  signal dx, dy, dxn, dyn : std_logic_vector(8 downto 0);
  signal rast_addri, rast_addrin : std_logic_vector(15 downto 0);
  signal rast_indexi, rast_indexin : std_logic_vector(7 downto 0);
  signal i, i_n : std_logic_vector(7 downto 0);
  signal count, countn : std_logic_vector(3 downto 0);
 begin 
stateflop:  process(clk, RST_N)
    begin
if RST_N='0' then
  state<=idle;
  dx<=(others=>'0');
  dy<=(others=>'0');
  X<=(others=>'0');
  Y<=(others=>'0');
  iX<='0';
  iY<='0';
  steep<='0';
  err<=x"100"; 
  rast_addri<=(others=>'0');
  rast_indexi<=(others=>'0');
  i<=(others=>'0');
  count<=x"0";
elsif (rising_edge(clk)) then
  state<=nextstate;
  iX<=iXn;
  iY<=iYn;
  steep<=steepn;
  X<=Xn;
  Y<=Yn;
  err<=errn;
  dx<=dxn;
  dy<=dyn;
  i<=i_n;
  rast_addri<=rast_addrin;
  rast_indexi<=rast_indexin;
  count<=countn;  
end if;

  end process;
  
nextlogic:  process(state,count, init_rast, X0,Y0,X1,Y1,i,dx,dy,err,x,y,steep,ix,iy, rast_addri, rast_indexi)
    begin
     iXn<=iX;
     iYn<=iY;
     steepn<=steep;
     Xn<=X;
     Yn<=Y;
     errn<=err;
     dxn<=dx;
     dyn<=dy;
     i_n<=i; 
     rast_indexin<=rast_indexi;
     rast_addrin<=rast_addri;
     countn<=count; 
  
  case state is
when idle=>
  if init_rast='1' then
  nextstate<=setup1;
  else
  nextstate<=idle;
  end if;
  rast_done<='0';
    rast_strb<='0';
    i_n<=(others=>'0');
    ixn<='0';
    iyn<='0';
    errn<=x"100";
    steepn<='0';
    
when setup1=>
  Xn<=X0;
  Yn<=Y0; 
  if X0>X1 then
  dxn<='0'&(X0-X1);
  iXn<='1';
 --  Xn<=X1;
--   Yn<=Y1;   
else
  dxn<='0'&(X1-X0);
  ixn<='0';
--  Xn<=X0;
--  Yn<=Y0;
end if;
if(Y0>Y1) then
-- neg slope
dyn<='0'&(Y0-Y1);
iYn<='1';
else
dyn<='0'&(Y1-Y0); 
iyn<='0';
end if;

  nextstate<=setup3;
  rast_done<='0';
    rast_strb<='0';
when waitforsub=> --obsolete state remove
nextstate<=setup2;    
rast_done<='0';
  rast_strb<='0';    
when setup2=> -- same here
  if dx>=0 then
    ixn<='1';
  else
    ixn<='0';
  dxn<= (not dx)+1;
end if;
if dy>=0 then
  iyn<='1';
else
  iyn<='0';
  dyn<=(not dy)+1;
end if;
  nextstate<=setup3;
  rast_done<='0';
    rast_strb<='0';
    
    
when setup3=>
  dxn<=dx(7 downto 0) & '0';
  dyn<=dy(7 downto 0) & '0';
  steepn<='0';
  nextstate<=setup5;
  if dx<dy then
    steepn<='1';
    nextstate<=setup4;
  end if;
  rast_done<='0';
    rast_strb<='0';
    
    
when setup4=>
  -- swap x and y if steep
  if steep='1' then
  dxn<=dy;
  dyn<=dx;
  Xn<=Y;
  Yn<=X;
  iXn<=iY;
  iYn<=iX;
  end if;
   nextstate<=setup5;
   rast_done<='0';
     rast_strb<='0';
     
     
when setup5=>
  errn<="000"&((dy+256)-dx(8 downto 1));
  nextstate<=addrcalc;
  rast_done<='0';
    rast_strb<='0';
    
    
when addrcalc=>
  if steep='0' then
rast_addrin<=((Y&"00000000")+X); -- Any better way?
rast_indexin<=X-(X(7 downto 4) & "0000");
else
 rast_addrin<=((X&"00000000")+Y); -- Any better way?
rast_indexin<=Y-(Y(7 downto 4) & "0000"); 
end if;
 --- calc addr from x and y;
 rast_strb<='0';
  nextstate<=midwait;
  rast_done<='0';
countn<=x"0";


when midwait=> 
nextstate<=midwait;
if(count =0) then
rast_strb<='1';
else
rast_strb<='0';
end if;

if(count=1) then
nextstate<=inci;
end if; 
countn<=count+1;
rast_done<='0';
   --rast_strb<='0';
   
   
when inci=>
  i_n<=i+1;
  countn<="0000";
  if(i>=dx(8 downto 1)) then
  nextstate<=waitfordone;
  rast_done<='0';
else
  nextstate<=checkerr;
  rast_done<='0';
end if;

  rast_strb<='0';
  
  
when checkerr=>
if err>=256 then
  nextstate<=yinc;
 else
   nextstate<=xinc;
 end if;
 rast_done<='0';
   rast_strb<='0';
   
   
when yinc=>
errn<=err-dx;

if iY='0' then
Yn<=Y+1;
else
Yn<=Y-1;
end if;
nextstate<=xinc; 
rast_done<='0';
  rast_strb<='0';
  
 
when xinc=>
errn<=err+dy;

if iX='0' then
Xn<=X+1;
else
Xn<=X-1;
end if;
rast_done<='0';
  rast_strb<='0';
nextstate<=addrcalc;

when waitfordone=>
nextstate<=waitfordone;
if(count=5) then
nextstate<=idle;
end if; 
countn<=count+1;

rast_done<='1';
  rast_strb<='0';

when others=>
  rast_done<='0';
  rast_strb<='0';
  nextstate<=idle;
end case;
end process;
  
rast_addr<="0000"&rast_addri(15 downto 4);
rast_index<=rast_indexi(3 downto 0);  
end Mixed;
