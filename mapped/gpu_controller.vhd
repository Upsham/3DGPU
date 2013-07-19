
library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

package CONV_PACK_gpu_controller is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_gpu_controller;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gpu_controller.all;

entity gpu_controller_DW01_inc_1 is

   port( A : in std_logic_vector (15 downto 0);  SUM : out std_logic_vector (15
         downto 0));

end gpu_controller_DW01_inc_1;

architecture SYN_rpl of gpu_controller_DW01_inc_1 is

   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component HAX1
      port( A, B : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port, 
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port : 
      std_logic;

begin
   
   U1_1_14 : HAX1 port map( A => A(14), B => carry_14_port, YC => carry_15_port
                           , YS => SUM(14));
   U1_1_13 : HAX1 port map( A => A(13), B => carry_13_port, YC => carry_14_port
                           , YS => SUM(13));
   U1_1_12 : HAX1 port map( A => A(12), B => carry_12_port, YC => carry_13_port
                           , YS => SUM(12));
   U1_1_11 : HAX1 port map( A => A(11), B => carry_11_port, YC => carry_12_port
                           , YS => SUM(11));
   U1_1_10 : HAX1 port map( A => A(10), B => carry_10_port, YC => carry_11_port
                           , YS => SUM(10));
   U1_1_9 : HAX1 port map( A => A(9), B => carry_9_port, YC => carry_10_port, 
                           YS => SUM(9));
   U1_1_8 : HAX1 port map( A => A(8), B => carry_8_port, YC => carry_9_port, YS
                           => SUM(8));
   U1_1_7 : HAX1 port map( A => A(7), B => carry_7_port, YC => carry_8_port, YS
                           => SUM(7));
   U1_1_6 : HAX1 port map( A => A(6), B => carry_6_port, YC => carry_7_port, YS
                           => SUM(6));
   U1_1_5 : HAX1 port map( A => A(5), B => carry_5_port, YC => carry_6_port, YS
                           => SUM(5));
   U1_1_4 : HAX1 port map( A => A(4), B => carry_4_port, YC => carry_5_port, YS
                           => SUM(4));
   U1_1_3 : HAX1 port map( A => A(3), B => carry_3_port, YC => carry_4_port, YS
                           => SUM(3));
   U1_1_2 : HAX1 port map( A => A(2), B => carry_2_port, YC => carry_3_port, YS
                           => SUM(2));
   U1_1_1 : HAX1 port map( A => A(1), B => A(0), YC => carry_2_port, YS => 
                           SUM(1));
   U1 : INVX2 port map( A => A(0), Y => SUM(0));
   U2 : XOR2X1 port map( A => carry_15_port, B => A(15), Y => SUM(15));

end SYN_rpl;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_gpu_controller.all;

entity gpu_controller is

   port( databus : inout std_logic_vector (15 downto 0);  strb_in, clk, rst_n :
         in std_logic;  gpu_done : out std_logic;  ram_in_use, rast_done : in 
         std_logic;  init_rast : out std_logic;  rast_addr : in 
         std_logic_vector (15 downto 0);  rast_strb : in std_logic;  rast_index
         : in std_logic_vector (3 downto 0);  math_done : in std_logic;  
         init_math, strb_matrix, strb_cor : out std_logic;  err : in std_logic;
         addr_out : out std_logic_vector (14 downto 0);  re_out, we_out : out 
         std_logic;  databus_out, opp : out std_logic_vector (15 downto 0));

end gpu_controller;

architecture SYN_struct of gpu_controller is

   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component TBUFX1
      port( A, EN : in std_logic;  Y : out std_logic);
   end component;
   
   component HAX1
      port( A, B : in std_logic;  YC, YS : out std_logic);
   end component;
   
   component gpu_controller_DW01_inc_1
      port( A : in std_logic_vector (15 downto 0);  SUM : out std_logic_vector 
            (15 downto 0));
   end component;
   
   component AND2X2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   component DFFPOSX1
      port( D, CLK : in std_logic;  Q : out std_logic);
   end component;
   
   signal opp_15_port, opp_14_port, opp_13_port, opp_12_port, opp_11_port, 
      opp_10_port, opp_9_port, opp_8_port, opp_7_port, opp_6_port, opp_5_port, 
      opp_4_port, opp_3_port, opp_2_port, opp_1_port, opp_0_port, re, we, 
      state_3_port, state_2_port, state_1_port, state_0_port, addr_15_port, 
      addr_14_port, addr_13_port, addr_12_port, addr_11_port, addr_10_port, 
      addr_9_port, addr_8_port, addr_7_port, addr_6_port, addr_5_port, 
      addr_4_port, addr_3_port, addr_2_port, addr_1_port, addr_0_port, tem, 
      tem2, counter_4_port, counter_3_port, counter_2_port, counter_1_port, 
      counter_0_port, data_reg_15_port, data_reg_14_port, data_reg_13_port, 
      data_reg_12_port, data_reg_11_port, data_reg_10_port, data_reg_9_port, 
      data_reg_8_port, data_reg_7_port, data_reg_6_port, data_reg_5_port, 
      data_reg_4_port, data_reg_3_port, data_reg_2_port, data_reg_1_port, 
      data_reg_0_port, nextre, N297, N298, N299, N300, N301, N302, N303, N304, 
      N305, N306, N307, N308, N309, N310, N311, N312, N314, N315, N316, N317, 
      n1, n2, n3, n7, n8, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23
      , n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, 
      n38, n39, n40, n41, n42, n43, n44, n45, n46, n48, n49, n51, n52, n53, n54
      , n59, n61, n63, n65, n67, n68, n69, n73, n74, n75, n77, n78, n79, n80, 
      n81, n82, n83, n84, n85, n86, n87, n88, n90, n91, n93, n94, n95, n96, n97
      , n98, n99, n100, n101, n102, n104, n105, n107, n108, n109, n110, n111, 
      n112, n114, n115, n116, n117, n119, n120, n122, n123, n124, n126, n127, 
      n128, n129, n130, n132, n133, n134, n135, n137, n138, n140, n141, n142, 
      n143, n144, n146, n147, n149, n150, n151, n154, n155, n156, n157, n158, 
      n159, n160, n161, n162, n163, n165, n166, n167, n169, n170, n171, n172, 
      n173, n174, n176, n177, n178, n180, n182, n183, n184, n185, n186, n187, 
      n189, n190, n193, n194, n195, n196, n197, n198, n199, n200, n202, n203, 
      n204, n205, n206, n207, n208, n209, n210, n229, n230, n231, n232, n233, 
      n234, n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245, 
      n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256, n257, 
      n258, n259, n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, 
      n270, n271, n272, n273, n274, n276, n277, n278, n279, n280, n281, n282, 
      n283, n284, n285, n286, n287, n288, n289, n290, n291, n293, n294, n295, 
      n296, n297_port, n298_port, n300_port, n312_port, n314_port, n324, n326, 
      n328, n329, n330, n331, add_213_carry_2_port, add_213_carry_3_port, 
      add_213_carry_4_port, n333, n334, n335, n336, n337, n338, n339, n340, 
      n341, n342, n343, n344, n345, n346, n347, n348, n349, n350, n351, n352, 
      n353, n354, n355, n356, n357, n358, n359, n360, n361, n362, n363, n364, 
      n365, n366, n367, n368, n369, n370, n371, n372, n373, n374, n375, n376, 
      n377, n378, n379, n380, n381, n382, n383, n384, n385, n386, n388, n389, 
      n390, n391, n392, n393, n394, n395, n396, n397, n398, n399, n400, n401, 
      n402, n403, n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, 
      n414, n415, n416, n417, n418, n419, n420, n421, n422, n423 : std_logic;

begin
   databus_out <= ( databus(15), databus(14), databus(13), databus(12), 
      databus(11), databus(10), databus(9), databus(8), databus(7), databus(6),
      databus(5), databus(4), databus(3), databus(2), databus(1), databus(0) );
   opp <= ( opp_15_port, opp_14_port, opp_13_port, opp_12_port, opp_11_port, 
      opp_10_port, opp_9_port, opp_8_port, opp_7_port, opp_6_port, opp_5_port, 
      opp_4_port, opp_3_port, opp_2_port, opp_1_port, opp_0_port );
   
   tem_reg : DFFSR port map( D => strb_in, CLK => clk, R => rst_n, S => n273, Q
                           => tem);
   tem2_reg : DFFSR port map( D => tem, CLK => clk, R => rst_n, S => n272, Q =>
                           tem2);
   we_reg : DFFSR port map( D => n274, CLK => clk, R => rst_n, S => n271, Q => 
                           we);
   opcode_reg_15_inst : DFFSR port map( D => n361, CLK => clk, R => rst_n, S =>
                           n270, Q => opp_15_port);
   state_reg_3_inst : DFFSR port map( D => n331, CLK => clk, R => rst_n, S => 
                           n269, Q => state_3_port);
   counter_reg_4_inst : DFFSR port map( D => n293, CLK => clk, R => rst_n, S =>
                           n268, Q => counter_4_port);
   state_reg_2_inst : DFFSR port map( D => n330, CLK => clk, R => rst_n, S => 
                           n267, Q => state_2_port);
   state_reg_0_inst : DFFSR port map( D => n328, CLK => clk, R => rst_n, S => 
                           n266, Q => state_0_port);
   state_reg_1_inst : DFFSR port map( D => n329, CLK => clk, R => rst_n, S => 
                           n265, Q => state_1_port);
   data_reg_reg_0_inst : DFFPOSX1 port map( D => n354, CLK => clk, Q => 
                           data_reg_0_port);
   data_reg_reg_1_inst : DFFPOSX1 port map( D => n353, CLK => clk, Q => 
                           data_reg_1_port);
   data_reg_reg_2_inst : DFFPOSX1 port map( D => n352, CLK => clk, Q => 
                           data_reg_2_port);
   data_reg_reg_3_inst : DFFPOSX1 port map( D => n351, CLK => clk, Q => 
                           data_reg_3_port);
   data_reg_reg_4_inst : DFFPOSX1 port map( D => n350, CLK => clk, Q => 
                           data_reg_4_port);
   data_reg_reg_5_inst : DFFPOSX1 port map( D => n349, CLK => clk, Q => 
                           data_reg_5_port);
   data_reg_reg_6_inst : DFFPOSX1 port map( D => n348, CLK => clk, Q => 
                           data_reg_6_port);
   data_reg_reg_7_inst : DFFPOSX1 port map( D => n347, CLK => clk, Q => 
                           data_reg_7_port);
   data_reg_reg_8_inst : DFFPOSX1 port map( D => n346, CLK => clk, Q => 
                           data_reg_8_port);
   data_reg_reg_9_inst : DFFPOSX1 port map( D => n345, CLK => clk, Q => 
                           data_reg_9_port);
   data_reg_reg_10_inst : DFFPOSX1 port map( D => n344, CLK => clk, Q => 
                           data_reg_10_port);
   data_reg_reg_11_inst : DFFPOSX1 port map( D => n343, CLK => clk, Q => 
                           data_reg_11_port);
   data_reg_reg_12_inst : DFFPOSX1 port map( D => n342, CLK => clk, Q => 
                           data_reg_12_port);
   data_reg_reg_13_inst : DFFPOSX1 port map( D => n341, CLK => clk, Q => 
                           data_reg_13_port);
   data_reg_reg_14_inst : DFFPOSX1 port map( D => n340, CLK => clk, Q => 
                           data_reg_14_port);
   data_reg_reg_15_inst : DFFPOSX1 port map( D => n339, CLK => clk, Q => 
                           data_reg_15_port);
   opcode_reg_0_inst : DFFSR port map( D => n326, CLK => clk, R => rst_n, S => 
                           n264, Q => opp_0_port);
   opcode_reg_1_inst : DFFSR port map( D => n324, CLK => clk, R => rst_n, S => 
                           n263, Q => opp_1_port);
   opcode_reg_2_inst : DFFSR port map( D => n362, CLK => clk, R => rst_n, S => 
                           n262, Q => opp_2_port);
   opcode_reg_3_inst : DFFSR port map( D => n357, CLK => clk, R => rst_n, S => 
                           n261, Q => opp_3_port);
   opcode_reg_4_inst : DFFSR port map( D => n363, CLK => clk, R => rst_n, S => 
                           n260, Q => opp_4_port);
   opcode_reg_5_inst : DFFSR port map( D => n356, CLK => clk, R => rst_n, S => 
                           n259, Q => opp_5_port);
   opcode_reg_6_inst : DFFSR port map( D => n314_port, CLK => clk, R => rst_n, 
                           S => n258, Q => opp_6_port);
   opcode_reg_7_inst : DFFSR port map( D => n312_port, CLK => clk, R => rst_n, 
                           S => n257, Q => opp_7_port);
   opcode_reg_8_inst : DFFSR port map( D => n364, CLK => clk, R => rst_n, S => 
                           n256, Q => opp_8_port);
   opcode_reg_9_inst : DFFSR port map( D => n355, CLK => clk, R => rst_n, S => 
                           n255, Q => opp_9_port);
   opcode_reg_10_inst : DFFSR port map( D => n359, CLK => clk, R => rst_n, S =>
                           n254, Q => opp_10_port);
   opcode_reg_11_inst : DFFSR port map( D => n360, CLK => clk, R => rst_n, S =>
                           n253, Q => opp_11_port);
   opcode_reg_12_inst : DFFSR port map( D => n358, CLK => clk, R => rst_n, S =>
                           n252, Q => opp_12_port);
   opcode_reg_13_inst : DFFSR port map( D => n300_port, CLK => clk, R => rst_n,
                           S => n251, Q => opp_13_port);
   opcode_reg_14_inst : DFFSR port map( D => n298_port, CLK => clk, R => rst_n,
                           S => n250, Q => opp_14_port);
   counter_reg_3_inst : DFFSR port map( D => n294, CLK => clk, R => rst_n, S =>
                           n249, Q => counter_3_port);
   counter_reg_0_inst : DFFSR port map( D => n297_port, CLK => clk, R => rst_n,
                           S => n248, Q => counter_0_port);
   counter_reg_1_inst : DFFSR port map( D => n296, CLK => clk, R => rst_n, S =>
                           n247, Q => counter_1_port);
   counter_reg_2_inst : DFFSR port map( D => n295, CLK => clk, R => rst_n, S =>
                           n246, Q => counter_2_port);
   addr_reg_15_inst : DFFSR port map( D => n276, CLK => clk, R => rst_n, S => 
                           n245, Q => addr_15_port);
   addr_reg_0_inst : DFFSR port map( D => n291, CLK => clk, R => rst_n, S => 
                           n244, Q => addr_0_port);
   addr_reg_1_inst : DFFSR port map( D => n290, CLK => clk, R => rst_n, S => 
                           n243, Q => addr_1_port);
   addr_reg_2_inst : DFFSR port map( D => n289, CLK => clk, R => rst_n, S => 
                           n242, Q => addr_2_port);
   addr_reg_3_inst : DFFSR port map( D => n288, CLK => clk, R => rst_n, S => 
                           n241, Q => addr_3_port);
   addr_reg_4_inst : DFFSR port map( D => n287, CLK => clk, R => rst_n, S => 
                           n240, Q => addr_4_port);
   addr_reg_5_inst : DFFSR port map( D => n286, CLK => clk, R => rst_n, S => 
                           n239, Q => addr_5_port);
   addr_reg_6_inst : DFFSR port map( D => n285, CLK => clk, R => rst_n, S => 
                           n238, Q => addr_6_port);
   addr_reg_7_inst : DFFSR port map( D => n284, CLK => clk, R => rst_n, S => 
                           n237, Q => addr_7_port);
   addr_reg_8_inst : DFFSR port map( D => n283, CLK => clk, R => rst_n, S => 
                           n236, Q => addr_8_port);
   addr_reg_9_inst : DFFSR port map( D => n282, CLK => clk, R => rst_n, S => 
                           n235, Q => addr_9_port);
   addr_reg_10_inst : DFFSR port map( D => n281, CLK => clk, R => rst_n, S => 
                           n234, Q => addr_10_port);
   addr_reg_11_inst : DFFSR port map( D => n280, CLK => clk, R => rst_n, S => 
                           n233, Q => addr_11_port);
   addr_reg_12_inst : DFFSR port map( D => n279, CLK => clk, R => rst_n, S => 
                           n232, Q => addr_12_port);
   addr_reg_13_inst : DFFSR port map( D => n278, CLK => clk, R => rst_n, S => 
                           n231, Q => addr_13_port);
   addr_reg_14_inst : DFFSR port map( D => n277, CLK => clk, R => rst_n, S => 
                           n230, Q => addr_14_port);
   re_reg : DFFSR port map( D => nextre, CLK => clk, R => rst_n, S => n229, Q 
                           => re);
   U4 : NOR2X1 port map( A => n1, B => n2, Y => strb_matrix);
   U5 : NOR2X1 port map( A => n2, B => n3, Y => strb_cor);
   U6 : OAI21X1 port map( A => n367, B => n368, C => n376, Y => nextre);
   U8 : NAND2X1 port map( A => n7, B => n8, Y => n276);
   U9 : AOI22X1 port map( A => addr_15_port, B => n333, C => N312, D => n379, Y
                           => n8);
   U10 : AOI22X1 port map( A => rast_addr(15), B => n384, C => databus(15), D 
                           => n385, Y => n7);
   U11 : NAND2X1 port map( A => n13, B => n14, Y => n277);
   U12 : AOI22X1 port map( A => n333, B => addr_14_port, C => N311, D => n379, 
                           Y => n14);
   U13 : AOI22X1 port map( A => rast_addr(14), B => n384, C => databus(14), D 
                           => n385, Y => n13);
   U14 : NAND2X1 port map( A => n15, B => n16, Y => n278);
   U15 : AOI22X1 port map( A => n333, B => addr_13_port, C => N310, D => n379, 
                           Y => n16);
   U16 : AOI22X1 port map( A => rast_addr(13), B => n384, C => databus(13), D 
                           => n385, Y => n15);
   U17 : NAND2X1 port map( A => n17, B => n18, Y => n279);
   U18 : AOI22X1 port map( A => n333, B => addr_12_port, C => N309, D => n379, 
                           Y => n18);
   U19 : AOI22X1 port map( A => rast_addr(12), B => n384, C => databus(12), D 
                           => n385, Y => n17);
   U20 : NAND2X1 port map( A => n19, B => n20, Y => n280);
   U21 : AOI22X1 port map( A => n333, B => addr_11_port, C => N308, D => n379, 
                           Y => n20);
   U22 : AOI22X1 port map( A => rast_addr(11), B => n384, C => databus(11), D 
                           => n385, Y => n19);
   U23 : NAND2X1 port map( A => n21, B => n22, Y => n281);
   U24 : AOI22X1 port map( A => n333, B => addr_10_port, C => N307, D => n379, 
                           Y => n22);
   U25 : AOI22X1 port map( A => rast_addr(10), B => n384, C => databus(10), D 
                           => n385, Y => n21);
   U26 : NAND2X1 port map( A => n23, B => n24, Y => n282);
   U27 : AOI22X1 port map( A => n333, B => addr_9_port, C => N306, D => n379, Y
                           => n24);
   U28 : AOI22X1 port map( A => rast_addr(9), B => n384, C => databus(9), D => 
                           n385, Y => n23);
   U29 : NAND2X1 port map( A => n25, B => n26, Y => n283);
   U30 : AOI22X1 port map( A => n333, B => addr_8_port, C => N305, D => n379, Y
                           => n26);
   U31 : AOI22X1 port map( A => rast_addr(8), B => n384, C => databus(8), D => 
                           n385, Y => n25);
   U32 : NAND2X1 port map( A => n27, B => n28, Y => n284);
   U33 : AOI22X1 port map( A => n333, B => addr_7_port, C => N304, D => n379, Y
                           => n28);
   U34 : AOI22X1 port map( A => rast_addr(7), B => n384, C => databus(7), D => 
                           n385, Y => n27);
   U35 : NAND2X1 port map( A => n29, B => n30, Y => n285);
   U36 : AOI22X1 port map( A => n333, B => addr_6_port, C => N303, D => n379, Y
                           => n30);
   U37 : AOI22X1 port map( A => rast_addr(6), B => n384, C => databus(6), D => 
                           n385, Y => n29);
   U38 : NAND2X1 port map( A => n31, B => n32, Y => n286);
   U39 : AOI22X1 port map( A => n333, B => addr_5_port, C => N302, D => n379, Y
                           => n32);
   U40 : AOI22X1 port map( A => rast_addr(5), B => n384, C => databus(5), D => 
                           n385, Y => n31);
   U41 : NAND2X1 port map( A => n33, B => n34, Y => n287);
   U42 : AOI22X1 port map( A => n333, B => addr_4_port, C => N301, D => n379, Y
                           => n34);
   U43 : AOI22X1 port map( A => rast_addr(4), B => n384, C => databus(4), D => 
                           n385, Y => n33);
   U44 : NAND2X1 port map( A => n35, B => n36, Y => n288);
   U45 : AOI22X1 port map( A => n333, B => addr_3_port, C => N300, D => n379, Y
                           => n36);
   U46 : AOI22X1 port map( A => rast_addr(3), B => n384, C => databus(3), D => 
                           n385, Y => n35);
   U47 : NAND2X1 port map( A => n37, B => n38, Y => n289);
   U48 : AOI22X1 port map( A => n333, B => addr_2_port, C => N299, D => n379, Y
                           => n38);
   U49 : AOI22X1 port map( A => rast_addr(2), B => n384, C => databus(2), D => 
                           n385, Y => n37);
   U50 : NAND2X1 port map( A => n39, B => n40, Y => n290);
   U51 : AOI22X1 port map( A => n333, B => addr_1_port, C => N298, D => n379, Y
                           => n40);
   U52 : AOI22X1 port map( A => rast_addr(1), B => n384, C => databus(1), D => 
                           n385, Y => n39);
   U53 : NAND2X1 port map( A => n41, B => n42, Y => n291);
   U54 : AOI22X1 port map( A => n333, B => addr_0_port, C => N297, D => n379, Y
                           => n42);
   U56 : NAND3X1 port map( A => n45, B => n46, C => n383, Y => n44);
   U58 : NAND3X1 port map( A => n49, B => n386, C => n51, Y => n43);
   U59 : AOI22X1 port map( A => rast_addr(0), B => n384, C => databus(0), D => 
                           n385, Y => n41);
   U63 : AOI22X1 port map( A => databus(15), B => n338, C => n334, D => 
                           data_reg_15_port, Y => n54);
   U64 : OAI21X1 port map( A => n381, B => n390, C => n59, Y => n293);
   U65 : NAND2X1 port map( A => N317, B => n379, Y => n59);
   U66 : OAI21X1 port map( A => n381, B => n404, C => n61, Y => n294);
   U67 : NAND2X1 port map( A => N316, B => n379, Y => n61);
   U68 : OAI21X1 port map( A => n381, B => n407, C => n63, Y => n295);
   U69 : NAND2X1 port map( A => N315, B => n379, Y => n63);
   U70 : OAI21X1 port map( A => n381, B => n406, C => n65, Y => n296);
   U71 : NAND2X1 port map( A => N314, B => n379, Y => n65);
   U72 : OAI21X1 port map( A => n381, B => n405, C => n67, Y => n297_port);
   U73 : NAND2X1 port map( A => n405, B => n379, Y => n67);
   U75 : NAND3X1 port map( A => n69, B => n386, C => n382, Y => n68);
   U77 : OAI22X1 port map( A => n336, B => n403, C => n73, D => n337, Y => 
                           n298_port);
   U80 : AOI22X1 port map( A => databus(14), B => n338, C => n334, D => 
                           data_reg_14_port, Y => n75);
   U81 : OAI22X1 port map( A => n336, B => n402, C => n77, D => n337, Y => 
                           n300_port);
   U84 : AOI22X1 port map( A => databus(13), B => n338, C => n334, D => 
                           data_reg_13_port, Y => n78);
   U86 : AOI22X1 port map( A => n337, B => opp_12_port, C => databus(12), D => 
                           n336, Y => n79);
   U88 : AOI22X1 port map( A => databus(12), B => n338, C => n334, D => 
                           data_reg_12_port, Y => n80);
   U90 : AOI22X1 port map( A => n74, B => opp_11_port, C => databus(11), D => 
                           n336, Y => n81);
   U92 : AOI22X1 port map( A => databus(11), B => n338, C => n334, D => 
                           data_reg_11_port, Y => n82);
   U94 : AOI22X1 port map( A => n74, B => opp_10_port, C => databus(10), D => 
                           n336, Y => n83);
   U96 : AOI22X1 port map( A => databus(10), B => n338, C => n334, D => 
                           data_reg_10_port, Y => n84);
   U98 : AOI22X1 port map( A => n74, B => opp_9_port, C => databus(9), D => 
                           n336, Y => n85);
   U100 : AOI22X1 port map( A => databus(9), B => n338, C => n334, D => 
                           data_reg_9_port, Y => n86);
   U102 : AOI22X1 port map( A => n74, B => opp_8_port, C => databus(8), D => 
                           n336, Y => n87);
   U104 : AOI22X1 port map( A => databus(8), B => n338, C => n334, D => 
                           data_reg_8_port, Y => n88);
   U105 : OAI22X1 port map( A => n336, B => n400, C => n90, D => n337, Y => 
                           n312_port);
   U108 : AOI22X1 port map( A => databus(7), B => n338, C => n334, D => 
                           data_reg_7_port, Y => n91);
   U109 : OAI22X1 port map( A => n336, B => n399, C => n93, D => n337, Y => 
                           n314_port);
   U112 : AOI22X1 port map( A => databus(6), B => n338, C => n334, D => 
                           data_reg_6_port, Y => n94);
   U114 : AOI22X1 port map( A => n74, B => opp_5_port, C => databus(5), D => 
                           n336, Y => n95);
   U116 : AOI22X1 port map( A => databus(5), B => n338, C => n334, D => 
                           data_reg_5_port, Y => n96);
   U118 : AOI22X1 port map( A => n74, B => opp_4_port, C => databus(4), D => 
                           n336, Y => n97);
   U120 : AOI22X1 port map( A => databus(4), B => n338, C => n334, D => 
                           data_reg_4_port, Y => n98);
   U122 : AOI22X1 port map( A => n74, B => opp_3_port, C => databus(3), D => 
                           n336, Y => n99);
   U124 : AOI22X1 port map( A => databus(3), B => n338, C => n334, D => 
                           data_reg_3_port, Y => n100);
   U126 : AOI22X1 port map( A => n74, B => opp_2_port, C => databus(2), D => 
                           n336, Y => n101);
   U128 : AOI22X1 port map( A => databus(2), B => n338, C => n334, D => 
                           data_reg_2_port, Y => n102);
   U129 : OAI22X1 port map( A => n336, B => n397, C => n104, D => n337, Y => 
                           n324);
   U132 : AOI22X1 port map( A => databus(1), B => n338, C => n334, D => 
                           data_reg_1_port, Y => n105);
   U133 : OAI22X1 port map( A => n336, B => n396, C => n107, D => n337, Y => 
                           n326);
   U136 : AOI22X1 port map( A => databus(0), B => n338, C => n334, D => 
                           data_reg_0_port, Y => n108);
   U139 : NAND3X1 port map( A => n382, B => n69, C => rst_n, Y => n110);
   U140 : NAND3X1 port map( A => n46, B => n2, C => n111, Y => n109);
   U141 : OAI21X1 port map( A => n112, B => n394, C => n114, Y => n328);
   U142 : OAI21X1 port map( A => n115, B => n116, C => n112, Y => n114);
   U143 : OAI21X1 port map( A => n117, B => n46, C => n380, Y => n116);
   U145 : NAND2X1 port map( A => n120, B => n111, Y => n115);
   U146 : OAI21X1 port map( A => n112, B => n395, C => n122, Y => n329);
   U147 : OAI21X1 port map( A => n123, B => n124, C => n112, Y => n122);
   U148 : NAND2X1 port map( A => n45, B => n367, Y => n124);
   U149 : NOR2X1 port map( A => n389, B => n126, Y => n45);
   U150 : OAI21X1 port map( A => n127, B => n128, C => n129, Y => n126);
   U152 : NAND2X1 port map( A => n130, B => n391, Y => n69);
   U153 : NAND3X1 port map( A => n132, B => n133, C => n134, Y => n330);
   U154 : NOR2X1 port map( A => n123, B => n135, Y => n134);
   U155 : OAI21X1 port map( A => n112, B => n393, C => n120, Y => n135);
   U157 : NAND3X1 port map( A => counter_2_port, B => counter_1_port, C => n388
                           , Y => n138);
   U159 : NAND3X1 port map( A => n404, B => n390, C => n140, Y => n137);
   U160 : NOR2X1 port map( A => counter_0_port, B => n3, Y => n140);
   U162 : OAI21X1 port map( A => err, B => n141, C => n142, Y => n123);
   U164 : AOI21X1 port map( A => n144, B => n376, C => n365, Y => n331);
   U166 : NOR2X1 port map( A => n146, B => n147, Y => n112);
   U167 : OAI22X1 port map( A => n367, B => rast_strb, C => n129, D => n373, Y 
                           => n147);
   U169 : OAI22X1 port map( A => n133, B => n366, C => n141, D => math_done, Y 
                           => n146);
   U171 : OAI21X1 port map( A => n49, B => n151, C => n51, Y => n150);
   U172 : OAI21X1 port map( A => n377, B => n378, C => n154, Y => n151);
   U173 : NAND3X1 port map( A => n405, B => n404, C => n155, Y => n154);
   U174 : OAI21X1 port map( A => n156, B => n157, C => n158, Y => n155);
   U175 : NAND3X1 port map( A => counter_2_port, B => counter_1_port, C => n159
                           , Y => n158);
   U176 : NOR2X1 port map( A => counter_4_port, B => n3, Y => n159);
   U177 : NAND2X1 port map( A => counter_4_port, B => n378, Y => n157);
   U178 : NAND2X1 port map( A => n406, B => n407, Y => n156);
   U184 : NAND3X1 port map( A => n160, B => n397, C => opp_0_port, Y => n1);
   U187 : NAND3X1 port map( A => n160, B => n396, C => opp_1_port, Y => n3);
   U190 : NOR2X1 port map( A => n163, B => n398, Y => n162);
   U192 : NOR3X1 port map( A => opp_4_port, B => opp_5_port, C => opp_3_port, Y
                           => n165);
   U193 : NAND3X1 port map( A => n399, B => n400, C => n166, Y => n163);
   U194 : NOR2X1 port map( A => opp_9_port, B => opp_8_port, Y => n166);
   U197 : NOR2X1 port map( A => n167, B => n401, Y => n161);
   U199 : NOR3X1 port map( A => opp_11_port, B => opp_12_port, C => opp_10_port
                           , Y => n169);
   U200 : NAND3X1 port map( A => n402, B => n403, C => n170, Y => n167);
   U201 : NOR2X1 port map( A => opp_2_port, B => opp_15_port, Y => n170);
   U204 : NOR2X1 port map( A => n274, B => n149, Y => n144);
   U205 : NOR2X1 port map( A => rast_done, B => n53, Y => n149);
   U207 : AOI22X1 port map( A => n337, B => opp_15_port, C => databus(15), D =>
                           n336, Y => n171);
   U209 : NAND3X1 port map( A => n382, B => n46, C => n132, Y => n74);
   U210 : NOR2X1 port map( A => n274, B => n379, Y => n132);
   U212 : NAND3X1 port map( A => n391, B => n395, C => state_3_port, Y => n2);
   U214 : NAND3X1 port map( A => n53, B => n49, C => n173, Y => n172);
   U215 : NOR2X1 port map( A => n48, B => n119, Y => n173);
   U216 : NAND3X1 port map( A => n52, B => n51, C => n129, Y => n119);
   U217 : NAND2X1 port map( A => n174, B => n392, Y => n129);
   U218 : NAND2X1 port map( A => n392, B => state_3_port, Y => n51);
   U219 : NAND2X1 port map( A => n174, B => n391, Y => n52);
   U221 : NAND3X1 port map( A => n141, B => n143, C => n133, Y => n48);
   U222 : NAND3X1 port map( A => state_2_port, B => state_0_port, C => n174, Y 
                           => n133);
   U223 : NAND3X1 port map( A => state_3_port, B => n177, C => state_2_port, Y 
                           => n143);
   U224 : XOR2X1 port map( A => state_1_port, B => state_0_port, Y => n177);
   U225 : NAND3X1 port map( A => n130, B => n394, C => state_2_port, Y => n49);
   U226 : NAND3X1 port map( A => state_2_port, B => n394, C => n174, Y => n53);
   U227 : NOR2X1 port map( A => n395, B => state_3_port, Y => n174);
   U229 : OAI21X1 port map( A => n176, B => n128, C => n111, Y => n274);
   U230 : NAND3X1 port map( A => state_2_port, B => state_3_port, C => n178, Y 
                           => n111);
   U231 : NOR2X1 port map( A => state_1_port, B => state_0_port, Y => n178);
   U232 : NAND2X1 port map( A => state_1_port, B => state_3_port, Y => n128);
   U233 : NAND2X1 port map( A => state_0_port, B => n393, Y => n176);
   U235 : NOR2X1 port map( A => n372, B => n180, Y => init_rast);
   U237 : NAND3X1 port map( A => n130, B => state_0_port, C => state_2_port, Y 
                           => n141);
   U239 : NOR2X1 port map( A => n373, B => n46, Y => gpu_done);
   U240 : NAND2X1 port map( A => n130, B => n392, Y => n46);
   U242 : NAND2X1 port map( A => n393, B => n394, Y => n127);
   U245 : NOR2X1 port map( A => state_3_port, B => state_1_port, Y => n130);
   U247 : NAND2X1 port map( A => tem, B => n374, Y => n117);
   U249 : AOI21X1 port map( A => n182, B => n183, C => data_reg_9_port, Y => 
                           n200);
   U250 : AOI21X1 port map( A => n184, B => n182, C => data_reg_8_port, Y => 
                           n202);
   U251 : AOI21X1 port map( A => n185, B => n186, C => data_reg_7_port, Y => 
                           n203);
   U252 : AOI21X1 port map( A => n187, B => n186, C => data_reg_6_port, Y => 
                           n204);
   U253 : AOI21X1 port map( A => n186, B => n183, C => data_reg_5_port, Y => 
                           n205);
   U254 : AOI21X1 port map( A => n186, B => n184, C => data_reg_4_port, Y => 
                           n206);
   U255 : NOR2X1 port map( A => n370, B => rast_index(3), Y => n186);
   U256 : AOI21X1 port map( A => n189, B => n185, C => data_reg_3_port, Y => 
                           n207);
   U257 : AOI21X1 port map( A => n189, B => n187, C => data_reg_2_port, Y => 
                           n208);
   U258 : AOI21X1 port map( A => n189, B => n183, C => data_reg_1_port, Y => 
                           n209);
   U259 : AOI21X1 port map( A => n190, B => n185, C => data_reg_15_port, Y => 
                           n194);
   U260 : AOI21X1 port map( A => n190, B => n187, C => data_reg_14_port, Y => 
                           n195);
   U261 : AOI21X1 port map( A => n190, B => n183, C => data_reg_13_port, Y => 
                           n196);
   U262 : NOR2X1 port map( A => n371, B => rast_index(1), Y => n183);
   U263 : AOI21X1 port map( A => n190, B => n184, C => data_reg_12_port, Y => 
                           n197);
   U264 : NOR2X1 port map( A => n370, B => n369, Y => n190);
   U266 : AOI21X1 port map( A => n185, B => n182, C => data_reg_11_port, Y => 
                           n198);
   U268 : AOI21X1 port map( A => n187, B => n182, C => data_reg_10_port, Y => 
                           n199);
   U269 : NOR2X1 port map( A => n369, B => rast_index(2), Y => n182);
   U274 : NAND3X1 port map( A => n366, B => n423, C => we, Y => n193);
   U276 : AOI21X1 port map( A => n189, B => n184, C => data_reg_0_port, Y => 
                           n210);
   U277 : NOR2X1 port map( A => rast_index(1), B => rast_index(0), Y => n184);
   U278 : NOR2X1 port map( A => rast_index(3), B => rast_index(2), Y => n189);
   n229 <= '1';
   n230 <= '1';
   n231 <= '1';
   n232 <= '1';
   n233 <= '1';
   n234 <= '1';
   n235 <= '1';
   n236 <= '1';
   n237 <= '1';
   n238 <= '1';
   n239 <= '1';
   n240 <= '1';
   n241 <= '1';
   n242 <= '1';
   n243 <= '1';
   n244 <= '1';
   n245 <= '1';
   n246 <= '1';
   n247 <= '1';
   n248 <= '1';
   n249 <= '1';
   n250 <= '1';
   n251 <= '1';
   n252 <= '1';
   n253 <= '1';
   n254 <= '1';
   n255 <= '1';
   n256 <= '1';
   n257 <= '1';
   n258 <= '1';
   n259 <= '1';
   n260 <= '1';
   n261 <= '1';
   n262 <= '1';
   n263 <= '1';
   n264 <= '1';
   n265 <= '1';
   n266 <= '1';
   n267 <= '1';
   n268 <= '1';
   n269 <= '1';
   n270 <= '1';
   n271 <= '1';
   n272 <= '1';
   n273 <= '1';
   U78 : INVX2 port map( A => databus(14), Y => n73);
   U82 : INVX2 port map( A => databus(13), Y => n77);
   U106 : INVX2 port map( A => databus(7), Y => n90);
   U110 : INVX2 port map( A => databus(6), Y => n93);
   U130 : INVX2 port map( A => databus(1), Y => n104);
   U134 : INVX2 port map( A => databus(0), Y => n107);
   U156 : OR2X2 port map( A => n137, B => n138, Y => n120);
   U163 : AND2X2 port map( A => n143, B => n52, Y => n142);
   U189 : AND2X2 port map( A => n161, B => n162, Y => n160);
   U236 : OR2X2 port map( A => n141, B => err, Y => n180);
   U267 : AND2X2 port map( A => rast_index(1), B => rast_index(0), Y => n185);
   U271 : AND2X2 port map( A => rast_index(1), B => n371, Y => n187);
   add_212 : gpu_controller_DW01_inc_1 port map( A(15) => addr_15_port, A(14) 
                           => addr_14_port, A(13) => addr_13_port, A(12) => 
                           addr_12_port, A(11) => addr_11_port, A(10) => 
                           addr_10_port, A(9) => addr_9_port, A(8) => 
                           addr_8_port, A(7) => addr_7_port, A(6) => 
                           addr_6_port, A(5) => addr_5_port, A(4) => 
                           addr_4_port, A(3) => addr_3_port, A(2) => 
                           addr_2_port, A(1) => addr_1_port, A(0) => 
                           addr_0_port, SUM(15) => N312, SUM(14) => N311, 
                           SUM(13) => N310, SUM(12) => N309, SUM(11) => N308, 
                           SUM(10) => N307, SUM(9) => N306, SUM(8) => N305, 
                           SUM(7) => N304, SUM(6) => N303, SUM(5) => N302, 
                           SUM(4) => N301, SUM(3) => N300, SUM(2) => N299, 
                           SUM(1) => N298, SUM(0) => N297);
   add_213_U1_1_1 : HAX1 port map( A => counter_1_port, B => counter_0_port, YC
                           => add_213_carry_2_port, YS => N314);
   add_213_U1_1_2 : HAX1 port map( A => counter_2_port, B => 
                           add_213_carry_2_port, YC => add_213_carry_3_port, YS
                           => N315);
   add_213_U1_1_3 : HAX1 port map( A => counter_3_port, B => 
                           add_213_carry_3_port, YC => add_213_carry_4_port, YS
                           => N316);
   databus_tri_2_inst : TBUFX1 port map( A => n208, EN => n335, Y => databus(2)
                           );
   databus_tri_3_inst : TBUFX1 port map( A => n207, EN => n335, Y => databus(3)
                           );
   databus_tri_15_inst : TBUFX1 port map( A => n194, EN => n335, Y => 
                           databus(15));
   databus_tri_14_inst : TBUFX1 port map( A => n195, EN => n335, Y => 
                           databus(14));
   databus_tri_4_inst : TBUFX1 port map( A => n206, EN => n335, Y => databus(4)
                           );
   databus_tri_12_inst : TBUFX1 port map( A => n197, EN => n335, Y => 
                           databus(12));
   databus_tri_8_inst : TBUFX1 port map( A => n202, EN => n335, Y => databus(8)
                           );
   databus_tri_10_inst : TBUFX1 port map( A => n199, EN => n335, Y => 
                           databus(10));
   databus_tri_11_inst : TBUFX1 port map( A => n198, EN => n335, Y => 
                           databus(11));
   databus_tri_5_inst : TBUFX1 port map( A => n205, EN => n335, Y => databus(5)
                           );
   databus_tri_9_inst : TBUFX1 port map( A => n200, EN => n335, Y => databus(9)
                           );
   databus_tri_0_inst : TBUFX1 port map( A => n210, EN => n335, Y => databus(0)
                           );
   databus_tri_6_inst : TBUFX1 port map( A => n204, EN => n335, Y => databus(6)
                           );
   databus_tri_7_inst : TBUFX1 port map( A => n203, EN => n335, Y => databus(7)
                           );
   databus_tri_1_inst : TBUFX1 port map( A => n209, EN => n335, Y => databus(1)
                           );
   databus_tri_13_inst : TBUFX1 port map( A => n196, EN => n335, Y => 
                           databus(13));
   re_out_tri : TBUFX1 port map( A => n423, EN => n366, Y => re_out);
   we_out_tri : TBUFX1 port map( A => n375, EN => n366, Y => we_out);
   addr_out_tri_1_inst : TBUFX1 port map( A => n409, EN => n366, Y => 
                           addr_out(1));
   addr_out_tri_2_inst : TBUFX1 port map( A => n410, EN => n366, Y => 
                           addr_out(2));
   addr_out_tri_3_inst : TBUFX1 port map( A => n411, EN => n366, Y => 
                           addr_out(3));
   addr_out_tri_4_inst : TBUFX1 port map( A => n412, EN => n366, Y => 
                           addr_out(4));
   addr_out_tri_5_inst : TBUFX1 port map( A => n413, EN => n366, Y => 
                           addr_out(5));
   addr_out_tri_6_inst : TBUFX1 port map( A => n414, EN => n366, Y => 
                           addr_out(6));
   addr_out_tri_7_inst : TBUFX1 port map( A => n415, EN => n366, Y => 
                           addr_out(7));
   addr_out_tri_8_inst : TBUFX1 port map( A => n416, EN => n366, Y => 
                           addr_out(8));
   addr_out_tri_9_inst : TBUFX1 port map( A => n417, EN => n366, Y => 
                           addr_out(9));
   addr_out_tri_10_inst : TBUFX1 port map( A => n418, EN => n366, Y => 
                           addr_out(10));
   addr_out_tri_11_inst : TBUFX1 port map( A => n419, EN => n366, Y => 
                           addr_out(11));
   addr_out_tri_12_inst : TBUFX1 port map( A => n420, EN => n366, Y => 
                           addr_out(12));
   addr_out_tri_13_inst : TBUFX1 port map( A => n421, EN => n366, Y => 
                           addr_out(13));
   addr_out_tri_14_inst : TBUFX1 port map( A => n422, EN => n366, Y => 
                           addr_out(14));
   addr_out_tri_0_inst : TBUFX1 port map( A => n408, EN => n366, Y => 
                           addr_out(0));
   U340 : OR2X2 port map( A => n43, B => n44, Y => n333);
   U341 : INVX2 port map( A => n336, Y => n337);
   U342 : INVX2 port map( A => n74, Y => n336);
   U343 : INVX2 port map( A => n52, Y => n385);
   U344 : INVX2 port map( A => n2, Y => n379);
   U345 : INVX2 port map( A => n334, Y => n338);
   U346 : INVX2 port map( A => n53, Y => n384);
   U347 : INVX2 port map( A => n193, Y => n335);
   U348 : OR2X2 port map( A => n109, B => n110, Y => n334);
   U349 : INVX2 port map( A => ram_in_use, Y => n366);
   U350 : XOR2X1 port map( A => add_213_carry_4_port, B => counter_4_port, Y =>
                           N317);
   U351 : INVX2 port map( A => n54, Y => n339);
   U352 : INVX2 port map( A => n75, Y => n340);
   U353 : INVX2 port map( A => n78, Y => n341);
   U354 : INVX2 port map( A => n80, Y => n342);
   U355 : INVX2 port map( A => n82, Y => n343);
   U356 : INVX2 port map( A => n84, Y => n344);
   U357 : INVX2 port map( A => n86, Y => n345);
   U358 : INVX2 port map( A => n88, Y => n346);
   U359 : INVX2 port map( A => n91, Y => n347);
   U360 : INVX2 port map( A => n94, Y => n348);
   U361 : INVX2 port map( A => n96, Y => n349);
   U362 : INVX2 port map( A => n98, Y => n350);
   U363 : INVX2 port map( A => n100, Y => n351);
   U364 : INVX2 port map( A => n102, Y => n352);
   U365 : INVX2 port map( A => n105, Y => n353);
   U366 : INVX2 port map( A => n108, Y => n354);
   U367 : INVX2 port map( A => n85, Y => n355);
   U368 : INVX2 port map( A => n95, Y => n356);
   U369 : INVX2 port map( A => n99, Y => n357);
   U370 : INVX2 port map( A => n79, Y => n358);
   U371 : INVX2 port map( A => n83, Y => n359);
   U372 : INVX2 port map( A => n81, Y => n360);
   U373 : INVX2 port map( A => n171, Y => n361);
   U374 : INVX2 port map( A => n101, Y => n362);
   U375 : INVX2 port map( A => n97, Y => n363);
   U376 : INVX2 port map( A => n87, Y => n364);
   U377 : INVX2 port map( A => n112, Y => n365);
   U378 : INVX2 port map( A => n149, Y => n367);
   U379 : INVX2 port map( A => rast_strb, Y => n368);
   U380 : INVX2 port map( A => rast_index(3), Y => n369);
   U381 : INVX2 port map( A => rast_index(2), Y => n370);
   U382 : INVX2 port map( A => rast_index(0), Y => n371);
   U383 : INVX2 port map( A => math_done, Y => n372);
   U384 : INVX2 port map( A => n117, Y => n373);
   U385 : INVX2 port map( A => tem2, Y => n374);
   U386 : INVX2 port map( A => we, Y => n375);
   U387 : INVX2 port map( A => n150, Y => n376);
   U388 : INVX2 port map( A => n3, Y => n377);
   U389 : INVX2 port map( A => n1, Y => n378);
   U390 : INVX2 port map( A => n119, Y => n380);
   U391 : INVX2 port map( A => n68, Y => n381);
   U392 : INVX2 port map( A => n172, Y => n382);
   U393 : INVX2 port map( A => n48, Y => n383);
   U394 : INVX2 port map( A => n274, Y => n386);
   U395 : INVX2 port map( A => n141, Y => init_math);
   U396 : INVX2 port map( A => n49, Y => n388);
   U397 : INVX2 port map( A => n69, Y => n389);
   U398 : INVX2 port map( A => counter_4_port, Y => n390);
   U399 : INVX2 port map( A => n176, Y => n391);
   U400 : INVX2 port map( A => n127, Y => n392);
   U401 : INVX2 port map( A => state_2_port, Y => n393);
   U402 : INVX2 port map( A => state_0_port, Y => n394);
   U403 : INVX2 port map( A => state_1_port, Y => n395);
   U404 : INVX2 port map( A => opp_0_port, Y => n396);
   U405 : INVX2 port map( A => opp_1_port, Y => n397);
   U406 : INVX2 port map( A => n165, Y => n398);
   U407 : INVX2 port map( A => opp_6_port, Y => n399);
   U408 : INVX2 port map( A => opp_7_port, Y => n400);
   U409 : INVX2 port map( A => n169, Y => n401);
   U410 : INVX2 port map( A => opp_13_port, Y => n402);
   U411 : INVX2 port map( A => opp_14_port, Y => n403);
   U412 : INVX2 port map( A => counter_3_port, Y => n404);
   U413 : INVX2 port map( A => counter_0_port, Y => n405);
   U414 : INVX2 port map( A => counter_1_port, Y => n406);
   U415 : INVX2 port map( A => counter_2_port, Y => n407);
   U416 : INVX2 port map( A => addr_0_port, Y => n408);
   U417 : INVX2 port map( A => addr_1_port, Y => n409);
   U418 : INVX2 port map( A => addr_2_port, Y => n410);
   U419 : INVX2 port map( A => addr_3_port, Y => n411);
   U420 : INVX2 port map( A => addr_4_port, Y => n412);
   U421 : INVX2 port map( A => addr_5_port, Y => n413);
   U422 : INVX2 port map( A => addr_6_port, Y => n414);
   U423 : INVX2 port map( A => addr_7_port, Y => n415);
   U424 : INVX2 port map( A => addr_8_port, Y => n416);
   U425 : INVX2 port map( A => addr_9_port, Y => n417);
   U426 : INVX2 port map( A => addr_10_port, Y => n418);
   U427 : INVX2 port map( A => addr_11_port, Y => n419);
   U428 : INVX2 port map( A => addr_12_port, Y => n420);
   U429 : INVX2 port map( A => addr_13_port, Y => n421);
   U430 : INVX2 port map( A => addr_14_port, Y => n422);
   U431 : INVX2 port map( A => re, Y => n423);

end SYN_struct;
