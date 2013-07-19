
library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

package CONV_PACK_matrix_math is

-- define attributes
attribute ENUM_ENCODING : STRING;

end CONV_PACK_matrix_math;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_matrix_math.all;

entity matrix_math_DW02_mult_2 is

   port( A, B : in std_logic_vector (15 downto 0);  TC : in std_logic;  PRODUCT
         : out std_logic_vector (31 downto 0));

end matrix_math_DW02_mult_2;

architecture SYN_csa of matrix_math_DW02_mult_2 is

   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component FAX1
      port( A, B, C : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal ab_15_0_port, ab_14_1_port, ab_14_0_port, ab_13_2_port, ab_13_1_port,
      ab_13_0_port, ab_12_3_port, ab_12_2_port, ab_12_1_port, ab_12_0_port, 
      ab_11_4_port, ab_11_3_port, ab_11_2_port, ab_11_1_port, ab_11_0_port, 
      ab_10_5_port, ab_10_4_port, ab_10_3_port, ab_10_2_port, ab_10_1_port, 
      ab_10_0_port, ab_9_6_port, ab_9_5_port, ab_9_4_port, ab_9_3_port, 
      ab_9_2_port, ab_9_1_port, ab_9_0_port, ab_8_7_port, ab_8_6_port, 
      ab_8_5_port, ab_8_4_port, ab_8_3_port, ab_8_2_port, ab_8_1_port, 
      ab_8_0_port, ab_7_8_port, ab_7_7_port, ab_7_6_port, ab_7_5_port, 
      ab_7_4_port, ab_7_3_port, ab_7_2_port, ab_7_1_port, ab_7_0_port, 
      ab_6_9_port, ab_6_8_port, ab_6_7_port, ab_6_6_port, ab_6_5_port, 
      ab_6_4_port, ab_6_3_port, ab_6_2_port, ab_6_1_port, ab_6_0_port, 
      ab_5_10_port, ab_5_9_port, ab_5_8_port, ab_5_7_port, ab_5_6_port, 
      ab_5_5_port, ab_5_4_port, ab_5_3_port, ab_5_2_port, ab_5_1_port, 
      ab_5_0_port, ab_4_11_port, ab_4_10_port, ab_4_9_port, ab_4_8_port, 
      ab_4_7_port, ab_4_6_port, ab_4_5_port, ab_4_4_port, ab_4_3_port, 
      ab_4_2_port, ab_4_1_port, ab_4_0_port, ab_3_12_port, ab_3_11_port, 
      ab_3_10_port, ab_3_9_port, ab_3_8_port, ab_3_7_port, ab_3_6_port, 
      ab_3_5_port, ab_3_4_port, ab_3_3_port, ab_3_2_port, ab_3_1_port, 
      ab_3_0_port, ab_2_13_port, ab_2_12_port, ab_2_11_port, ab_2_10_port, 
      ab_2_9_port, ab_2_8_port, ab_2_7_port, ab_2_6_port, ab_2_5_port, 
      ab_2_4_port, ab_2_3_port, ab_2_2_port, ab_2_1_port, ab_2_0_port, 
      ab_1_14_port, ab_1_13_port, ab_1_12_port, ab_1_11_port, ab_1_10_port, 
      ab_1_9_port, ab_1_8_port, ab_1_7_port, ab_1_6_port, ab_1_5_port, 
      ab_1_4_port, ab_1_3_port, ab_1_2_port, ab_1_1_port, ab_1_0_port, 
      ab_0_15_port, ab_0_14_port, ab_0_13_port, ab_0_12_port, ab_0_11_port, 
      ab_0_10_port, ab_0_9_port, ab_0_8_port, ab_0_7_port, ab_0_6_port, 
      ab_0_5_port, ab_0_4_port, ab_0_3_port, ab_0_2_port, ab_0_1_port, 
      CARRYB_14_0_port, CARRYB_13_1_port, CARRYB_13_0_port, CARRYB_12_2_port, 
      CARRYB_12_1_port, CARRYB_12_0_port, CARRYB_11_3_port, CARRYB_11_2_port, 
      CARRYB_11_1_port, CARRYB_11_0_port, CARRYB_10_4_port, CARRYB_10_3_port, 
      CARRYB_10_2_port, CARRYB_10_1_port, CARRYB_10_0_port, CARRYB_9_5_port, 
      CARRYB_9_4_port, CARRYB_9_3_port, CARRYB_9_2_port, CARRYB_9_1_port, 
      CARRYB_9_0_port, CARRYB_8_6_port, CARRYB_8_5_port, CARRYB_8_4_port, 
      CARRYB_8_3_port, CARRYB_8_2_port, CARRYB_8_1_port, CARRYB_8_0_port, 
      CARRYB_7_7_port, CARRYB_7_6_port, CARRYB_7_5_port, CARRYB_7_4_port, 
      CARRYB_7_3_port, CARRYB_7_2_port, CARRYB_7_1_port, CARRYB_7_0_port, 
      CARRYB_6_8_port, CARRYB_6_7_port, CARRYB_6_6_port, CARRYB_6_5_port, 
      CARRYB_6_4_port, CARRYB_6_3_port, CARRYB_6_2_port, CARRYB_6_1_port, 
      CARRYB_6_0_port, CARRYB_5_9_port, CARRYB_5_8_port, CARRYB_5_7_port, 
      CARRYB_5_6_port, CARRYB_5_5_port, CARRYB_5_4_port, CARRYB_5_3_port, 
      CARRYB_5_2_port, CARRYB_5_1_port, CARRYB_5_0_port, CARRYB_4_10_port, 
      CARRYB_4_9_port, CARRYB_4_8_port, CARRYB_4_7_port, CARRYB_4_6_port, 
      CARRYB_4_5_port, CARRYB_4_4_port, CARRYB_4_3_port, CARRYB_4_2_port, 
      CARRYB_4_1_port, CARRYB_4_0_port, CARRYB_3_11_port, CARRYB_3_10_port, 
      CARRYB_3_9_port, CARRYB_3_8_port, CARRYB_3_7_port, CARRYB_3_6_port, 
      CARRYB_3_5_port, CARRYB_3_4_port, CARRYB_3_3_port, CARRYB_3_2_port, 
      CARRYB_3_1_port, CARRYB_3_0_port, CARRYB_2_12_port, CARRYB_2_11_port, 
      CARRYB_2_10_port, CARRYB_2_9_port, CARRYB_2_8_port, CARRYB_2_7_port, 
      CARRYB_2_6_port, CARRYB_2_5_port, CARRYB_2_4_port, CARRYB_2_3_port, 
      CARRYB_2_2_port, CARRYB_2_1_port, CARRYB_2_0_port, SUMB_15_0_port, 
      SUMB_14_1_port, SUMB_13_2_port, SUMB_13_1_port, SUMB_12_3_port, 
      SUMB_12_2_port, SUMB_12_1_port, SUMB_11_4_port, SUMB_11_3_port, 
      SUMB_11_2_port, SUMB_11_1_port, SUMB_10_5_port, SUMB_10_4_port, 
      SUMB_10_3_port, SUMB_10_2_port, SUMB_10_1_port, SUMB_9_6_port, 
      SUMB_9_5_port, SUMB_9_4_port, SUMB_9_3_port, SUMB_9_2_port, SUMB_9_1_port
      , SUMB_8_7_port, SUMB_8_6_port, SUMB_8_5_port, SUMB_8_4_port, 
      SUMB_8_3_port, SUMB_8_2_port, SUMB_8_1_port, SUMB_7_8_port, SUMB_7_7_port
      , SUMB_7_6_port, SUMB_7_5_port, SUMB_7_4_port, SUMB_7_3_port, 
      SUMB_7_2_port, SUMB_7_1_port, SUMB_6_9_port, SUMB_6_8_port, SUMB_6_7_port
      , SUMB_6_6_port, SUMB_6_5_port, SUMB_6_4_port, SUMB_6_3_port, 
      SUMB_6_2_port, SUMB_6_1_port, SUMB_5_10_port, SUMB_5_9_port, 
      SUMB_5_8_port, SUMB_5_7_port, SUMB_5_6_port, SUMB_5_5_port, SUMB_5_4_port
      , SUMB_5_3_port, SUMB_5_2_port, SUMB_5_1_port, SUMB_4_11_port, 
      SUMB_4_10_port, SUMB_4_9_port, SUMB_4_8_port, SUMB_4_7_port, 
      SUMB_4_6_port, SUMB_4_5_port, SUMB_4_4_port, SUMB_4_3_port, SUMB_4_2_port
      , SUMB_4_1_port, SUMB_3_12_port, SUMB_3_11_port, SUMB_3_10_port, 
      SUMB_3_9_port, SUMB_3_8_port, SUMB_3_7_port, SUMB_3_6_port, SUMB_3_5_port
      , SUMB_3_4_port, SUMB_3_3_port, SUMB_3_2_port, SUMB_3_1_port, 
      SUMB_2_13_port, SUMB_2_12_port, SUMB_2_11_port, SUMB_2_10_port, 
      SUMB_2_9_port, SUMB_2_8_port, SUMB_2_7_port, SUMB_2_6_port, SUMB_2_5_port
      , SUMB_2_4_port, SUMB_2_3_port, SUMB_2_2_port, SUMB_2_1_port, 
      SUMB_1_14_port, SUMB_1_13_port, SUMB_1_12_port, SUMB_1_11_port, 
      SUMB_1_10_port, SUMB_1_9_port, SUMB_1_8_port, SUMB_1_7_port, 
      SUMB_1_6_port, SUMB_1_5_port, SUMB_1_4_port, SUMB_1_3_port, SUMB_1_2_port
      , SUMB_1_1_port, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15
      , n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, 
      n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44
      , n45, n46, n47, n48, n_1017, n_1018, n_1019, n_1020, n_1021, n_1022, 
      n_1023, n_1024, n_1025, n_1026, n_1027, n_1028, n_1029, n_1030, n_1031 : 
      std_logic;

begin
   
   S14_15_0 : FAX1 port map( A => A(15), B => B(15), C => SUMB_15_0_port, YC =>
                           n_1017, YS => PRODUCT(15));
   S4_0 : FAX1 port map( A => ab_15_0_port, B => CARRYB_14_0_port, C => 
                           SUMB_14_1_port, YC => n_1018, YS => SUMB_15_0_port);
   S1_14_0 : FAX1 port map( A => ab_14_0_port, B => CARRYB_13_0_port, C => 
                           SUMB_13_1_port, YC => CARRYB_14_0_port, YS => 
                           PRODUCT(14));
   S2_14_1 : FAX1 port map( A => ab_14_1_port, B => CARRYB_13_1_port, C => 
                           SUMB_13_2_port, YC => n_1019, YS => SUMB_14_1_port);
   S1_13_0 : FAX1 port map( A => ab_13_0_port, B => CARRYB_12_0_port, C => 
                           SUMB_12_1_port, YC => CARRYB_13_0_port, YS => 
                           PRODUCT(13));
   S2_13_1 : FAX1 port map( A => ab_13_1_port, B => CARRYB_12_1_port, C => 
                           SUMB_12_2_port, YC => CARRYB_13_1_port, YS => 
                           SUMB_13_1_port);
   S2_13_2 : FAX1 port map( A => ab_13_2_port, B => CARRYB_12_2_port, C => 
                           SUMB_12_3_port, YC => n_1020, YS => SUMB_13_2_port);
   S1_12_0 : FAX1 port map( A => ab_12_0_port, B => CARRYB_11_0_port, C => 
                           SUMB_11_1_port, YC => CARRYB_12_0_port, YS => 
                           PRODUCT(12));
   S2_12_1 : FAX1 port map( A => ab_12_1_port, B => CARRYB_11_1_port, C => 
                           SUMB_11_2_port, YC => CARRYB_12_1_port, YS => 
                           SUMB_12_1_port);
   S2_12_2 : FAX1 port map( A => ab_12_2_port, B => CARRYB_11_2_port, C => 
                           SUMB_11_3_port, YC => CARRYB_12_2_port, YS => 
                           SUMB_12_2_port);
   S2_12_3 : FAX1 port map( A => ab_12_3_port, B => CARRYB_11_3_port, C => 
                           SUMB_11_4_port, YC => n_1021, YS => SUMB_12_3_port);
   S1_11_0 : FAX1 port map( A => ab_11_0_port, B => CARRYB_10_0_port, C => 
                           SUMB_10_1_port, YC => CARRYB_11_0_port, YS => 
                           PRODUCT(11));
   S2_11_1 : FAX1 port map( A => ab_11_1_port, B => CARRYB_10_1_port, C => 
                           SUMB_10_2_port, YC => CARRYB_11_1_port, YS => 
                           SUMB_11_1_port);
   S2_11_2 : FAX1 port map( A => ab_11_2_port, B => CARRYB_10_2_port, C => 
                           SUMB_10_3_port, YC => CARRYB_11_2_port, YS => 
                           SUMB_11_2_port);
   S2_11_3 : FAX1 port map( A => ab_11_3_port, B => CARRYB_10_3_port, C => 
                           SUMB_10_4_port, YC => CARRYB_11_3_port, YS => 
                           SUMB_11_3_port);
   S2_11_4 : FAX1 port map( A => ab_11_4_port, B => CARRYB_10_4_port, C => 
                           SUMB_10_5_port, YC => n_1022, YS => SUMB_11_4_port);
   S1_10_0 : FAX1 port map( A => ab_10_0_port, B => CARRYB_9_0_port, C => 
                           SUMB_9_1_port, YC => CARRYB_10_0_port, YS => 
                           PRODUCT(10));
   S2_10_1 : FAX1 port map( A => ab_10_1_port, B => CARRYB_9_1_port, C => 
                           SUMB_9_2_port, YC => CARRYB_10_1_port, YS => 
                           SUMB_10_1_port);
   S2_10_2 : FAX1 port map( A => ab_10_2_port, B => CARRYB_9_2_port, C => 
                           SUMB_9_3_port, YC => CARRYB_10_2_port, YS => 
                           SUMB_10_2_port);
   S2_10_3 : FAX1 port map( A => ab_10_3_port, B => CARRYB_9_3_port, C => 
                           SUMB_9_4_port, YC => CARRYB_10_3_port, YS => 
                           SUMB_10_3_port);
   S2_10_4 : FAX1 port map( A => ab_10_4_port, B => CARRYB_9_4_port, C => 
                           SUMB_9_5_port, YC => CARRYB_10_4_port, YS => 
                           SUMB_10_4_port);
   S2_10_5 : FAX1 port map( A => ab_10_5_port, B => CARRYB_9_5_port, C => 
                           SUMB_9_6_port, YC => n_1023, YS => SUMB_10_5_port);
   S1_9_0 : FAX1 port map( A => ab_9_0_port, B => CARRYB_8_0_port, C => 
                           SUMB_8_1_port, YC => CARRYB_9_0_port, YS => 
                           PRODUCT(9));
   S2_9_1 : FAX1 port map( A => ab_9_1_port, B => CARRYB_8_1_port, C => 
                           SUMB_8_2_port, YC => CARRYB_9_1_port, YS => 
                           SUMB_9_1_port);
   S2_9_2 : FAX1 port map( A => ab_9_2_port, B => CARRYB_8_2_port, C => 
                           SUMB_8_3_port, YC => CARRYB_9_2_port, YS => 
                           SUMB_9_2_port);
   S2_9_3 : FAX1 port map( A => ab_9_3_port, B => CARRYB_8_3_port, C => 
                           SUMB_8_4_port, YC => CARRYB_9_3_port, YS => 
                           SUMB_9_3_port);
   S2_9_4 : FAX1 port map( A => ab_9_4_port, B => CARRYB_8_4_port, C => 
                           SUMB_8_5_port, YC => CARRYB_9_4_port, YS => 
                           SUMB_9_4_port);
   S2_9_5 : FAX1 port map( A => ab_9_5_port, B => CARRYB_8_5_port, C => 
                           SUMB_8_6_port, YC => CARRYB_9_5_port, YS => 
                           SUMB_9_5_port);
   S2_9_6 : FAX1 port map( A => ab_9_6_port, B => CARRYB_8_6_port, C => 
                           SUMB_8_7_port, YC => n_1024, YS => SUMB_9_6_port);
   S1_8_0 : FAX1 port map( A => ab_8_0_port, B => CARRYB_7_0_port, C => 
                           SUMB_7_1_port, YC => CARRYB_8_0_port, YS => 
                           PRODUCT(8));
   S2_8_1 : FAX1 port map( A => ab_8_1_port, B => CARRYB_7_1_port, C => 
                           SUMB_7_2_port, YC => CARRYB_8_1_port, YS => 
                           SUMB_8_1_port);
   S2_8_2 : FAX1 port map( A => ab_8_2_port, B => CARRYB_7_2_port, C => 
                           SUMB_7_3_port, YC => CARRYB_8_2_port, YS => 
                           SUMB_8_2_port);
   S2_8_3 : FAX1 port map( A => ab_8_3_port, B => CARRYB_7_3_port, C => 
                           SUMB_7_4_port, YC => CARRYB_8_3_port, YS => 
                           SUMB_8_3_port);
   S2_8_4 : FAX1 port map( A => ab_8_4_port, B => CARRYB_7_4_port, C => 
                           SUMB_7_5_port, YC => CARRYB_8_4_port, YS => 
                           SUMB_8_4_port);
   S2_8_5 : FAX1 port map( A => ab_8_5_port, B => CARRYB_7_5_port, C => 
                           SUMB_7_6_port, YC => CARRYB_8_5_port, YS => 
                           SUMB_8_5_port);
   S2_8_6 : FAX1 port map( A => ab_8_6_port, B => CARRYB_7_6_port, C => 
                           SUMB_7_7_port, YC => CARRYB_8_6_port, YS => 
                           SUMB_8_6_port);
   S2_8_7 : FAX1 port map( A => ab_8_7_port, B => CARRYB_7_7_port, C => 
                           SUMB_7_8_port, YC => n_1025, YS => SUMB_8_7_port);
   S1_7_0 : FAX1 port map( A => ab_7_0_port, B => CARRYB_6_0_port, C => 
                           SUMB_6_1_port, YC => CARRYB_7_0_port, YS => 
                           PRODUCT(7));
   S2_7_1 : FAX1 port map( A => ab_7_1_port, B => CARRYB_6_1_port, C => 
                           SUMB_6_2_port, YC => CARRYB_7_1_port, YS => 
                           SUMB_7_1_port);
   S2_7_2 : FAX1 port map( A => ab_7_2_port, B => CARRYB_6_2_port, C => 
                           SUMB_6_3_port, YC => CARRYB_7_2_port, YS => 
                           SUMB_7_2_port);
   S2_7_3 : FAX1 port map( A => ab_7_3_port, B => CARRYB_6_3_port, C => 
                           SUMB_6_4_port, YC => CARRYB_7_3_port, YS => 
                           SUMB_7_3_port);
   S2_7_4 : FAX1 port map( A => ab_7_4_port, B => CARRYB_6_4_port, C => 
                           SUMB_6_5_port, YC => CARRYB_7_4_port, YS => 
                           SUMB_7_4_port);
   S2_7_5 : FAX1 port map( A => ab_7_5_port, B => CARRYB_6_5_port, C => 
                           SUMB_6_6_port, YC => CARRYB_7_5_port, YS => 
                           SUMB_7_5_port);
   S2_7_6 : FAX1 port map( A => ab_7_6_port, B => CARRYB_6_6_port, C => 
                           SUMB_6_7_port, YC => CARRYB_7_6_port, YS => 
                           SUMB_7_6_port);
   S2_7_7 : FAX1 port map( A => ab_7_7_port, B => CARRYB_6_7_port, C => 
                           SUMB_6_8_port, YC => CARRYB_7_7_port, YS => 
                           SUMB_7_7_port);
   S2_7_8 : FAX1 port map( A => ab_7_8_port, B => CARRYB_6_8_port, C => 
                           SUMB_6_9_port, YC => n_1026, YS => SUMB_7_8_port);
   S1_6_0 : FAX1 port map( A => ab_6_0_port, B => CARRYB_5_0_port, C => 
                           SUMB_5_1_port, YC => CARRYB_6_0_port, YS => 
                           PRODUCT(6));
   S2_6_1 : FAX1 port map( A => ab_6_1_port, B => CARRYB_5_1_port, C => 
                           SUMB_5_2_port, YC => CARRYB_6_1_port, YS => 
                           SUMB_6_1_port);
   S2_6_2 : FAX1 port map( A => ab_6_2_port, B => CARRYB_5_2_port, C => 
                           SUMB_5_3_port, YC => CARRYB_6_2_port, YS => 
                           SUMB_6_2_port);
   S2_6_3 : FAX1 port map( A => ab_6_3_port, B => CARRYB_5_3_port, C => 
                           SUMB_5_4_port, YC => CARRYB_6_3_port, YS => 
                           SUMB_6_3_port);
   S2_6_4 : FAX1 port map( A => ab_6_4_port, B => CARRYB_5_4_port, C => 
                           SUMB_5_5_port, YC => CARRYB_6_4_port, YS => 
                           SUMB_6_4_port);
   S2_6_5 : FAX1 port map( A => ab_6_5_port, B => CARRYB_5_5_port, C => 
                           SUMB_5_6_port, YC => CARRYB_6_5_port, YS => 
                           SUMB_6_5_port);
   S2_6_6 : FAX1 port map( A => ab_6_6_port, B => CARRYB_5_6_port, C => 
                           SUMB_5_7_port, YC => CARRYB_6_6_port, YS => 
                           SUMB_6_6_port);
   S2_6_7 : FAX1 port map( A => ab_6_7_port, B => CARRYB_5_7_port, C => 
                           SUMB_5_8_port, YC => CARRYB_6_7_port, YS => 
                           SUMB_6_7_port);
   S2_6_8 : FAX1 port map( A => ab_6_8_port, B => CARRYB_5_8_port, C => 
                           SUMB_5_9_port, YC => CARRYB_6_8_port, YS => 
                           SUMB_6_8_port);
   S2_6_9 : FAX1 port map( A => ab_6_9_port, B => CARRYB_5_9_port, C => 
                           SUMB_5_10_port, YC => n_1027, YS => SUMB_6_9_port);
   S1_5_0 : FAX1 port map( A => ab_5_0_port, B => CARRYB_4_0_port, C => 
                           SUMB_4_1_port, YC => CARRYB_5_0_port, YS => 
                           PRODUCT(5));
   S2_5_1 : FAX1 port map( A => ab_5_1_port, B => CARRYB_4_1_port, C => 
                           SUMB_4_2_port, YC => CARRYB_5_1_port, YS => 
                           SUMB_5_1_port);
   S2_5_2 : FAX1 port map( A => ab_5_2_port, B => CARRYB_4_2_port, C => 
                           SUMB_4_3_port, YC => CARRYB_5_2_port, YS => 
                           SUMB_5_2_port);
   S2_5_3 : FAX1 port map( A => ab_5_3_port, B => CARRYB_4_3_port, C => 
                           SUMB_4_4_port, YC => CARRYB_5_3_port, YS => 
                           SUMB_5_3_port);
   S2_5_4 : FAX1 port map( A => ab_5_4_port, B => CARRYB_4_4_port, C => 
                           SUMB_4_5_port, YC => CARRYB_5_4_port, YS => 
                           SUMB_5_4_port);
   S2_5_5 : FAX1 port map( A => ab_5_5_port, B => CARRYB_4_5_port, C => 
                           SUMB_4_6_port, YC => CARRYB_5_5_port, YS => 
                           SUMB_5_5_port);
   S2_5_6 : FAX1 port map( A => ab_5_6_port, B => CARRYB_4_6_port, C => 
                           SUMB_4_7_port, YC => CARRYB_5_6_port, YS => 
                           SUMB_5_6_port);
   S2_5_7 : FAX1 port map( A => ab_5_7_port, B => CARRYB_4_7_port, C => 
                           SUMB_4_8_port, YC => CARRYB_5_7_port, YS => 
                           SUMB_5_7_port);
   S2_5_8 : FAX1 port map( A => ab_5_8_port, B => CARRYB_4_8_port, C => 
                           SUMB_4_9_port, YC => CARRYB_5_8_port, YS => 
                           SUMB_5_8_port);
   S2_5_9 : FAX1 port map( A => ab_5_9_port, B => CARRYB_4_9_port, C => 
                           SUMB_4_10_port, YC => CARRYB_5_9_port, YS => 
                           SUMB_5_9_port);
   S2_5_10 : FAX1 port map( A => ab_5_10_port, B => CARRYB_4_10_port, C => 
                           SUMB_4_11_port, YC => n_1028, YS => SUMB_5_10_port);
   S1_4_0 : FAX1 port map( A => ab_4_0_port, B => CARRYB_3_0_port, C => 
                           SUMB_3_1_port, YC => CARRYB_4_0_port, YS => 
                           PRODUCT(4));
   S2_4_1 : FAX1 port map( A => ab_4_1_port, B => CARRYB_3_1_port, C => 
                           SUMB_3_2_port, YC => CARRYB_4_1_port, YS => 
                           SUMB_4_1_port);
   S2_4_2 : FAX1 port map( A => ab_4_2_port, B => CARRYB_3_2_port, C => 
                           SUMB_3_3_port, YC => CARRYB_4_2_port, YS => 
                           SUMB_4_2_port);
   S2_4_3 : FAX1 port map( A => ab_4_3_port, B => CARRYB_3_3_port, C => 
                           SUMB_3_4_port, YC => CARRYB_4_3_port, YS => 
                           SUMB_4_3_port);
   S2_4_4 : FAX1 port map( A => ab_4_4_port, B => CARRYB_3_4_port, C => 
                           SUMB_3_5_port, YC => CARRYB_4_4_port, YS => 
                           SUMB_4_4_port);
   S2_4_5 : FAX1 port map( A => ab_4_5_port, B => CARRYB_3_5_port, C => 
                           SUMB_3_6_port, YC => CARRYB_4_5_port, YS => 
                           SUMB_4_5_port);
   S2_4_6 : FAX1 port map( A => ab_4_6_port, B => CARRYB_3_6_port, C => 
                           SUMB_3_7_port, YC => CARRYB_4_6_port, YS => 
                           SUMB_4_6_port);
   S2_4_7 : FAX1 port map( A => ab_4_7_port, B => CARRYB_3_7_port, C => 
                           SUMB_3_8_port, YC => CARRYB_4_7_port, YS => 
                           SUMB_4_7_port);
   S2_4_8 : FAX1 port map( A => ab_4_8_port, B => CARRYB_3_8_port, C => 
                           SUMB_3_9_port, YC => CARRYB_4_8_port, YS => 
                           SUMB_4_8_port);
   S2_4_9 : FAX1 port map( A => ab_4_9_port, B => CARRYB_3_9_port, C => 
                           SUMB_3_10_port, YC => CARRYB_4_9_port, YS => 
                           SUMB_4_9_port);
   S2_4_10 : FAX1 port map( A => ab_4_10_port, B => CARRYB_3_10_port, C => 
                           SUMB_3_11_port, YC => CARRYB_4_10_port, YS => 
                           SUMB_4_10_port);
   S2_4_11 : FAX1 port map( A => ab_4_11_port, B => CARRYB_3_11_port, C => 
                           SUMB_3_12_port, YC => n_1029, YS => SUMB_4_11_port);
   S1_3_0 : FAX1 port map( A => ab_3_0_port, B => CARRYB_2_0_port, C => 
                           SUMB_2_1_port, YC => CARRYB_3_0_port, YS => 
                           PRODUCT(3));
   S2_3_1 : FAX1 port map( A => ab_3_1_port, B => CARRYB_2_1_port, C => 
                           SUMB_2_2_port, YC => CARRYB_3_1_port, YS => 
                           SUMB_3_1_port);
   S2_3_2 : FAX1 port map( A => ab_3_2_port, B => CARRYB_2_2_port, C => 
                           SUMB_2_3_port, YC => CARRYB_3_2_port, YS => 
                           SUMB_3_2_port);
   S2_3_3 : FAX1 port map( A => ab_3_3_port, B => CARRYB_2_3_port, C => 
                           SUMB_2_4_port, YC => CARRYB_3_3_port, YS => 
                           SUMB_3_3_port);
   S2_3_4 : FAX1 port map( A => ab_3_4_port, B => CARRYB_2_4_port, C => 
                           SUMB_2_5_port, YC => CARRYB_3_4_port, YS => 
                           SUMB_3_4_port);
   S2_3_5 : FAX1 port map( A => ab_3_5_port, B => CARRYB_2_5_port, C => 
                           SUMB_2_6_port, YC => CARRYB_3_5_port, YS => 
                           SUMB_3_5_port);
   S2_3_6 : FAX1 port map( A => ab_3_6_port, B => CARRYB_2_6_port, C => 
                           SUMB_2_7_port, YC => CARRYB_3_6_port, YS => 
                           SUMB_3_6_port);
   S2_3_7 : FAX1 port map( A => ab_3_7_port, B => CARRYB_2_7_port, C => 
                           SUMB_2_8_port, YC => CARRYB_3_7_port, YS => 
                           SUMB_3_7_port);
   S2_3_8 : FAX1 port map( A => ab_3_8_port, B => CARRYB_2_8_port, C => 
                           SUMB_2_9_port, YC => CARRYB_3_8_port, YS => 
                           SUMB_3_8_port);
   S2_3_9 : FAX1 port map( A => ab_3_9_port, B => CARRYB_2_9_port, C => 
                           SUMB_2_10_port, YC => CARRYB_3_9_port, YS => 
                           SUMB_3_9_port);
   S2_3_10 : FAX1 port map( A => ab_3_10_port, B => CARRYB_2_10_port, C => 
                           SUMB_2_11_port, YC => CARRYB_3_10_port, YS => 
                           SUMB_3_10_port);
   S2_3_11 : FAX1 port map( A => ab_3_11_port, B => CARRYB_2_11_port, C => 
                           SUMB_2_12_port, YC => CARRYB_3_11_port, YS => 
                           SUMB_3_11_port);
   S2_3_12 : FAX1 port map( A => ab_3_12_port, B => CARRYB_2_12_port, C => 
                           SUMB_2_13_port, YC => n_1030, YS => SUMB_3_12_port);
   S1_2_0 : FAX1 port map( A => ab_2_0_port, B => n3, C => SUMB_1_1_port, YC =>
                           CARRYB_2_0_port, YS => PRODUCT(2));
   S2_2_1 : FAX1 port map( A => ab_2_1_port, B => n4, C => SUMB_1_2_port, YC =>
                           CARRYB_2_1_port, YS => SUMB_2_1_port);
   S2_2_2 : FAX1 port map( A => ab_2_2_port, B => n5, C => SUMB_1_3_port, YC =>
                           CARRYB_2_2_port, YS => SUMB_2_2_port);
   S2_2_3 : FAX1 port map( A => ab_2_3_port, B => n6, C => SUMB_1_4_port, YC =>
                           CARRYB_2_3_port, YS => SUMB_2_3_port);
   S2_2_4 : FAX1 port map( A => ab_2_4_port, B => n7, C => SUMB_1_5_port, YC =>
                           CARRYB_2_4_port, YS => SUMB_2_4_port);
   S2_2_5 : FAX1 port map( A => ab_2_5_port, B => n8, C => SUMB_1_6_port, YC =>
                           CARRYB_2_5_port, YS => SUMB_2_5_port);
   S2_2_6 : FAX1 port map( A => ab_2_6_port, B => n9, C => SUMB_1_7_port, YC =>
                           CARRYB_2_6_port, YS => SUMB_2_6_port);
   S2_2_7 : FAX1 port map( A => ab_2_7_port, B => n10, C => SUMB_1_8_port, YC 
                           => CARRYB_2_7_port, YS => SUMB_2_7_port);
   S2_2_8 : FAX1 port map( A => ab_2_8_port, B => n11, C => SUMB_1_9_port, YC 
                           => CARRYB_2_8_port, YS => SUMB_2_8_port);
   S2_2_9 : FAX1 port map( A => ab_2_9_port, B => n16, C => SUMB_1_10_port, YC 
                           => CARRYB_2_9_port, YS => SUMB_2_9_port);
   S2_2_10 : FAX1 port map( A => ab_2_10_port, B => n15, C => SUMB_1_11_port, 
                           YC => CARRYB_2_10_port, YS => SUMB_2_10_port);
   S2_2_11 : FAX1 port map( A => ab_2_11_port, B => n14, C => SUMB_1_12_port, 
                           YC => CARRYB_2_11_port, YS => SUMB_2_11_port);
   S2_2_12 : FAX1 port map( A => ab_2_12_port, B => n13, C => SUMB_1_13_port, 
                           YC => CARRYB_2_12_port, YS => SUMB_2_12_port);
   S2_2_13 : FAX1 port map( A => ab_2_13_port, B => n12, C => SUMB_1_14_port, 
                           YC => n_1031, YS => SUMB_2_13_port);
   U2 : AND2X2 port map( A => ab_0_1_port, B => ab_1_0_port, Y => n3);
   U3 : AND2X2 port map( A => ab_0_2_port, B => ab_1_1_port, Y => n4);
   U4 : AND2X2 port map( A => ab_0_3_port, B => ab_1_2_port, Y => n5);
   U5 : AND2X2 port map( A => ab_0_4_port, B => ab_1_3_port, Y => n6);
   U6 : AND2X2 port map( A => ab_0_5_port, B => ab_1_4_port, Y => n7);
   U7 : AND2X2 port map( A => ab_0_6_port, B => ab_1_5_port, Y => n8);
   U8 : AND2X2 port map( A => ab_0_7_port, B => ab_1_6_port, Y => n9);
   U9 : AND2X2 port map( A => ab_0_8_port, B => ab_1_7_port, Y => n10);
   U10 : AND2X2 port map( A => ab_0_9_port, B => ab_1_8_port, Y => n11);
   U11 : AND2X2 port map( A => ab_0_14_port, B => ab_1_13_port, Y => n12);
   U12 : AND2X2 port map( A => ab_0_13_port, B => ab_1_12_port, Y => n13);
   U13 : AND2X2 port map( A => ab_0_12_port, B => ab_1_11_port, Y => n14);
   U14 : AND2X2 port map( A => ab_0_11_port, B => ab_1_10_port, Y => n15);
   U15 : AND2X2 port map( A => ab_0_10_port, B => ab_1_9_port, Y => n16);
   U16 : INVX2 port map( A => A(0), Y => n48);
   U17 : INVX2 port map( A => A(1), Y => n47);
   U18 : INVX2 port map( A => B(0), Y => n32);
   U19 : INVX2 port map( A => B(1), Y => n31);
   U20 : INVX2 port map( A => A(2), Y => n46);
   U21 : INVX2 port map( A => B(2), Y => n30);
   U22 : INVX2 port map( A => A(3), Y => n45);
   U23 : INVX2 port map( A => B(3), Y => n29);
   U24 : INVX2 port map( A => A(4), Y => n44);
   U25 : INVX2 port map( A => B(4), Y => n28);
   U26 : INVX2 port map( A => A(5), Y => n43);
   U27 : INVX2 port map( A => B(5), Y => n27);
   U28 : INVX2 port map( A => A(6), Y => n42);
   U29 : INVX2 port map( A => B(6), Y => n26);
   U30 : INVX2 port map( A => A(7), Y => n41);
   U31 : INVX2 port map( A => B(7), Y => n25);
   U32 : XOR2X1 port map( A => ab_1_0_port, B => ab_0_1_port, Y => PRODUCT(1));
   U33 : XOR2X1 port map( A => ab_1_1_port, B => ab_0_2_port, Y => 
                           SUMB_1_1_port);
   U34 : XOR2X1 port map( A => ab_1_2_port, B => ab_0_3_port, Y => 
                           SUMB_1_2_port);
   U35 : XOR2X1 port map( A => ab_1_3_port, B => ab_0_4_port, Y => 
                           SUMB_1_3_port);
   U36 : XOR2X1 port map( A => ab_1_4_port, B => ab_0_5_port, Y => 
                           SUMB_1_4_port);
   U37 : XOR2X1 port map( A => ab_1_5_port, B => ab_0_6_port, Y => 
                           SUMB_1_5_port);
   U38 : XOR2X1 port map( A => ab_1_6_port, B => ab_0_7_port, Y => 
                           SUMB_1_6_port);
   U39 : XOR2X1 port map( A => ab_1_7_port, B => ab_0_8_port, Y => 
                           SUMB_1_7_port);
   U40 : XOR2X1 port map( A => ab_1_8_port, B => ab_0_9_port, Y => 
                           SUMB_1_8_port);
   U41 : XOR2X1 port map( A => ab_1_9_port, B => ab_0_10_port, Y => 
                           SUMB_1_9_port);
   U42 : XOR2X1 port map( A => ab_1_10_port, B => ab_0_11_port, Y => 
                           SUMB_1_10_port);
   U43 : XOR2X1 port map( A => ab_1_11_port, B => ab_0_12_port, Y => 
                           SUMB_1_11_port);
   U44 : XOR2X1 port map( A => ab_1_12_port, B => ab_0_13_port, Y => 
                           SUMB_1_12_port);
   U45 : XOR2X1 port map( A => ab_1_13_port, B => ab_0_14_port, Y => 
                           SUMB_1_13_port);
   U46 : XOR2X1 port map( A => ab_1_14_port, B => ab_0_15_port, Y => 
                           SUMB_1_14_port);
   U47 : INVX2 port map( A => B(15), Y => n17);
   U48 : INVX2 port map( A => B(14), Y => n18);
   U49 : INVX2 port map( A => B(13), Y => n19);
   U50 : INVX2 port map( A => B(12), Y => n20);
   U51 : INVX2 port map( A => B(11), Y => n21);
   U52 : INVX2 port map( A => B(10), Y => n22);
   U53 : INVX2 port map( A => B(9), Y => n23);
   U54 : INVX2 port map( A => B(8), Y => n24);
   U55 : INVX2 port map( A => A(15), Y => n33);
   U56 : INVX2 port map( A => A(14), Y => n34);
   U57 : INVX2 port map( A => A(13), Y => n35);
   U58 : INVX2 port map( A => A(12), Y => n36);
   U59 : INVX2 port map( A => A(11), Y => n37);
   U60 : INVX2 port map( A => A(10), Y => n38);
   U61 : INVX2 port map( A => A(9), Y => n39);
   U62 : INVX2 port map( A => A(8), Y => n40);
   U63 : NOR2X1 port map( A => n39, B => n26, Y => ab_9_6_port);
   U64 : NOR2X1 port map( A => n39, B => n27, Y => ab_9_5_port);
   U65 : NOR2X1 port map( A => n39, B => n28, Y => ab_9_4_port);
   U66 : NOR2X1 port map( A => n39, B => n29, Y => ab_9_3_port);
   U67 : NOR2X1 port map( A => n39, B => n30, Y => ab_9_2_port);
   U68 : NOR2X1 port map( A => n39, B => n31, Y => ab_9_1_port);
   U69 : NOR2X1 port map( A => n39, B => n32, Y => ab_9_0_port);
   U70 : NOR2X1 port map( A => n25, B => n40, Y => ab_8_7_port);
   U71 : NOR2X1 port map( A => n26, B => n40, Y => ab_8_6_port);
   U72 : NOR2X1 port map( A => n27, B => n40, Y => ab_8_5_port);
   U73 : NOR2X1 port map( A => n28, B => n40, Y => ab_8_4_port);
   U74 : NOR2X1 port map( A => n29, B => n40, Y => ab_8_3_port);
   U75 : NOR2X1 port map( A => n30, B => n40, Y => ab_8_2_port);
   U76 : NOR2X1 port map( A => n31, B => n40, Y => ab_8_1_port);
   U77 : NOR2X1 port map( A => n32, B => n40, Y => ab_8_0_port);
   U78 : NOR2X1 port map( A => n24, B => n41, Y => ab_7_8_port);
   U79 : NOR2X1 port map( A => n25, B => n41, Y => ab_7_7_port);
   U80 : NOR2X1 port map( A => n26, B => n41, Y => ab_7_6_port);
   U81 : NOR2X1 port map( A => n27, B => n41, Y => ab_7_5_port);
   U82 : NOR2X1 port map( A => n28, B => n41, Y => ab_7_4_port);
   U83 : NOR2X1 port map( A => n29, B => n41, Y => ab_7_3_port);
   U84 : NOR2X1 port map( A => n30, B => n41, Y => ab_7_2_port);
   U85 : NOR2X1 port map( A => n31, B => n41, Y => ab_7_1_port);
   U86 : NOR2X1 port map( A => n32, B => n41, Y => ab_7_0_port);
   U87 : NOR2X1 port map( A => n23, B => n42, Y => ab_6_9_port);
   U88 : NOR2X1 port map( A => n24, B => n42, Y => ab_6_8_port);
   U89 : NOR2X1 port map( A => n25, B => n42, Y => ab_6_7_port);
   U90 : NOR2X1 port map( A => n26, B => n42, Y => ab_6_6_port);
   U91 : NOR2X1 port map( A => n27, B => n42, Y => ab_6_5_port);
   U92 : NOR2X1 port map( A => n28, B => n42, Y => ab_6_4_port);
   U93 : NOR2X1 port map( A => n29, B => n42, Y => ab_6_3_port);
   U94 : NOR2X1 port map( A => n30, B => n42, Y => ab_6_2_port);
   U95 : NOR2X1 port map( A => n31, B => n42, Y => ab_6_1_port);
   U96 : NOR2X1 port map( A => n32, B => n42, Y => ab_6_0_port);
   U97 : NOR2X1 port map( A => n23, B => n43, Y => ab_5_9_port);
   U98 : NOR2X1 port map( A => n24, B => n43, Y => ab_5_8_port);
   U99 : NOR2X1 port map( A => n25, B => n43, Y => ab_5_7_port);
   U100 : NOR2X1 port map( A => n26, B => n43, Y => ab_5_6_port);
   U101 : NOR2X1 port map( A => n27, B => n43, Y => ab_5_5_port);
   U102 : NOR2X1 port map( A => n28, B => n43, Y => ab_5_4_port);
   U103 : NOR2X1 port map( A => n29, B => n43, Y => ab_5_3_port);
   U104 : NOR2X1 port map( A => n30, B => n43, Y => ab_5_2_port);
   U105 : NOR2X1 port map( A => n31, B => n43, Y => ab_5_1_port);
   U106 : NOR2X1 port map( A => n22, B => n43, Y => ab_5_10_port);
   U107 : NOR2X1 port map( A => n32, B => n43, Y => ab_5_0_port);
   U108 : NOR2X1 port map( A => n23, B => n44, Y => ab_4_9_port);
   U109 : NOR2X1 port map( A => n24, B => n44, Y => ab_4_8_port);
   U110 : NOR2X1 port map( A => n25, B => n44, Y => ab_4_7_port);
   U111 : NOR2X1 port map( A => n26, B => n44, Y => ab_4_6_port);
   U112 : NOR2X1 port map( A => n27, B => n44, Y => ab_4_5_port);
   U113 : NOR2X1 port map( A => n28, B => n44, Y => ab_4_4_port);
   U114 : NOR2X1 port map( A => n29, B => n44, Y => ab_4_3_port);
   U115 : NOR2X1 port map( A => n30, B => n44, Y => ab_4_2_port);
   U116 : NOR2X1 port map( A => n31, B => n44, Y => ab_4_1_port);
   U117 : NOR2X1 port map( A => n21, B => n44, Y => ab_4_11_port);
   U118 : NOR2X1 port map( A => n22, B => n44, Y => ab_4_10_port);
   U119 : NOR2X1 port map( A => n32, B => n44, Y => ab_4_0_port);
   U120 : NOR2X1 port map( A => n23, B => n45, Y => ab_3_9_port);
   U121 : NOR2X1 port map( A => n24, B => n45, Y => ab_3_8_port);
   U122 : NOR2X1 port map( A => n25, B => n45, Y => ab_3_7_port);
   U123 : NOR2X1 port map( A => n26, B => n45, Y => ab_3_6_port);
   U124 : NOR2X1 port map( A => n27, B => n45, Y => ab_3_5_port);
   U125 : NOR2X1 port map( A => n28, B => n45, Y => ab_3_4_port);
   U126 : NOR2X1 port map( A => n29, B => n45, Y => ab_3_3_port);
   U127 : NOR2X1 port map( A => n30, B => n45, Y => ab_3_2_port);
   U128 : NOR2X1 port map( A => n31, B => n45, Y => ab_3_1_port);
   U129 : NOR2X1 port map( A => n20, B => n45, Y => ab_3_12_port);
   U130 : NOR2X1 port map( A => n21, B => n45, Y => ab_3_11_port);
   U131 : NOR2X1 port map( A => n22, B => n45, Y => ab_3_10_port);
   U132 : NOR2X1 port map( A => n32, B => n45, Y => ab_3_0_port);
   U133 : NOR2X1 port map( A => n23, B => n46, Y => ab_2_9_port);
   U134 : NOR2X1 port map( A => n24, B => n46, Y => ab_2_8_port);
   U135 : NOR2X1 port map( A => n25, B => n46, Y => ab_2_7_port);
   U136 : NOR2X1 port map( A => n26, B => n46, Y => ab_2_6_port);
   U137 : NOR2X1 port map( A => n27, B => n46, Y => ab_2_5_port);
   U138 : NOR2X1 port map( A => n28, B => n46, Y => ab_2_4_port);
   U139 : NOR2X1 port map( A => n29, B => n46, Y => ab_2_3_port);
   U140 : NOR2X1 port map( A => n30, B => n46, Y => ab_2_2_port);
   U141 : NOR2X1 port map( A => n31, B => n46, Y => ab_2_1_port);
   U142 : NOR2X1 port map( A => n19, B => n46, Y => ab_2_13_port);
   U143 : NOR2X1 port map( A => n20, B => n46, Y => ab_2_12_port);
   U144 : NOR2X1 port map( A => n21, B => n46, Y => ab_2_11_port);
   U145 : NOR2X1 port map( A => n22, B => n46, Y => ab_2_10_port);
   U146 : NOR2X1 port map( A => n32, B => n46, Y => ab_2_0_port);
   U147 : NOR2X1 port map( A => n23, B => n47, Y => ab_1_9_port);
   U148 : NOR2X1 port map( A => n24, B => n47, Y => ab_1_8_port);
   U149 : NOR2X1 port map( A => n25, B => n47, Y => ab_1_7_port);
   U150 : NOR2X1 port map( A => n26, B => n47, Y => ab_1_6_port);
   U151 : NOR2X1 port map( A => n27, B => n47, Y => ab_1_5_port);
   U152 : NOR2X1 port map( A => n28, B => n47, Y => ab_1_4_port);
   U153 : NOR2X1 port map( A => n29, B => n47, Y => ab_1_3_port);
   U154 : NOR2X1 port map( A => n30, B => n47, Y => ab_1_2_port);
   U155 : NOR2X1 port map( A => n31, B => n47, Y => ab_1_1_port);
   U156 : NOR2X1 port map( A => n18, B => n47, Y => ab_1_14_port);
   U157 : NOR2X1 port map( A => n19, B => n47, Y => ab_1_13_port);
   U158 : NOR2X1 port map( A => n20, B => n47, Y => ab_1_12_port);
   U159 : NOR2X1 port map( A => n21, B => n47, Y => ab_1_11_port);
   U160 : NOR2X1 port map( A => n22, B => n47, Y => ab_1_10_port);
   U161 : NOR2X1 port map( A => n32, B => n47, Y => ab_1_0_port);
   U162 : NOR2X1 port map( A => B(0), B => n33, Y => ab_15_0_port);
   U163 : NOR2X1 port map( A => n31, B => n34, Y => ab_14_1_port);
   U164 : NOR2X1 port map( A => n32, B => n34, Y => ab_14_0_port);
   U165 : NOR2X1 port map( A => n30, B => n35, Y => ab_13_2_port);
   U166 : NOR2X1 port map( A => n31, B => n35, Y => ab_13_1_port);
   U167 : NOR2X1 port map( A => n32, B => n35, Y => ab_13_0_port);
   U168 : NOR2X1 port map( A => n29, B => n36, Y => ab_12_3_port);
   U169 : NOR2X1 port map( A => n30, B => n36, Y => ab_12_2_port);
   U170 : NOR2X1 port map( A => n31, B => n36, Y => ab_12_1_port);
   U171 : NOR2X1 port map( A => n32, B => n36, Y => ab_12_0_port);
   U172 : NOR2X1 port map( A => n28, B => n37, Y => ab_11_4_port);
   U173 : NOR2X1 port map( A => n29, B => n37, Y => ab_11_3_port);
   U174 : NOR2X1 port map( A => n30, B => n37, Y => ab_11_2_port);
   U175 : NOR2X1 port map( A => n31, B => n37, Y => ab_11_1_port);
   U176 : NOR2X1 port map( A => n32, B => n37, Y => ab_11_0_port);
   U177 : NOR2X1 port map( A => n27, B => n38, Y => ab_10_5_port);
   U178 : NOR2X1 port map( A => n28, B => n38, Y => ab_10_4_port);
   U179 : NOR2X1 port map( A => n29, B => n38, Y => ab_10_3_port);
   U180 : NOR2X1 port map( A => n30, B => n38, Y => ab_10_2_port);
   U181 : NOR2X1 port map( A => n31, B => n38, Y => ab_10_1_port);
   U182 : NOR2X1 port map( A => n32, B => n38, Y => ab_10_0_port);
   U183 : NOR2X1 port map( A => n23, B => n48, Y => ab_0_9_port);
   U184 : NOR2X1 port map( A => n24, B => n48, Y => ab_0_8_port);
   U185 : NOR2X1 port map( A => n25, B => n48, Y => ab_0_7_port);
   U186 : NOR2X1 port map( A => n26, B => n48, Y => ab_0_6_port);
   U187 : NOR2X1 port map( A => n27, B => n48, Y => ab_0_5_port);
   U188 : NOR2X1 port map( A => n28, B => n48, Y => ab_0_4_port);
   U189 : NOR2X1 port map( A => n29, B => n48, Y => ab_0_3_port);
   U190 : NOR2X1 port map( A => n30, B => n48, Y => ab_0_2_port);
   U191 : NOR2X1 port map( A => n31, B => n48, Y => ab_0_1_port);
   U192 : NOR2X1 port map( A => A(0), B => n17, Y => ab_0_15_port);
   U193 : NOR2X1 port map( A => n18, B => n48, Y => ab_0_14_port);
   U194 : NOR2X1 port map( A => n19, B => n48, Y => ab_0_13_port);
   U195 : NOR2X1 port map( A => n20, B => n48, Y => ab_0_12_port);
   U196 : NOR2X1 port map( A => n21, B => n48, Y => ab_0_11_port);
   U197 : NOR2X1 port map( A => n22, B => n48, Y => ab_0_10_port);
   U198 : NOR2X1 port map( A => n32, B => n48, Y => PRODUCT(0));

end SYN_csa;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_matrix_math.all;

entity matrix_math_DW02_mult_1 is

   port( A, B : in std_logic_vector (15 downto 0);  TC : in std_logic;  PRODUCT
         : out std_logic_vector (31 downto 0));

end matrix_math_DW02_mult_1;

architecture SYN_csa of matrix_math_DW02_mult_1 is

   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component FAX1
      port( A, B, C : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal ab_15_0_port, ab_14_1_port, ab_14_0_port, ab_13_2_port, ab_13_1_port,
      ab_13_0_port, ab_12_3_port, ab_12_2_port, ab_12_1_port, ab_12_0_port, 
      ab_11_4_port, ab_11_3_port, ab_11_2_port, ab_11_1_port, ab_11_0_port, 
      ab_10_5_port, ab_10_4_port, ab_10_3_port, ab_10_2_port, ab_10_1_port, 
      ab_10_0_port, ab_9_6_port, ab_9_5_port, ab_9_4_port, ab_9_3_port, 
      ab_9_2_port, ab_9_1_port, ab_9_0_port, ab_8_7_port, ab_8_6_port, 
      ab_8_5_port, ab_8_4_port, ab_8_3_port, ab_8_2_port, ab_8_1_port, 
      ab_8_0_port, ab_7_8_port, ab_7_7_port, ab_7_6_port, ab_7_5_port, 
      ab_7_4_port, ab_7_3_port, ab_7_2_port, ab_7_1_port, ab_7_0_port, 
      ab_6_9_port, ab_6_8_port, ab_6_7_port, ab_6_6_port, ab_6_5_port, 
      ab_6_4_port, ab_6_3_port, ab_6_2_port, ab_6_1_port, ab_6_0_port, 
      ab_5_10_port, ab_5_9_port, ab_5_8_port, ab_5_7_port, ab_5_6_port, 
      ab_5_5_port, ab_5_4_port, ab_5_3_port, ab_5_2_port, ab_5_1_port, 
      ab_5_0_port, ab_4_11_port, ab_4_10_port, ab_4_9_port, ab_4_8_port, 
      ab_4_7_port, ab_4_6_port, ab_4_5_port, ab_4_4_port, ab_4_3_port, 
      ab_4_2_port, ab_4_1_port, ab_4_0_port, ab_3_12_port, ab_3_11_port, 
      ab_3_10_port, ab_3_9_port, ab_3_8_port, ab_3_7_port, ab_3_6_port, 
      ab_3_5_port, ab_3_4_port, ab_3_3_port, ab_3_2_port, ab_3_1_port, 
      ab_3_0_port, ab_2_13_port, ab_2_12_port, ab_2_11_port, ab_2_10_port, 
      ab_2_9_port, ab_2_8_port, ab_2_7_port, ab_2_6_port, ab_2_5_port, 
      ab_2_4_port, ab_2_3_port, ab_2_2_port, ab_2_1_port, ab_2_0_port, 
      ab_1_14_port, ab_1_13_port, ab_1_12_port, ab_1_11_port, ab_1_10_port, 
      ab_1_9_port, ab_1_8_port, ab_1_7_port, ab_1_6_port, ab_1_5_port, 
      ab_1_4_port, ab_1_3_port, ab_1_2_port, ab_1_1_port, ab_1_0_port, 
      ab_0_15_port, ab_0_14_port, ab_0_13_port, ab_0_12_port, ab_0_11_port, 
      ab_0_10_port, ab_0_9_port, ab_0_8_port, ab_0_7_port, ab_0_6_port, 
      ab_0_5_port, ab_0_4_port, ab_0_3_port, ab_0_2_port, ab_0_1_port, 
      CARRYB_14_0_port, CARRYB_13_1_port, CARRYB_13_0_port, CARRYB_12_2_port, 
      CARRYB_12_1_port, CARRYB_12_0_port, CARRYB_11_3_port, CARRYB_11_2_port, 
      CARRYB_11_1_port, CARRYB_11_0_port, CARRYB_10_4_port, CARRYB_10_3_port, 
      CARRYB_10_2_port, CARRYB_10_1_port, CARRYB_10_0_port, CARRYB_9_5_port, 
      CARRYB_9_4_port, CARRYB_9_3_port, CARRYB_9_2_port, CARRYB_9_1_port, 
      CARRYB_9_0_port, CARRYB_8_6_port, CARRYB_8_5_port, CARRYB_8_4_port, 
      CARRYB_8_3_port, CARRYB_8_2_port, CARRYB_8_1_port, CARRYB_8_0_port, 
      CARRYB_7_7_port, CARRYB_7_6_port, CARRYB_7_5_port, CARRYB_7_4_port, 
      CARRYB_7_3_port, CARRYB_7_2_port, CARRYB_7_1_port, CARRYB_7_0_port, 
      CARRYB_6_8_port, CARRYB_6_7_port, CARRYB_6_6_port, CARRYB_6_5_port, 
      CARRYB_6_4_port, CARRYB_6_3_port, CARRYB_6_2_port, CARRYB_6_1_port, 
      CARRYB_6_0_port, CARRYB_5_9_port, CARRYB_5_8_port, CARRYB_5_7_port, 
      CARRYB_5_6_port, CARRYB_5_5_port, CARRYB_5_4_port, CARRYB_5_3_port, 
      CARRYB_5_2_port, CARRYB_5_1_port, CARRYB_5_0_port, CARRYB_4_10_port, 
      CARRYB_4_9_port, CARRYB_4_8_port, CARRYB_4_7_port, CARRYB_4_6_port, 
      CARRYB_4_5_port, CARRYB_4_4_port, CARRYB_4_3_port, CARRYB_4_2_port, 
      CARRYB_4_1_port, CARRYB_4_0_port, CARRYB_3_11_port, CARRYB_3_10_port, 
      CARRYB_3_9_port, CARRYB_3_8_port, CARRYB_3_7_port, CARRYB_3_6_port, 
      CARRYB_3_5_port, CARRYB_3_4_port, CARRYB_3_3_port, CARRYB_3_2_port, 
      CARRYB_3_1_port, CARRYB_3_0_port, CARRYB_2_12_port, CARRYB_2_11_port, 
      CARRYB_2_10_port, CARRYB_2_9_port, CARRYB_2_8_port, CARRYB_2_7_port, 
      CARRYB_2_6_port, CARRYB_2_5_port, CARRYB_2_4_port, CARRYB_2_3_port, 
      CARRYB_2_2_port, CARRYB_2_1_port, CARRYB_2_0_port, SUMB_15_0_port, 
      SUMB_14_1_port, SUMB_13_2_port, SUMB_13_1_port, SUMB_12_3_port, 
      SUMB_12_2_port, SUMB_12_1_port, SUMB_11_4_port, SUMB_11_3_port, 
      SUMB_11_2_port, SUMB_11_1_port, SUMB_10_5_port, SUMB_10_4_port, 
      SUMB_10_3_port, SUMB_10_2_port, SUMB_10_1_port, SUMB_9_6_port, 
      SUMB_9_5_port, SUMB_9_4_port, SUMB_9_3_port, SUMB_9_2_port, SUMB_9_1_port
      , SUMB_8_7_port, SUMB_8_6_port, SUMB_8_5_port, SUMB_8_4_port, 
      SUMB_8_3_port, SUMB_8_2_port, SUMB_8_1_port, SUMB_7_8_port, SUMB_7_7_port
      , SUMB_7_6_port, SUMB_7_5_port, SUMB_7_4_port, SUMB_7_3_port, 
      SUMB_7_2_port, SUMB_7_1_port, SUMB_6_9_port, SUMB_6_8_port, SUMB_6_7_port
      , SUMB_6_6_port, SUMB_6_5_port, SUMB_6_4_port, SUMB_6_3_port, 
      SUMB_6_2_port, SUMB_6_1_port, SUMB_5_10_port, SUMB_5_9_port, 
      SUMB_5_8_port, SUMB_5_7_port, SUMB_5_6_port, SUMB_5_5_port, SUMB_5_4_port
      , SUMB_5_3_port, SUMB_5_2_port, SUMB_5_1_port, SUMB_4_11_port, 
      SUMB_4_10_port, SUMB_4_9_port, SUMB_4_8_port, SUMB_4_7_port, 
      SUMB_4_6_port, SUMB_4_5_port, SUMB_4_4_port, SUMB_4_3_port, SUMB_4_2_port
      , SUMB_4_1_port, SUMB_3_12_port, SUMB_3_11_port, SUMB_3_10_port, 
      SUMB_3_9_port, SUMB_3_8_port, SUMB_3_7_port, SUMB_3_6_port, SUMB_3_5_port
      , SUMB_3_4_port, SUMB_3_3_port, SUMB_3_2_port, SUMB_3_1_port, 
      SUMB_2_13_port, SUMB_2_12_port, SUMB_2_11_port, SUMB_2_10_port, 
      SUMB_2_9_port, SUMB_2_8_port, SUMB_2_7_port, SUMB_2_6_port, SUMB_2_5_port
      , SUMB_2_4_port, SUMB_2_3_port, SUMB_2_2_port, SUMB_2_1_port, 
      SUMB_1_14_port, SUMB_1_13_port, SUMB_1_12_port, SUMB_1_11_port, 
      SUMB_1_10_port, SUMB_1_9_port, SUMB_1_8_port, SUMB_1_7_port, 
      SUMB_1_6_port, SUMB_1_5_port, SUMB_1_4_port, SUMB_1_3_port, SUMB_1_2_port
      , SUMB_1_1_port, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15
      , n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, 
      n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44
      , n45, n46, n47, n48, n_1049, n_1050, n_1051, n_1052, n_1053, n_1054, 
      n_1055, n_1056, n_1057, n_1058, n_1059, n_1060, n_1061, n_1062, n_1063 : 
      std_logic;

begin
   
   S14_15_0 : FAX1 port map( A => A(15), B => B(15), C => SUMB_15_0_port, YC =>
                           n_1049, YS => PRODUCT(15));
   S4_0 : FAX1 port map( A => ab_15_0_port, B => CARRYB_14_0_port, C => 
                           SUMB_14_1_port, YC => n_1050, YS => SUMB_15_0_port);
   S1_14_0 : FAX1 port map( A => ab_14_0_port, B => CARRYB_13_0_port, C => 
                           SUMB_13_1_port, YC => CARRYB_14_0_port, YS => 
                           PRODUCT(14));
   S2_14_1 : FAX1 port map( A => ab_14_1_port, B => CARRYB_13_1_port, C => 
                           SUMB_13_2_port, YC => n_1051, YS => SUMB_14_1_port);
   S1_13_0 : FAX1 port map( A => ab_13_0_port, B => CARRYB_12_0_port, C => 
                           SUMB_12_1_port, YC => CARRYB_13_0_port, YS => 
                           PRODUCT(13));
   S2_13_1 : FAX1 port map( A => ab_13_1_port, B => CARRYB_12_1_port, C => 
                           SUMB_12_2_port, YC => CARRYB_13_1_port, YS => 
                           SUMB_13_1_port);
   S2_13_2 : FAX1 port map( A => ab_13_2_port, B => CARRYB_12_2_port, C => 
                           SUMB_12_3_port, YC => n_1052, YS => SUMB_13_2_port);
   S1_12_0 : FAX1 port map( A => ab_12_0_port, B => CARRYB_11_0_port, C => 
                           SUMB_11_1_port, YC => CARRYB_12_0_port, YS => 
                           PRODUCT(12));
   S2_12_1 : FAX1 port map( A => ab_12_1_port, B => CARRYB_11_1_port, C => 
                           SUMB_11_2_port, YC => CARRYB_12_1_port, YS => 
                           SUMB_12_1_port);
   S2_12_2 : FAX1 port map( A => ab_12_2_port, B => CARRYB_11_2_port, C => 
                           SUMB_11_3_port, YC => CARRYB_12_2_port, YS => 
                           SUMB_12_2_port);
   S2_12_3 : FAX1 port map( A => ab_12_3_port, B => CARRYB_11_3_port, C => 
                           SUMB_11_4_port, YC => n_1053, YS => SUMB_12_3_port);
   S1_11_0 : FAX1 port map( A => ab_11_0_port, B => CARRYB_10_0_port, C => 
                           SUMB_10_1_port, YC => CARRYB_11_0_port, YS => 
                           PRODUCT(11));
   S2_11_1 : FAX1 port map( A => ab_11_1_port, B => CARRYB_10_1_port, C => 
                           SUMB_10_2_port, YC => CARRYB_11_1_port, YS => 
                           SUMB_11_1_port);
   S2_11_2 : FAX1 port map( A => ab_11_2_port, B => CARRYB_10_2_port, C => 
                           SUMB_10_3_port, YC => CARRYB_11_2_port, YS => 
                           SUMB_11_2_port);
   S2_11_3 : FAX1 port map( A => ab_11_3_port, B => CARRYB_10_3_port, C => 
                           SUMB_10_4_port, YC => CARRYB_11_3_port, YS => 
                           SUMB_11_3_port);
   S2_11_4 : FAX1 port map( A => ab_11_4_port, B => CARRYB_10_4_port, C => 
                           SUMB_10_5_port, YC => n_1054, YS => SUMB_11_4_port);
   S1_10_0 : FAX1 port map( A => ab_10_0_port, B => CARRYB_9_0_port, C => 
                           SUMB_9_1_port, YC => CARRYB_10_0_port, YS => 
                           PRODUCT(10));
   S2_10_1 : FAX1 port map( A => ab_10_1_port, B => CARRYB_9_1_port, C => 
                           SUMB_9_2_port, YC => CARRYB_10_1_port, YS => 
                           SUMB_10_1_port);
   S2_10_2 : FAX1 port map( A => ab_10_2_port, B => CARRYB_9_2_port, C => 
                           SUMB_9_3_port, YC => CARRYB_10_2_port, YS => 
                           SUMB_10_2_port);
   S2_10_3 : FAX1 port map( A => ab_10_3_port, B => CARRYB_9_3_port, C => 
                           SUMB_9_4_port, YC => CARRYB_10_3_port, YS => 
                           SUMB_10_3_port);
   S2_10_4 : FAX1 port map( A => ab_10_4_port, B => CARRYB_9_4_port, C => 
                           SUMB_9_5_port, YC => CARRYB_10_4_port, YS => 
                           SUMB_10_4_port);
   S2_10_5 : FAX1 port map( A => ab_10_5_port, B => CARRYB_9_5_port, C => 
                           SUMB_9_6_port, YC => n_1055, YS => SUMB_10_5_port);
   S1_9_0 : FAX1 port map( A => ab_9_0_port, B => CARRYB_8_0_port, C => 
                           SUMB_8_1_port, YC => CARRYB_9_0_port, YS => 
                           PRODUCT(9));
   S2_9_1 : FAX1 port map( A => ab_9_1_port, B => CARRYB_8_1_port, C => 
                           SUMB_8_2_port, YC => CARRYB_9_1_port, YS => 
                           SUMB_9_1_port);
   S2_9_2 : FAX1 port map( A => ab_9_2_port, B => CARRYB_8_2_port, C => 
                           SUMB_8_3_port, YC => CARRYB_9_2_port, YS => 
                           SUMB_9_2_port);
   S2_9_3 : FAX1 port map( A => ab_9_3_port, B => CARRYB_8_3_port, C => 
                           SUMB_8_4_port, YC => CARRYB_9_3_port, YS => 
                           SUMB_9_3_port);
   S2_9_4 : FAX1 port map( A => ab_9_4_port, B => CARRYB_8_4_port, C => 
                           SUMB_8_5_port, YC => CARRYB_9_4_port, YS => 
                           SUMB_9_4_port);
   S2_9_5 : FAX1 port map( A => ab_9_5_port, B => CARRYB_8_5_port, C => 
                           SUMB_8_6_port, YC => CARRYB_9_5_port, YS => 
                           SUMB_9_5_port);
   S2_9_6 : FAX1 port map( A => ab_9_6_port, B => CARRYB_8_6_port, C => 
                           SUMB_8_7_port, YC => n_1056, YS => SUMB_9_6_port);
   S1_8_0 : FAX1 port map( A => ab_8_0_port, B => CARRYB_7_0_port, C => 
                           SUMB_7_1_port, YC => CARRYB_8_0_port, YS => 
                           PRODUCT(8));
   S2_8_1 : FAX1 port map( A => ab_8_1_port, B => CARRYB_7_1_port, C => 
                           SUMB_7_2_port, YC => CARRYB_8_1_port, YS => 
                           SUMB_8_1_port);
   S2_8_2 : FAX1 port map( A => ab_8_2_port, B => CARRYB_7_2_port, C => 
                           SUMB_7_3_port, YC => CARRYB_8_2_port, YS => 
                           SUMB_8_2_port);
   S2_8_3 : FAX1 port map( A => ab_8_3_port, B => CARRYB_7_3_port, C => 
                           SUMB_7_4_port, YC => CARRYB_8_3_port, YS => 
                           SUMB_8_3_port);
   S2_8_4 : FAX1 port map( A => ab_8_4_port, B => CARRYB_7_4_port, C => 
                           SUMB_7_5_port, YC => CARRYB_8_4_port, YS => 
                           SUMB_8_4_port);
   S2_8_5 : FAX1 port map( A => ab_8_5_port, B => CARRYB_7_5_port, C => 
                           SUMB_7_6_port, YC => CARRYB_8_5_port, YS => 
                           SUMB_8_5_port);
   S2_8_6 : FAX1 port map( A => ab_8_6_port, B => CARRYB_7_6_port, C => 
                           SUMB_7_7_port, YC => CARRYB_8_6_port, YS => 
                           SUMB_8_6_port);
   S2_8_7 : FAX1 port map( A => ab_8_7_port, B => CARRYB_7_7_port, C => 
                           SUMB_7_8_port, YC => n_1057, YS => SUMB_8_7_port);
   S1_7_0 : FAX1 port map( A => ab_7_0_port, B => CARRYB_6_0_port, C => 
                           SUMB_6_1_port, YC => CARRYB_7_0_port, YS => 
                           PRODUCT(7));
   S2_7_1 : FAX1 port map( A => ab_7_1_port, B => CARRYB_6_1_port, C => 
                           SUMB_6_2_port, YC => CARRYB_7_1_port, YS => 
                           SUMB_7_1_port);
   S2_7_2 : FAX1 port map( A => ab_7_2_port, B => CARRYB_6_2_port, C => 
                           SUMB_6_3_port, YC => CARRYB_7_2_port, YS => 
                           SUMB_7_2_port);
   S2_7_3 : FAX1 port map( A => ab_7_3_port, B => CARRYB_6_3_port, C => 
                           SUMB_6_4_port, YC => CARRYB_7_3_port, YS => 
                           SUMB_7_3_port);
   S2_7_4 : FAX1 port map( A => ab_7_4_port, B => CARRYB_6_4_port, C => 
                           SUMB_6_5_port, YC => CARRYB_7_4_port, YS => 
                           SUMB_7_4_port);
   S2_7_5 : FAX1 port map( A => ab_7_5_port, B => CARRYB_6_5_port, C => 
                           SUMB_6_6_port, YC => CARRYB_7_5_port, YS => 
                           SUMB_7_5_port);
   S2_7_6 : FAX1 port map( A => ab_7_6_port, B => CARRYB_6_6_port, C => 
                           SUMB_6_7_port, YC => CARRYB_7_6_port, YS => 
                           SUMB_7_6_port);
   S2_7_7 : FAX1 port map( A => ab_7_7_port, B => CARRYB_6_7_port, C => 
                           SUMB_6_8_port, YC => CARRYB_7_7_port, YS => 
                           SUMB_7_7_port);
   S2_7_8 : FAX1 port map( A => ab_7_8_port, B => CARRYB_6_8_port, C => 
                           SUMB_6_9_port, YC => n_1058, YS => SUMB_7_8_port);
   S1_6_0 : FAX1 port map( A => ab_6_0_port, B => CARRYB_5_0_port, C => 
                           SUMB_5_1_port, YC => CARRYB_6_0_port, YS => 
                           PRODUCT(6));
   S2_6_1 : FAX1 port map( A => ab_6_1_port, B => CARRYB_5_1_port, C => 
                           SUMB_5_2_port, YC => CARRYB_6_1_port, YS => 
                           SUMB_6_1_port);
   S2_6_2 : FAX1 port map( A => ab_6_2_port, B => CARRYB_5_2_port, C => 
                           SUMB_5_3_port, YC => CARRYB_6_2_port, YS => 
                           SUMB_6_2_port);
   S2_6_3 : FAX1 port map( A => ab_6_3_port, B => CARRYB_5_3_port, C => 
                           SUMB_5_4_port, YC => CARRYB_6_3_port, YS => 
                           SUMB_6_3_port);
   S2_6_4 : FAX1 port map( A => ab_6_4_port, B => CARRYB_5_4_port, C => 
                           SUMB_5_5_port, YC => CARRYB_6_4_port, YS => 
                           SUMB_6_4_port);
   S2_6_5 : FAX1 port map( A => ab_6_5_port, B => CARRYB_5_5_port, C => 
                           SUMB_5_6_port, YC => CARRYB_6_5_port, YS => 
                           SUMB_6_5_port);
   S2_6_6 : FAX1 port map( A => ab_6_6_port, B => CARRYB_5_6_port, C => 
                           SUMB_5_7_port, YC => CARRYB_6_6_port, YS => 
                           SUMB_6_6_port);
   S2_6_7 : FAX1 port map( A => ab_6_7_port, B => CARRYB_5_7_port, C => 
                           SUMB_5_8_port, YC => CARRYB_6_7_port, YS => 
                           SUMB_6_7_port);
   S2_6_8 : FAX1 port map( A => ab_6_8_port, B => CARRYB_5_8_port, C => 
                           SUMB_5_9_port, YC => CARRYB_6_8_port, YS => 
                           SUMB_6_8_port);
   S2_6_9 : FAX1 port map( A => ab_6_9_port, B => CARRYB_5_9_port, C => 
                           SUMB_5_10_port, YC => n_1059, YS => SUMB_6_9_port);
   S1_5_0 : FAX1 port map( A => ab_5_0_port, B => CARRYB_4_0_port, C => 
                           SUMB_4_1_port, YC => CARRYB_5_0_port, YS => 
                           PRODUCT(5));
   S2_5_1 : FAX1 port map( A => ab_5_1_port, B => CARRYB_4_1_port, C => 
                           SUMB_4_2_port, YC => CARRYB_5_1_port, YS => 
                           SUMB_5_1_port);
   S2_5_2 : FAX1 port map( A => ab_5_2_port, B => CARRYB_4_2_port, C => 
                           SUMB_4_3_port, YC => CARRYB_5_2_port, YS => 
                           SUMB_5_2_port);
   S2_5_3 : FAX1 port map( A => ab_5_3_port, B => CARRYB_4_3_port, C => 
                           SUMB_4_4_port, YC => CARRYB_5_3_port, YS => 
                           SUMB_5_3_port);
   S2_5_4 : FAX1 port map( A => ab_5_4_port, B => CARRYB_4_4_port, C => 
                           SUMB_4_5_port, YC => CARRYB_5_4_port, YS => 
                           SUMB_5_4_port);
   S2_5_5 : FAX1 port map( A => ab_5_5_port, B => CARRYB_4_5_port, C => 
                           SUMB_4_6_port, YC => CARRYB_5_5_port, YS => 
                           SUMB_5_5_port);
   S2_5_6 : FAX1 port map( A => ab_5_6_port, B => CARRYB_4_6_port, C => 
                           SUMB_4_7_port, YC => CARRYB_5_6_port, YS => 
                           SUMB_5_6_port);
   S2_5_7 : FAX1 port map( A => ab_5_7_port, B => CARRYB_4_7_port, C => 
                           SUMB_4_8_port, YC => CARRYB_5_7_port, YS => 
                           SUMB_5_7_port);
   S2_5_8 : FAX1 port map( A => ab_5_8_port, B => CARRYB_4_8_port, C => 
                           SUMB_4_9_port, YC => CARRYB_5_8_port, YS => 
                           SUMB_5_8_port);
   S2_5_9 : FAX1 port map( A => ab_5_9_port, B => CARRYB_4_9_port, C => 
                           SUMB_4_10_port, YC => CARRYB_5_9_port, YS => 
                           SUMB_5_9_port);
   S2_5_10 : FAX1 port map( A => ab_5_10_port, B => CARRYB_4_10_port, C => 
                           SUMB_4_11_port, YC => n_1060, YS => SUMB_5_10_port);
   S1_4_0 : FAX1 port map( A => ab_4_0_port, B => CARRYB_3_0_port, C => 
                           SUMB_3_1_port, YC => CARRYB_4_0_port, YS => 
                           PRODUCT(4));
   S2_4_1 : FAX1 port map( A => ab_4_1_port, B => CARRYB_3_1_port, C => 
                           SUMB_3_2_port, YC => CARRYB_4_1_port, YS => 
                           SUMB_4_1_port);
   S2_4_2 : FAX1 port map( A => ab_4_2_port, B => CARRYB_3_2_port, C => 
                           SUMB_3_3_port, YC => CARRYB_4_2_port, YS => 
                           SUMB_4_2_port);
   S2_4_3 : FAX1 port map( A => ab_4_3_port, B => CARRYB_3_3_port, C => 
                           SUMB_3_4_port, YC => CARRYB_4_3_port, YS => 
                           SUMB_4_3_port);
   S2_4_4 : FAX1 port map( A => ab_4_4_port, B => CARRYB_3_4_port, C => 
                           SUMB_3_5_port, YC => CARRYB_4_4_port, YS => 
                           SUMB_4_4_port);
   S2_4_5 : FAX1 port map( A => ab_4_5_port, B => CARRYB_3_5_port, C => 
                           SUMB_3_6_port, YC => CARRYB_4_5_port, YS => 
                           SUMB_4_5_port);
   S2_4_6 : FAX1 port map( A => ab_4_6_port, B => CARRYB_3_6_port, C => 
                           SUMB_3_7_port, YC => CARRYB_4_6_port, YS => 
                           SUMB_4_6_port);
   S2_4_7 : FAX1 port map( A => ab_4_7_port, B => CARRYB_3_7_port, C => 
                           SUMB_3_8_port, YC => CARRYB_4_7_port, YS => 
                           SUMB_4_7_port);
   S2_4_8 : FAX1 port map( A => ab_4_8_port, B => CARRYB_3_8_port, C => 
                           SUMB_3_9_port, YC => CARRYB_4_8_port, YS => 
                           SUMB_4_8_port);
   S2_4_9 : FAX1 port map( A => ab_4_9_port, B => CARRYB_3_9_port, C => 
                           SUMB_3_10_port, YC => CARRYB_4_9_port, YS => 
                           SUMB_4_9_port);
   S2_4_10 : FAX1 port map( A => ab_4_10_port, B => CARRYB_3_10_port, C => 
                           SUMB_3_11_port, YC => CARRYB_4_10_port, YS => 
                           SUMB_4_10_port);
   S2_4_11 : FAX1 port map( A => ab_4_11_port, B => CARRYB_3_11_port, C => 
                           SUMB_3_12_port, YC => n_1061, YS => SUMB_4_11_port);
   S1_3_0 : FAX1 port map( A => ab_3_0_port, B => CARRYB_2_0_port, C => 
                           SUMB_2_1_port, YC => CARRYB_3_0_port, YS => 
                           PRODUCT(3));
   S2_3_1 : FAX1 port map( A => ab_3_1_port, B => CARRYB_2_1_port, C => 
                           SUMB_2_2_port, YC => CARRYB_3_1_port, YS => 
                           SUMB_3_1_port);
   S2_3_2 : FAX1 port map( A => ab_3_2_port, B => CARRYB_2_2_port, C => 
                           SUMB_2_3_port, YC => CARRYB_3_2_port, YS => 
                           SUMB_3_2_port);
   S2_3_3 : FAX1 port map( A => ab_3_3_port, B => CARRYB_2_3_port, C => 
                           SUMB_2_4_port, YC => CARRYB_3_3_port, YS => 
                           SUMB_3_3_port);
   S2_3_4 : FAX1 port map( A => ab_3_4_port, B => CARRYB_2_4_port, C => 
                           SUMB_2_5_port, YC => CARRYB_3_4_port, YS => 
                           SUMB_3_4_port);
   S2_3_5 : FAX1 port map( A => ab_3_5_port, B => CARRYB_2_5_port, C => 
                           SUMB_2_6_port, YC => CARRYB_3_5_port, YS => 
                           SUMB_3_5_port);
   S2_3_6 : FAX1 port map( A => ab_3_6_port, B => CARRYB_2_6_port, C => 
                           SUMB_2_7_port, YC => CARRYB_3_6_port, YS => 
                           SUMB_3_6_port);
   S2_3_7 : FAX1 port map( A => ab_3_7_port, B => CARRYB_2_7_port, C => 
                           SUMB_2_8_port, YC => CARRYB_3_7_port, YS => 
                           SUMB_3_7_port);
   S2_3_8 : FAX1 port map( A => ab_3_8_port, B => CARRYB_2_8_port, C => 
                           SUMB_2_9_port, YC => CARRYB_3_8_port, YS => 
                           SUMB_3_8_port);
   S2_3_9 : FAX1 port map( A => ab_3_9_port, B => CARRYB_2_9_port, C => 
                           SUMB_2_10_port, YC => CARRYB_3_9_port, YS => 
                           SUMB_3_9_port);
   S2_3_10 : FAX1 port map( A => ab_3_10_port, B => CARRYB_2_10_port, C => 
                           SUMB_2_11_port, YC => CARRYB_3_10_port, YS => 
                           SUMB_3_10_port);
   S2_3_11 : FAX1 port map( A => ab_3_11_port, B => CARRYB_2_11_port, C => 
                           SUMB_2_12_port, YC => CARRYB_3_11_port, YS => 
                           SUMB_3_11_port);
   S2_3_12 : FAX1 port map( A => ab_3_12_port, B => CARRYB_2_12_port, C => 
                           SUMB_2_13_port, YC => n_1062, YS => SUMB_3_12_port);
   S1_2_0 : FAX1 port map( A => ab_2_0_port, B => n3, C => SUMB_1_1_port, YC =>
                           CARRYB_2_0_port, YS => PRODUCT(2));
   S2_2_1 : FAX1 port map( A => ab_2_1_port, B => n4, C => SUMB_1_2_port, YC =>
                           CARRYB_2_1_port, YS => SUMB_2_1_port);
   S2_2_2 : FAX1 port map( A => ab_2_2_port, B => n5, C => SUMB_1_3_port, YC =>
                           CARRYB_2_2_port, YS => SUMB_2_2_port);
   S2_2_3 : FAX1 port map( A => ab_2_3_port, B => n6, C => SUMB_1_4_port, YC =>
                           CARRYB_2_3_port, YS => SUMB_2_3_port);
   S2_2_4 : FAX1 port map( A => ab_2_4_port, B => n7, C => SUMB_1_5_port, YC =>
                           CARRYB_2_4_port, YS => SUMB_2_4_port);
   S2_2_5 : FAX1 port map( A => ab_2_5_port, B => n8, C => SUMB_1_6_port, YC =>
                           CARRYB_2_5_port, YS => SUMB_2_5_port);
   S2_2_6 : FAX1 port map( A => ab_2_6_port, B => n9, C => SUMB_1_7_port, YC =>
                           CARRYB_2_6_port, YS => SUMB_2_6_port);
   S2_2_7 : FAX1 port map( A => ab_2_7_port, B => n10, C => SUMB_1_8_port, YC 
                           => CARRYB_2_7_port, YS => SUMB_2_7_port);
   S2_2_8 : FAX1 port map( A => ab_2_8_port, B => n11, C => SUMB_1_9_port, YC 
                           => CARRYB_2_8_port, YS => SUMB_2_8_port);
   S2_2_9 : FAX1 port map( A => ab_2_9_port, B => n16, C => SUMB_1_10_port, YC 
                           => CARRYB_2_9_port, YS => SUMB_2_9_port);
   S2_2_10 : FAX1 port map( A => ab_2_10_port, B => n15, C => SUMB_1_11_port, 
                           YC => CARRYB_2_10_port, YS => SUMB_2_10_port);
   S2_2_11 : FAX1 port map( A => ab_2_11_port, B => n14, C => SUMB_1_12_port, 
                           YC => CARRYB_2_11_port, YS => SUMB_2_11_port);
   S2_2_12 : FAX1 port map( A => ab_2_12_port, B => n13, C => SUMB_1_13_port, 
                           YC => CARRYB_2_12_port, YS => SUMB_2_12_port);
   S2_2_13 : FAX1 port map( A => ab_2_13_port, B => n12, C => SUMB_1_14_port, 
                           YC => n_1063, YS => SUMB_2_13_port);
   U2 : AND2X2 port map( A => ab_0_1_port, B => ab_1_0_port, Y => n3);
   U3 : AND2X2 port map( A => ab_0_2_port, B => ab_1_1_port, Y => n4);
   U4 : AND2X2 port map( A => ab_0_3_port, B => ab_1_2_port, Y => n5);
   U5 : AND2X2 port map( A => ab_0_4_port, B => ab_1_3_port, Y => n6);
   U6 : AND2X2 port map( A => ab_0_5_port, B => ab_1_4_port, Y => n7);
   U7 : AND2X2 port map( A => ab_0_6_port, B => ab_1_5_port, Y => n8);
   U8 : AND2X2 port map( A => ab_0_7_port, B => ab_1_6_port, Y => n9);
   U9 : AND2X2 port map( A => ab_0_8_port, B => ab_1_7_port, Y => n10);
   U10 : AND2X2 port map( A => ab_0_9_port, B => ab_1_8_port, Y => n11);
   U11 : AND2X2 port map( A => ab_0_14_port, B => ab_1_13_port, Y => n12);
   U12 : AND2X2 port map( A => ab_0_13_port, B => ab_1_12_port, Y => n13);
   U13 : AND2X2 port map( A => ab_0_12_port, B => ab_1_11_port, Y => n14);
   U14 : AND2X2 port map( A => ab_0_11_port, B => ab_1_10_port, Y => n15);
   U15 : AND2X2 port map( A => ab_0_10_port, B => ab_1_9_port, Y => n16);
   U16 : INVX2 port map( A => A(0), Y => n48);
   U17 : INVX2 port map( A => A(1), Y => n47);
   U18 : INVX2 port map( A => B(0), Y => n32);
   U19 : INVX2 port map( A => B(1), Y => n31);
   U20 : INVX2 port map( A => A(2), Y => n46);
   U21 : INVX2 port map( A => B(2), Y => n30);
   U22 : INVX2 port map( A => A(3), Y => n45);
   U23 : INVX2 port map( A => B(3), Y => n29);
   U24 : INVX2 port map( A => A(4), Y => n44);
   U25 : INVX2 port map( A => B(4), Y => n28);
   U26 : INVX2 port map( A => A(5), Y => n43);
   U27 : INVX2 port map( A => B(5), Y => n27);
   U28 : INVX2 port map( A => A(6), Y => n42);
   U29 : INVX2 port map( A => B(6), Y => n26);
   U30 : INVX2 port map( A => A(7), Y => n41);
   U31 : INVX2 port map( A => B(7), Y => n25);
   U32 : XOR2X1 port map( A => ab_1_0_port, B => ab_0_1_port, Y => PRODUCT(1));
   U33 : XOR2X1 port map( A => ab_1_1_port, B => ab_0_2_port, Y => 
                           SUMB_1_1_port);
   U34 : XOR2X1 port map( A => ab_1_2_port, B => ab_0_3_port, Y => 
                           SUMB_1_2_port);
   U35 : XOR2X1 port map( A => ab_1_3_port, B => ab_0_4_port, Y => 
                           SUMB_1_3_port);
   U36 : XOR2X1 port map( A => ab_1_4_port, B => ab_0_5_port, Y => 
                           SUMB_1_4_port);
   U37 : XOR2X1 port map( A => ab_1_5_port, B => ab_0_6_port, Y => 
                           SUMB_1_5_port);
   U38 : XOR2X1 port map( A => ab_1_6_port, B => ab_0_7_port, Y => 
                           SUMB_1_6_port);
   U39 : XOR2X1 port map( A => ab_1_7_port, B => ab_0_8_port, Y => 
                           SUMB_1_7_port);
   U40 : XOR2X1 port map( A => ab_1_8_port, B => ab_0_9_port, Y => 
                           SUMB_1_8_port);
   U41 : XOR2X1 port map( A => ab_1_9_port, B => ab_0_10_port, Y => 
                           SUMB_1_9_port);
   U42 : XOR2X1 port map( A => ab_1_10_port, B => ab_0_11_port, Y => 
                           SUMB_1_10_port);
   U43 : XOR2X1 port map( A => ab_1_11_port, B => ab_0_12_port, Y => 
                           SUMB_1_11_port);
   U44 : XOR2X1 port map( A => ab_1_12_port, B => ab_0_13_port, Y => 
                           SUMB_1_12_port);
   U45 : XOR2X1 port map( A => ab_1_13_port, B => ab_0_14_port, Y => 
                           SUMB_1_13_port);
   U46 : XOR2X1 port map( A => ab_1_14_port, B => ab_0_15_port, Y => 
                           SUMB_1_14_port);
   U47 : INVX2 port map( A => B(15), Y => n17);
   U48 : INVX2 port map( A => B(14), Y => n18);
   U49 : INVX2 port map( A => B(13), Y => n19);
   U50 : INVX2 port map( A => B(12), Y => n20);
   U51 : INVX2 port map( A => B(11), Y => n21);
   U52 : INVX2 port map( A => B(10), Y => n22);
   U53 : INVX2 port map( A => B(9), Y => n23);
   U54 : INVX2 port map( A => B(8), Y => n24);
   U55 : INVX2 port map( A => A(15), Y => n33);
   U56 : INVX2 port map( A => A(14), Y => n34);
   U57 : INVX2 port map( A => A(13), Y => n35);
   U58 : INVX2 port map( A => A(12), Y => n36);
   U59 : INVX2 port map( A => A(11), Y => n37);
   U60 : INVX2 port map( A => A(10), Y => n38);
   U61 : INVX2 port map( A => A(9), Y => n39);
   U62 : INVX2 port map( A => A(8), Y => n40);
   U63 : NOR2X1 port map( A => n39, B => n26, Y => ab_9_6_port);
   U64 : NOR2X1 port map( A => n39, B => n27, Y => ab_9_5_port);
   U65 : NOR2X1 port map( A => n39, B => n28, Y => ab_9_4_port);
   U66 : NOR2X1 port map( A => n39, B => n29, Y => ab_9_3_port);
   U67 : NOR2X1 port map( A => n39, B => n30, Y => ab_9_2_port);
   U68 : NOR2X1 port map( A => n39, B => n31, Y => ab_9_1_port);
   U69 : NOR2X1 port map( A => n39, B => n32, Y => ab_9_0_port);
   U70 : NOR2X1 port map( A => n25, B => n40, Y => ab_8_7_port);
   U71 : NOR2X1 port map( A => n26, B => n40, Y => ab_8_6_port);
   U72 : NOR2X1 port map( A => n27, B => n40, Y => ab_8_5_port);
   U73 : NOR2X1 port map( A => n28, B => n40, Y => ab_8_4_port);
   U74 : NOR2X1 port map( A => n29, B => n40, Y => ab_8_3_port);
   U75 : NOR2X1 port map( A => n30, B => n40, Y => ab_8_2_port);
   U76 : NOR2X1 port map( A => n31, B => n40, Y => ab_8_1_port);
   U77 : NOR2X1 port map( A => n32, B => n40, Y => ab_8_0_port);
   U78 : NOR2X1 port map( A => n24, B => n41, Y => ab_7_8_port);
   U79 : NOR2X1 port map( A => n25, B => n41, Y => ab_7_7_port);
   U80 : NOR2X1 port map( A => n26, B => n41, Y => ab_7_6_port);
   U81 : NOR2X1 port map( A => n27, B => n41, Y => ab_7_5_port);
   U82 : NOR2X1 port map( A => n28, B => n41, Y => ab_7_4_port);
   U83 : NOR2X1 port map( A => n29, B => n41, Y => ab_7_3_port);
   U84 : NOR2X1 port map( A => n30, B => n41, Y => ab_7_2_port);
   U85 : NOR2X1 port map( A => n31, B => n41, Y => ab_7_1_port);
   U86 : NOR2X1 port map( A => n32, B => n41, Y => ab_7_0_port);
   U87 : NOR2X1 port map( A => n23, B => n42, Y => ab_6_9_port);
   U88 : NOR2X1 port map( A => n24, B => n42, Y => ab_6_8_port);
   U89 : NOR2X1 port map( A => n25, B => n42, Y => ab_6_7_port);
   U90 : NOR2X1 port map( A => n26, B => n42, Y => ab_6_6_port);
   U91 : NOR2X1 port map( A => n27, B => n42, Y => ab_6_5_port);
   U92 : NOR2X1 port map( A => n28, B => n42, Y => ab_6_4_port);
   U93 : NOR2X1 port map( A => n29, B => n42, Y => ab_6_3_port);
   U94 : NOR2X1 port map( A => n30, B => n42, Y => ab_6_2_port);
   U95 : NOR2X1 port map( A => n31, B => n42, Y => ab_6_1_port);
   U96 : NOR2X1 port map( A => n32, B => n42, Y => ab_6_0_port);
   U97 : NOR2X1 port map( A => n23, B => n43, Y => ab_5_9_port);
   U98 : NOR2X1 port map( A => n24, B => n43, Y => ab_5_8_port);
   U99 : NOR2X1 port map( A => n25, B => n43, Y => ab_5_7_port);
   U100 : NOR2X1 port map( A => n26, B => n43, Y => ab_5_6_port);
   U101 : NOR2X1 port map( A => n27, B => n43, Y => ab_5_5_port);
   U102 : NOR2X1 port map( A => n28, B => n43, Y => ab_5_4_port);
   U103 : NOR2X1 port map( A => n29, B => n43, Y => ab_5_3_port);
   U104 : NOR2X1 port map( A => n30, B => n43, Y => ab_5_2_port);
   U105 : NOR2X1 port map( A => n31, B => n43, Y => ab_5_1_port);
   U106 : NOR2X1 port map( A => n22, B => n43, Y => ab_5_10_port);
   U107 : NOR2X1 port map( A => n32, B => n43, Y => ab_5_0_port);
   U108 : NOR2X1 port map( A => n23, B => n44, Y => ab_4_9_port);
   U109 : NOR2X1 port map( A => n24, B => n44, Y => ab_4_8_port);
   U110 : NOR2X1 port map( A => n25, B => n44, Y => ab_4_7_port);
   U111 : NOR2X1 port map( A => n26, B => n44, Y => ab_4_6_port);
   U112 : NOR2X1 port map( A => n27, B => n44, Y => ab_4_5_port);
   U113 : NOR2X1 port map( A => n28, B => n44, Y => ab_4_4_port);
   U114 : NOR2X1 port map( A => n29, B => n44, Y => ab_4_3_port);
   U115 : NOR2X1 port map( A => n30, B => n44, Y => ab_4_2_port);
   U116 : NOR2X1 port map( A => n31, B => n44, Y => ab_4_1_port);
   U117 : NOR2X1 port map( A => n21, B => n44, Y => ab_4_11_port);
   U118 : NOR2X1 port map( A => n22, B => n44, Y => ab_4_10_port);
   U119 : NOR2X1 port map( A => n32, B => n44, Y => ab_4_0_port);
   U120 : NOR2X1 port map( A => n23, B => n45, Y => ab_3_9_port);
   U121 : NOR2X1 port map( A => n24, B => n45, Y => ab_3_8_port);
   U122 : NOR2X1 port map( A => n25, B => n45, Y => ab_3_7_port);
   U123 : NOR2X1 port map( A => n26, B => n45, Y => ab_3_6_port);
   U124 : NOR2X1 port map( A => n27, B => n45, Y => ab_3_5_port);
   U125 : NOR2X1 port map( A => n28, B => n45, Y => ab_3_4_port);
   U126 : NOR2X1 port map( A => n29, B => n45, Y => ab_3_3_port);
   U127 : NOR2X1 port map( A => n30, B => n45, Y => ab_3_2_port);
   U128 : NOR2X1 port map( A => n31, B => n45, Y => ab_3_1_port);
   U129 : NOR2X1 port map( A => n20, B => n45, Y => ab_3_12_port);
   U130 : NOR2X1 port map( A => n21, B => n45, Y => ab_3_11_port);
   U131 : NOR2X1 port map( A => n22, B => n45, Y => ab_3_10_port);
   U132 : NOR2X1 port map( A => n32, B => n45, Y => ab_3_0_port);
   U133 : NOR2X1 port map( A => n23, B => n46, Y => ab_2_9_port);
   U134 : NOR2X1 port map( A => n24, B => n46, Y => ab_2_8_port);
   U135 : NOR2X1 port map( A => n25, B => n46, Y => ab_2_7_port);
   U136 : NOR2X1 port map( A => n26, B => n46, Y => ab_2_6_port);
   U137 : NOR2X1 port map( A => n27, B => n46, Y => ab_2_5_port);
   U138 : NOR2X1 port map( A => n28, B => n46, Y => ab_2_4_port);
   U139 : NOR2X1 port map( A => n29, B => n46, Y => ab_2_3_port);
   U140 : NOR2X1 port map( A => n30, B => n46, Y => ab_2_2_port);
   U141 : NOR2X1 port map( A => n31, B => n46, Y => ab_2_1_port);
   U142 : NOR2X1 port map( A => n19, B => n46, Y => ab_2_13_port);
   U143 : NOR2X1 port map( A => n20, B => n46, Y => ab_2_12_port);
   U144 : NOR2X1 port map( A => n21, B => n46, Y => ab_2_11_port);
   U145 : NOR2X1 port map( A => n22, B => n46, Y => ab_2_10_port);
   U146 : NOR2X1 port map( A => n32, B => n46, Y => ab_2_0_port);
   U147 : NOR2X1 port map( A => n23, B => n47, Y => ab_1_9_port);
   U148 : NOR2X1 port map( A => n24, B => n47, Y => ab_1_8_port);
   U149 : NOR2X1 port map( A => n25, B => n47, Y => ab_1_7_port);
   U150 : NOR2X1 port map( A => n26, B => n47, Y => ab_1_6_port);
   U151 : NOR2X1 port map( A => n27, B => n47, Y => ab_1_5_port);
   U152 : NOR2X1 port map( A => n28, B => n47, Y => ab_1_4_port);
   U153 : NOR2X1 port map( A => n29, B => n47, Y => ab_1_3_port);
   U154 : NOR2X1 port map( A => n30, B => n47, Y => ab_1_2_port);
   U155 : NOR2X1 port map( A => n31, B => n47, Y => ab_1_1_port);
   U156 : NOR2X1 port map( A => n18, B => n47, Y => ab_1_14_port);
   U157 : NOR2X1 port map( A => n19, B => n47, Y => ab_1_13_port);
   U158 : NOR2X1 port map( A => n20, B => n47, Y => ab_1_12_port);
   U159 : NOR2X1 port map( A => n21, B => n47, Y => ab_1_11_port);
   U160 : NOR2X1 port map( A => n22, B => n47, Y => ab_1_10_port);
   U161 : NOR2X1 port map( A => n32, B => n47, Y => ab_1_0_port);
   U162 : NOR2X1 port map( A => B(0), B => n33, Y => ab_15_0_port);
   U163 : NOR2X1 port map( A => n31, B => n34, Y => ab_14_1_port);
   U164 : NOR2X1 port map( A => n32, B => n34, Y => ab_14_0_port);
   U165 : NOR2X1 port map( A => n30, B => n35, Y => ab_13_2_port);
   U166 : NOR2X1 port map( A => n31, B => n35, Y => ab_13_1_port);
   U167 : NOR2X1 port map( A => n32, B => n35, Y => ab_13_0_port);
   U168 : NOR2X1 port map( A => n29, B => n36, Y => ab_12_3_port);
   U169 : NOR2X1 port map( A => n30, B => n36, Y => ab_12_2_port);
   U170 : NOR2X1 port map( A => n31, B => n36, Y => ab_12_1_port);
   U171 : NOR2X1 port map( A => n32, B => n36, Y => ab_12_0_port);
   U172 : NOR2X1 port map( A => n28, B => n37, Y => ab_11_4_port);
   U173 : NOR2X1 port map( A => n29, B => n37, Y => ab_11_3_port);
   U174 : NOR2X1 port map( A => n30, B => n37, Y => ab_11_2_port);
   U175 : NOR2X1 port map( A => n31, B => n37, Y => ab_11_1_port);
   U176 : NOR2X1 port map( A => n32, B => n37, Y => ab_11_0_port);
   U177 : NOR2X1 port map( A => n27, B => n38, Y => ab_10_5_port);
   U178 : NOR2X1 port map( A => n28, B => n38, Y => ab_10_4_port);
   U179 : NOR2X1 port map( A => n29, B => n38, Y => ab_10_3_port);
   U180 : NOR2X1 port map( A => n30, B => n38, Y => ab_10_2_port);
   U181 : NOR2X1 port map( A => n31, B => n38, Y => ab_10_1_port);
   U182 : NOR2X1 port map( A => n32, B => n38, Y => ab_10_0_port);
   U183 : NOR2X1 port map( A => n23, B => n48, Y => ab_0_9_port);
   U184 : NOR2X1 port map( A => n24, B => n48, Y => ab_0_8_port);
   U185 : NOR2X1 port map( A => n25, B => n48, Y => ab_0_7_port);
   U186 : NOR2X1 port map( A => n26, B => n48, Y => ab_0_6_port);
   U187 : NOR2X1 port map( A => n27, B => n48, Y => ab_0_5_port);
   U188 : NOR2X1 port map( A => n28, B => n48, Y => ab_0_4_port);
   U189 : NOR2X1 port map( A => n29, B => n48, Y => ab_0_3_port);
   U190 : NOR2X1 port map( A => n30, B => n48, Y => ab_0_2_port);
   U191 : NOR2X1 port map( A => n31, B => n48, Y => ab_0_1_port);
   U192 : NOR2X1 port map( A => A(0), B => n17, Y => ab_0_15_port);
   U193 : NOR2X1 port map( A => n18, B => n48, Y => ab_0_14_port);
   U194 : NOR2X1 port map( A => n19, B => n48, Y => ab_0_13_port);
   U195 : NOR2X1 port map( A => n20, B => n48, Y => ab_0_12_port);
   U196 : NOR2X1 port map( A => n21, B => n48, Y => ab_0_11_port);
   U197 : NOR2X1 port map( A => n22, B => n48, Y => ab_0_10_port);
   U198 : NOR2X1 port map( A => n32, B => n48, Y => PRODUCT(0));

end SYN_csa;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_matrix_math.all;

entity matrix_math_DW02_mult_0 is

   port( A, B : in std_logic_vector (15 downto 0);  TC : in std_logic;  PRODUCT
         : out std_logic_vector (31 downto 0));

end matrix_math_DW02_mult_0;

architecture SYN_csa of matrix_math_DW02_mult_0 is

   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component FAX1
      port( A, B, C : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal ab_15_0_port, ab_14_1_port, ab_14_0_port, ab_13_2_port, ab_13_1_port,
      ab_13_0_port, ab_12_3_port, ab_12_2_port, ab_12_1_port, ab_12_0_port, 
      ab_11_4_port, ab_11_3_port, ab_11_2_port, ab_11_1_port, ab_11_0_port, 
      ab_10_5_port, ab_10_4_port, ab_10_3_port, ab_10_2_port, ab_10_1_port, 
      ab_10_0_port, ab_9_6_port, ab_9_5_port, ab_9_4_port, ab_9_3_port, 
      ab_9_2_port, ab_9_1_port, ab_9_0_port, ab_8_7_port, ab_8_6_port, 
      ab_8_5_port, ab_8_4_port, ab_8_3_port, ab_8_2_port, ab_8_1_port, 
      ab_8_0_port, ab_7_8_port, ab_7_7_port, ab_7_6_port, ab_7_5_port, 
      ab_7_4_port, ab_7_3_port, ab_7_2_port, ab_7_1_port, ab_7_0_port, 
      ab_6_9_port, ab_6_8_port, ab_6_7_port, ab_6_6_port, ab_6_5_port, 
      ab_6_4_port, ab_6_3_port, ab_6_2_port, ab_6_1_port, ab_6_0_port, 
      ab_5_10_port, ab_5_9_port, ab_5_8_port, ab_5_7_port, ab_5_6_port, 
      ab_5_5_port, ab_5_4_port, ab_5_3_port, ab_5_2_port, ab_5_1_port, 
      ab_5_0_port, ab_4_11_port, ab_4_10_port, ab_4_9_port, ab_4_8_port, 
      ab_4_7_port, ab_4_6_port, ab_4_5_port, ab_4_4_port, ab_4_3_port, 
      ab_4_2_port, ab_4_1_port, ab_4_0_port, ab_3_12_port, ab_3_11_port, 
      ab_3_10_port, ab_3_9_port, ab_3_8_port, ab_3_7_port, ab_3_6_port, 
      ab_3_5_port, ab_3_4_port, ab_3_3_port, ab_3_2_port, ab_3_1_port, 
      ab_3_0_port, ab_2_13_port, ab_2_12_port, ab_2_11_port, ab_2_10_port, 
      ab_2_9_port, ab_2_8_port, ab_2_7_port, ab_2_6_port, ab_2_5_port, 
      ab_2_4_port, ab_2_3_port, ab_2_2_port, ab_2_1_port, ab_2_0_port, 
      ab_1_14_port, ab_1_13_port, ab_1_12_port, ab_1_11_port, ab_1_10_port, 
      ab_1_9_port, ab_1_8_port, ab_1_7_port, ab_1_6_port, ab_1_5_port, 
      ab_1_4_port, ab_1_3_port, ab_1_2_port, ab_1_1_port, ab_1_0_port, 
      ab_0_15_port, ab_0_14_port, ab_0_13_port, ab_0_12_port, ab_0_11_port, 
      ab_0_10_port, ab_0_9_port, ab_0_8_port, ab_0_7_port, ab_0_6_port, 
      ab_0_5_port, ab_0_4_port, ab_0_3_port, ab_0_2_port, ab_0_1_port, 
      CARRYB_14_0_port, CARRYB_13_1_port, CARRYB_13_0_port, CARRYB_12_2_port, 
      CARRYB_12_1_port, CARRYB_12_0_port, CARRYB_11_3_port, CARRYB_11_2_port, 
      CARRYB_11_1_port, CARRYB_11_0_port, CARRYB_10_4_port, CARRYB_10_3_port, 
      CARRYB_10_2_port, CARRYB_10_1_port, CARRYB_10_0_port, CARRYB_9_5_port, 
      CARRYB_9_4_port, CARRYB_9_3_port, CARRYB_9_2_port, CARRYB_9_1_port, 
      CARRYB_9_0_port, CARRYB_8_6_port, CARRYB_8_5_port, CARRYB_8_4_port, 
      CARRYB_8_3_port, CARRYB_8_2_port, CARRYB_8_1_port, CARRYB_8_0_port, 
      CARRYB_7_7_port, CARRYB_7_6_port, CARRYB_7_5_port, CARRYB_7_4_port, 
      CARRYB_7_3_port, CARRYB_7_2_port, CARRYB_7_1_port, CARRYB_7_0_port, 
      CARRYB_6_8_port, CARRYB_6_7_port, CARRYB_6_6_port, CARRYB_6_5_port, 
      CARRYB_6_4_port, CARRYB_6_3_port, CARRYB_6_2_port, CARRYB_6_1_port, 
      CARRYB_6_0_port, CARRYB_5_9_port, CARRYB_5_8_port, CARRYB_5_7_port, 
      CARRYB_5_6_port, CARRYB_5_5_port, CARRYB_5_4_port, CARRYB_5_3_port, 
      CARRYB_5_2_port, CARRYB_5_1_port, CARRYB_5_0_port, CARRYB_4_10_port, 
      CARRYB_4_9_port, CARRYB_4_8_port, CARRYB_4_7_port, CARRYB_4_6_port, 
      CARRYB_4_5_port, CARRYB_4_4_port, CARRYB_4_3_port, CARRYB_4_2_port, 
      CARRYB_4_1_port, CARRYB_4_0_port, CARRYB_3_11_port, CARRYB_3_10_port, 
      CARRYB_3_9_port, CARRYB_3_8_port, CARRYB_3_7_port, CARRYB_3_6_port, 
      CARRYB_3_5_port, CARRYB_3_4_port, CARRYB_3_3_port, CARRYB_3_2_port, 
      CARRYB_3_1_port, CARRYB_3_0_port, CARRYB_2_12_port, CARRYB_2_11_port, 
      CARRYB_2_10_port, CARRYB_2_9_port, CARRYB_2_8_port, CARRYB_2_7_port, 
      CARRYB_2_6_port, CARRYB_2_5_port, CARRYB_2_4_port, CARRYB_2_3_port, 
      CARRYB_2_2_port, CARRYB_2_1_port, CARRYB_2_0_port, SUMB_15_0_port, 
      SUMB_14_1_port, SUMB_13_2_port, SUMB_13_1_port, SUMB_12_3_port, 
      SUMB_12_2_port, SUMB_12_1_port, SUMB_11_4_port, SUMB_11_3_port, 
      SUMB_11_2_port, SUMB_11_1_port, SUMB_10_5_port, SUMB_10_4_port, 
      SUMB_10_3_port, SUMB_10_2_port, SUMB_10_1_port, SUMB_9_6_port, 
      SUMB_9_5_port, SUMB_9_4_port, SUMB_9_3_port, SUMB_9_2_port, SUMB_9_1_port
      , SUMB_8_7_port, SUMB_8_6_port, SUMB_8_5_port, SUMB_8_4_port, 
      SUMB_8_3_port, SUMB_8_2_port, SUMB_8_1_port, SUMB_7_8_port, SUMB_7_7_port
      , SUMB_7_6_port, SUMB_7_5_port, SUMB_7_4_port, SUMB_7_3_port, 
      SUMB_7_2_port, SUMB_7_1_port, SUMB_6_9_port, SUMB_6_8_port, SUMB_6_7_port
      , SUMB_6_6_port, SUMB_6_5_port, SUMB_6_4_port, SUMB_6_3_port, 
      SUMB_6_2_port, SUMB_6_1_port, SUMB_5_10_port, SUMB_5_9_port, 
      SUMB_5_8_port, SUMB_5_7_port, SUMB_5_6_port, SUMB_5_5_port, SUMB_5_4_port
      , SUMB_5_3_port, SUMB_5_2_port, SUMB_5_1_port, SUMB_4_11_port, 
      SUMB_4_10_port, SUMB_4_9_port, SUMB_4_8_port, SUMB_4_7_port, 
      SUMB_4_6_port, SUMB_4_5_port, SUMB_4_4_port, SUMB_4_3_port, SUMB_4_2_port
      , SUMB_4_1_port, SUMB_3_12_port, SUMB_3_11_port, SUMB_3_10_port, 
      SUMB_3_9_port, SUMB_3_8_port, SUMB_3_7_port, SUMB_3_6_port, SUMB_3_5_port
      , SUMB_3_4_port, SUMB_3_3_port, SUMB_3_2_port, SUMB_3_1_port, 
      SUMB_2_13_port, SUMB_2_12_port, SUMB_2_11_port, SUMB_2_10_port, 
      SUMB_2_9_port, SUMB_2_8_port, SUMB_2_7_port, SUMB_2_6_port, SUMB_2_5_port
      , SUMB_2_4_port, SUMB_2_3_port, SUMB_2_2_port, SUMB_2_1_port, 
      SUMB_1_14_port, SUMB_1_13_port, SUMB_1_12_port, SUMB_1_11_port, 
      SUMB_1_10_port, SUMB_1_9_port, SUMB_1_8_port, SUMB_1_7_port, 
      SUMB_1_6_port, SUMB_1_5_port, SUMB_1_4_port, SUMB_1_3_port, SUMB_1_2_port
      , SUMB_1_1_port, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15
      , n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, 
      n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44
      , n45, n46, n47, n48, n_1081, n_1082, n_1083, n_1084, n_1085, n_1086, 
      n_1087, n_1088, n_1089, n_1090, n_1091, n_1092, n_1093, n_1094, n_1095 : 
      std_logic;

begin
   
   S14_15_0 : FAX1 port map( A => A(15), B => B(15), C => SUMB_15_0_port, YC =>
                           n_1081, YS => PRODUCT(15));
   S4_0 : FAX1 port map( A => ab_15_0_port, B => CARRYB_14_0_port, C => 
                           SUMB_14_1_port, YC => n_1082, YS => SUMB_15_0_port);
   S1_14_0 : FAX1 port map( A => ab_14_0_port, B => CARRYB_13_0_port, C => 
                           SUMB_13_1_port, YC => CARRYB_14_0_port, YS => 
                           PRODUCT(14));
   S2_14_1 : FAX1 port map( A => ab_14_1_port, B => CARRYB_13_1_port, C => 
                           SUMB_13_2_port, YC => n_1083, YS => SUMB_14_1_port);
   S1_13_0 : FAX1 port map( A => ab_13_0_port, B => CARRYB_12_0_port, C => 
                           SUMB_12_1_port, YC => CARRYB_13_0_port, YS => 
                           PRODUCT(13));
   S2_13_1 : FAX1 port map( A => ab_13_1_port, B => CARRYB_12_1_port, C => 
                           SUMB_12_2_port, YC => CARRYB_13_1_port, YS => 
                           SUMB_13_1_port);
   S2_13_2 : FAX1 port map( A => ab_13_2_port, B => CARRYB_12_2_port, C => 
                           SUMB_12_3_port, YC => n_1084, YS => SUMB_13_2_port);
   S1_12_0 : FAX1 port map( A => ab_12_0_port, B => CARRYB_11_0_port, C => 
                           SUMB_11_1_port, YC => CARRYB_12_0_port, YS => 
                           PRODUCT(12));
   S2_12_1 : FAX1 port map( A => ab_12_1_port, B => CARRYB_11_1_port, C => 
                           SUMB_11_2_port, YC => CARRYB_12_1_port, YS => 
                           SUMB_12_1_port);
   S2_12_2 : FAX1 port map( A => ab_12_2_port, B => CARRYB_11_2_port, C => 
                           SUMB_11_3_port, YC => CARRYB_12_2_port, YS => 
                           SUMB_12_2_port);
   S2_12_3 : FAX1 port map( A => ab_12_3_port, B => CARRYB_11_3_port, C => 
                           SUMB_11_4_port, YC => n_1085, YS => SUMB_12_3_port);
   S1_11_0 : FAX1 port map( A => ab_11_0_port, B => CARRYB_10_0_port, C => 
                           SUMB_10_1_port, YC => CARRYB_11_0_port, YS => 
                           PRODUCT(11));
   S2_11_1 : FAX1 port map( A => ab_11_1_port, B => CARRYB_10_1_port, C => 
                           SUMB_10_2_port, YC => CARRYB_11_1_port, YS => 
                           SUMB_11_1_port);
   S2_11_2 : FAX1 port map( A => ab_11_2_port, B => CARRYB_10_2_port, C => 
                           SUMB_10_3_port, YC => CARRYB_11_2_port, YS => 
                           SUMB_11_2_port);
   S2_11_3 : FAX1 port map( A => ab_11_3_port, B => CARRYB_10_3_port, C => 
                           SUMB_10_4_port, YC => CARRYB_11_3_port, YS => 
                           SUMB_11_3_port);
   S2_11_4 : FAX1 port map( A => ab_11_4_port, B => CARRYB_10_4_port, C => 
                           SUMB_10_5_port, YC => n_1086, YS => SUMB_11_4_port);
   S1_10_0 : FAX1 port map( A => ab_10_0_port, B => CARRYB_9_0_port, C => 
                           SUMB_9_1_port, YC => CARRYB_10_0_port, YS => 
                           PRODUCT(10));
   S2_10_1 : FAX1 port map( A => ab_10_1_port, B => CARRYB_9_1_port, C => 
                           SUMB_9_2_port, YC => CARRYB_10_1_port, YS => 
                           SUMB_10_1_port);
   S2_10_2 : FAX1 port map( A => ab_10_2_port, B => CARRYB_9_2_port, C => 
                           SUMB_9_3_port, YC => CARRYB_10_2_port, YS => 
                           SUMB_10_2_port);
   S2_10_3 : FAX1 port map( A => ab_10_3_port, B => CARRYB_9_3_port, C => 
                           SUMB_9_4_port, YC => CARRYB_10_3_port, YS => 
                           SUMB_10_3_port);
   S2_10_4 : FAX1 port map( A => ab_10_4_port, B => CARRYB_9_4_port, C => 
                           SUMB_9_5_port, YC => CARRYB_10_4_port, YS => 
                           SUMB_10_4_port);
   S2_10_5 : FAX1 port map( A => ab_10_5_port, B => CARRYB_9_5_port, C => 
                           SUMB_9_6_port, YC => n_1087, YS => SUMB_10_5_port);
   S1_9_0 : FAX1 port map( A => ab_9_0_port, B => CARRYB_8_0_port, C => 
                           SUMB_8_1_port, YC => CARRYB_9_0_port, YS => 
                           PRODUCT(9));
   S2_9_1 : FAX1 port map( A => ab_9_1_port, B => CARRYB_8_1_port, C => 
                           SUMB_8_2_port, YC => CARRYB_9_1_port, YS => 
                           SUMB_9_1_port);
   S2_9_2 : FAX1 port map( A => ab_9_2_port, B => CARRYB_8_2_port, C => 
                           SUMB_8_3_port, YC => CARRYB_9_2_port, YS => 
                           SUMB_9_2_port);
   S2_9_3 : FAX1 port map( A => ab_9_3_port, B => CARRYB_8_3_port, C => 
                           SUMB_8_4_port, YC => CARRYB_9_3_port, YS => 
                           SUMB_9_3_port);
   S2_9_4 : FAX1 port map( A => ab_9_4_port, B => CARRYB_8_4_port, C => 
                           SUMB_8_5_port, YC => CARRYB_9_4_port, YS => 
                           SUMB_9_4_port);
   S2_9_5 : FAX1 port map( A => ab_9_5_port, B => CARRYB_8_5_port, C => 
                           SUMB_8_6_port, YC => CARRYB_9_5_port, YS => 
                           SUMB_9_5_port);
   S2_9_6 : FAX1 port map( A => ab_9_6_port, B => CARRYB_8_6_port, C => 
                           SUMB_8_7_port, YC => n_1088, YS => SUMB_9_6_port);
   S1_8_0 : FAX1 port map( A => ab_8_0_port, B => CARRYB_7_0_port, C => 
                           SUMB_7_1_port, YC => CARRYB_8_0_port, YS => 
                           PRODUCT(8));
   S2_8_1 : FAX1 port map( A => ab_8_1_port, B => CARRYB_7_1_port, C => 
                           SUMB_7_2_port, YC => CARRYB_8_1_port, YS => 
                           SUMB_8_1_port);
   S2_8_2 : FAX1 port map( A => ab_8_2_port, B => CARRYB_7_2_port, C => 
                           SUMB_7_3_port, YC => CARRYB_8_2_port, YS => 
                           SUMB_8_2_port);
   S2_8_3 : FAX1 port map( A => ab_8_3_port, B => CARRYB_7_3_port, C => 
                           SUMB_7_4_port, YC => CARRYB_8_3_port, YS => 
                           SUMB_8_3_port);
   S2_8_4 : FAX1 port map( A => ab_8_4_port, B => CARRYB_7_4_port, C => 
                           SUMB_7_5_port, YC => CARRYB_8_4_port, YS => 
                           SUMB_8_4_port);
   S2_8_5 : FAX1 port map( A => ab_8_5_port, B => CARRYB_7_5_port, C => 
                           SUMB_7_6_port, YC => CARRYB_8_5_port, YS => 
                           SUMB_8_5_port);
   S2_8_6 : FAX1 port map( A => ab_8_6_port, B => CARRYB_7_6_port, C => 
                           SUMB_7_7_port, YC => CARRYB_8_6_port, YS => 
                           SUMB_8_6_port);
   S2_8_7 : FAX1 port map( A => ab_8_7_port, B => CARRYB_7_7_port, C => 
                           SUMB_7_8_port, YC => n_1089, YS => SUMB_8_7_port);
   S1_7_0 : FAX1 port map( A => ab_7_0_port, B => CARRYB_6_0_port, C => 
                           SUMB_6_1_port, YC => CARRYB_7_0_port, YS => 
                           PRODUCT(7));
   S2_7_1 : FAX1 port map( A => ab_7_1_port, B => CARRYB_6_1_port, C => 
                           SUMB_6_2_port, YC => CARRYB_7_1_port, YS => 
                           SUMB_7_1_port);
   S2_7_2 : FAX1 port map( A => ab_7_2_port, B => CARRYB_6_2_port, C => 
                           SUMB_6_3_port, YC => CARRYB_7_2_port, YS => 
                           SUMB_7_2_port);
   S2_7_3 : FAX1 port map( A => ab_7_3_port, B => CARRYB_6_3_port, C => 
                           SUMB_6_4_port, YC => CARRYB_7_3_port, YS => 
                           SUMB_7_3_port);
   S2_7_4 : FAX1 port map( A => ab_7_4_port, B => CARRYB_6_4_port, C => 
                           SUMB_6_5_port, YC => CARRYB_7_4_port, YS => 
                           SUMB_7_4_port);
   S2_7_5 : FAX1 port map( A => ab_7_5_port, B => CARRYB_6_5_port, C => 
                           SUMB_6_6_port, YC => CARRYB_7_5_port, YS => 
                           SUMB_7_5_port);
   S2_7_6 : FAX1 port map( A => ab_7_6_port, B => CARRYB_6_6_port, C => 
                           SUMB_6_7_port, YC => CARRYB_7_6_port, YS => 
                           SUMB_7_6_port);
   S2_7_7 : FAX1 port map( A => ab_7_7_port, B => CARRYB_6_7_port, C => 
                           SUMB_6_8_port, YC => CARRYB_7_7_port, YS => 
                           SUMB_7_7_port);
   S2_7_8 : FAX1 port map( A => ab_7_8_port, B => CARRYB_6_8_port, C => 
                           SUMB_6_9_port, YC => n_1090, YS => SUMB_7_8_port);
   S1_6_0 : FAX1 port map( A => ab_6_0_port, B => CARRYB_5_0_port, C => 
                           SUMB_5_1_port, YC => CARRYB_6_0_port, YS => 
                           PRODUCT(6));
   S2_6_1 : FAX1 port map( A => ab_6_1_port, B => CARRYB_5_1_port, C => 
                           SUMB_5_2_port, YC => CARRYB_6_1_port, YS => 
                           SUMB_6_1_port);
   S2_6_2 : FAX1 port map( A => ab_6_2_port, B => CARRYB_5_2_port, C => 
                           SUMB_5_3_port, YC => CARRYB_6_2_port, YS => 
                           SUMB_6_2_port);
   S2_6_3 : FAX1 port map( A => ab_6_3_port, B => CARRYB_5_3_port, C => 
                           SUMB_5_4_port, YC => CARRYB_6_3_port, YS => 
                           SUMB_6_3_port);
   S2_6_4 : FAX1 port map( A => ab_6_4_port, B => CARRYB_5_4_port, C => 
                           SUMB_5_5_port, YC => CARRYB_6_4_port, YS => 
                           SUMB_6_4_port);
   S2_6_5 : FAX1 port map( A => ab_6_5_port, B => CARRYB_5_5_port, C => 
                           SUMB_5_6_port, YC => CARRYB_6_5_port, YS => 
                           SUMB_6_5_port);
   S2_6_6 : FAX1 port map( A => ab_6_6_port, B => CARRYB_5_6_port, C => 
                           SUMB_5_7_port, YC => CARRYB_6_6_port, YS => 
                           SUMB_6_6_port);
   S2_6_7 : FAX1 port map( A => ab_6_7_port, B => CARRYB_5_7_port, C => 
                           SUMB_5_8_port, YC => CARRYB_6_7_port, YS => 
                           SUMB_6_7_port);
   S2_6_8 : FAX1 port map( A => ab_6_8_port, B => CARRYB_5_8_port, C => 
                           SUMB_5_9_port, YC => CARRYB_6_8_port, YS => 
                           SUMB_6_8_port);
   S2_6_9 : FAX1 port map( A => ab_6_9_port, B => CARRYB_5_9_port, C => 
                           SUMB_5_10_port, YC => n_1091, YS => SUMB_6_9_port);
   S1_5_0 : FAX1 port map( A => ab_5_0_port, B => CARRYB_4_0_port, C => 
                           SUMB_4_1_port, YC => CARRYB_5_0_port, YS => 
                           PRODUCT(5));
   S2_5_1 : FAX1 port map( A => ab_5_1_port, B => CARRYB_4_1_port, C => 
                           SUMB_4_2_port, YC => CARRYB_5_1_port, YS => 
                           SUMB_5_1_port);
   S2_5_2 : FAX1 port map( A => ab_5_2_port, B => CARRYB_4_2_port, C => 
                           SUMB_4_3_port, YC => CARRYB_5_2_port, YS => 
                           SUMB_5_2_port);
   S2_5_3 : FAX1 port map( A => ab_5_3_port, B => CARRYB_4_3_port, C => 
                           SUMB_4_4_port, YC => CARRYB_5_3_port, YS => 
                           SUMB_5_3_port);
   S2_5_4 : FAX1 port map( A => ab_5_4_port, B => CARRYB_4_4_port, C => 
                           SUMB_4_5_port, YC => CARRYB_5_4_port, YS => 
                           SUMB_5_4_port);
   S2_5_5 : FAX1 port map( A => ab_5_5_port, B => CARRYB_4_5_port, C => 
                           SUMB_4_6_port, YC => CARRYB_5_5_port, YS => 
                           SUMB_5_5_port);
   S2_5_6 : FAX1 port map( A => ab_5_6_port, B => CARRYB_4_6_port, C => 
                           SUMB_4_7_port, YC => CARRYB_5_6_port, YS => 
                           SUMB_5_6_port);
   S2_5_7 : FAX1 port map( A => ab_5_7_port, B => CARRYB_4_7_port, C => 
                           SUMB_4_8_port, YC => CARRYB_5_7_port, YS => 
                           SUMB_5_7_port);
   S2_5_8 : FAX1 port map( A => ab_5_8_port, B => CARRYB_4_8_port, C => 
                           SUMB_4_9_port, YC => CARRYB_5_8_port, YS => 
                           SUMB_5_8_port);
   S2_5_9 : FAX1 port map( A => ab_5_9_port, B => CARRYB_4_9_port, C => 
                           SUMB_4_10_port, YC => CARRYB_5_9_port, YS => 
                           SUMB_5_9_port);
   S2_5_10 : FAX1 port map( A => ab_5_10_port, B => CARRYB_4_10_port, C => 
                           SUMB_4_11_port, YC => n_1092, YS => SUMB_5_10_port);
   S1_4_0 : FAX1 port map( A => ab_4_0_port, B => CARRYB_3_0_port, C => 
                           SUMB_3_1_port, YC => CARRYB_4_0_port, YS => 
                           PRODUCT(4));
   S2_4_1 : FAX1 port map( A => ab_4_1_port, B => CARRYB_3_1_port, C => 
                           SUMB_3_2_port, YC => CARRYB_4_1_port, YS => 
                           SUMB_4_1_port);
   S2_4_2 : FAX1 port map( A => ab_4_2_port, B => CARRYB_3_2_port, C => 
                           SUMB_3_3_port, YC => CARRYB_4_2_port, YS => 
                           SUMB_4_2_port);
   S2_4_3 : FAX1 port map( A => ab_4_3_port, B => CARRYB_3_3_port, C => 
                           SUMB_3_4_port, YC => CARRYB_4_3_port, YS => 
                           SUMB_4_3_port);
   S2_4_4 : FAX1 port map( A => ab_4_4_port, B => CARRYB_3_4_port, C => 
                           SUMB_3_5_port, YC => CARRYB_4_4_port, YS => 
                           SUMB_4_4_port);
   S2_4_5 : FAX1 port map( A => ab_4_5_port, B => CARRYB_3_5_port, C => 
                           SUMB_3_6_port, YC => CARRYB_4_5_port, YS => 
                           SUMB_4_5_port);
   S2_4_6 : FAX1 port map( A => ab_4_6_port, B => CARRYB_3_6_port, C => 
                           SUMB_3_7_port, YC => CARRYB_4_6_port, YS => 
                           SUMB_4_6_port);
   S2_4_7 : FAX1 port map( A => ab_4_7_port, B => CARRYB_3_7_port, C => 
                           SUMB_3_8_port, YC => CARRYB_4_7_port, YS => 
                           SUMB_4_7_port);
   S2_4_8 : FAX1 port map( A => ab_4_8_port, B => CARRYB_3_8_port, C => 
                           SUMB_3_9_port, YC => CARRYB_4_8_port, YS => 
                           SUMB_4_8_port);
   S2_4_9 : FAX1 port map( A => ab_4_9_port, B => CARRYB_3_9_port, C => 
                           SUMB_3_10_port, YC => CARRYB_4_9_port, YS => 
                           SUMB_4_9_port);
   S2_4_10 : FAX1 port map( A => ab_4_10_port, B => CARRYB_3_10_port, C => 
                           SUMB_3_11_port, YC => CARRYB_4_10_port, YS => 
                           SUMB_4_10_port);
   S2_4_11 : FAX1 port map( A => ab_4_11_port, B => CARRYB_3_11_port, C => 
                           SUMB_3_12_port, YC => n_1093, YS => SUMB_4_11_port);
   S1_3_0 : FAX1 port map( A => ab_3_0_port, B => CARRYB_2_0_port, C => 
                           SUMB_2_1_port, YC => CARRYB_3_0_port, YS => 
                           PRODUCT(3));
   S2_3_1 : FAX1 port map( A => ab_3_1_port, B => CARRYB_2_1_port, C => 
                           SUMB_2_2_port, YC => CARRYB_3_1_port, YS => 
                           SUMB_3_1_port);
   S2_3_2 : FAX1 port map( A => ab_3_2_port, B => CARRYB_2_2_port, C => 
                           SUMB_2_3_port, YC => CARRYB_3_2_port, YS => 
                           SUMB_3_2_port);
   S2_3_3 : FAX1 port map( A => ab_3_3_port, B => CARRYB_2_3_port, C => 
                           SUMB_2_4_port, YC => CARRYB_3_3_port, YS => 
                           SUMB_3_3_port);
   S2_3_4 : FAX1 port map( A => ab_3_4_port, B => CARRYB_2_4_port, C => 
                           SUMB_2_5_port, YC => CARRYB_3_4_port, YS => 
                           SUMB_3_4_port);
   S2_3_5 : FAX1 port map( A => ab_3_5_port, B => CARRYB_2_5_port, C => 
                           SUMB_2_6_port, YC => CARRYB_3_5_port, YS => 
                           SUMB_3_5_port);
   S2_3_6 : FAX1 port map( A => ab_3_6_port, B => CARRYB_2_6_port, C => 
                           SUMB_2_7_port, YC => CARRYB_3_6_port, YS => 
                           SUMB_3_6_port);
   S2_3_7 : FAX1 port map( A => ab_3_7_port, B => CARRYB_2_7_port, C => 
                           SUMB_2_8_port, YC => CARRYB_3_7_port, YS => 
                           SUMB_3_7_port);
   S2_3_8 : FAX1 port map( A => ab_3_8_port, B => CARRYB_2_8_port, C => 
                           SUMB_2_9_port, YC => CARRYB_3_8_port, YS => 
                           SUMB_3_8_port);
   S2_3_9 : FAX1 port map( A => ab_3_9_port, B => CARRYB_2_9_port, C => 
                           SUMB_2_10_port, YC => CARRYB_3_9_port, YS => 
                           SUMB_3_9_port);
   S2_3_10 : FAX1 port map( A => ab_3_10_port, B => CARRYB_2_10_port, C => 
                           SUMB_2_11_port, YC => CARRYB_3_10_port, YS => 
                           SUMB_3_10_port);
   S2_3_11 : FAX1 port map( A => ab_3_11_port, B => CARRYB_2_11_port, C => 
                           SUMB_2_12_port, YC => CARRYB_3_11_port, YS => 
                           SUMB_3_11_port);
   S2_3_12 : FAX1 port map( A => ab_3_12_port, B => CARRYB_2_12_port, C => 
                           SUMB_2_13_port, YC => n_1094, YS => SUMB_3_12_port);
   S1_2_0 : FAX1 port map( A => ab_2_0_port, B => n3, C => SUMB_1_1_port, YC =>
                           CARRYB_2_0_port, YS => PRODUCT(2));
   S2_2_1 : FAX1 port map( A => ab_2_1_port, B => n4, C => SUMB_1_2_port, YC =>
                           CARRYB_2_1_port, YS => SUMB_2_1_port);
   S2_2_2 : FAX1 port map( A => ab_2_2_port, B => n5, C => SUMB_1_3_port, YC =>
                           CARRYB_2_2_port, YS => SUMB_2_2_port);
   S2_2_3 : FAX1 port map( A => ab_2_3_port, B => n6, C => SUMB_1_4_port, YC =>
                           CARRYB_2_3_port, YS => SUMB_2_3_port);
   S2_2_4 : FAX1 port map( A => ab_2_4_port, B => n7, C => SUMB_1_5_port, YC =>
                           CARRYB_2_4_port, YS => SUMB_2_4_port);
   S2_2_5 : FAX1 port map( A => ab_2_5_port, B => n8, C => SUMB_1_6_port, YC =>
                           CARRYB_2_5_port, YS => SUMB_2_5_port);
   S2_2_6 : FAX1 port map( A => ab_2_6_port, B => n9, C => SUMB_1_7_port, YC =>
                           CARRYB_2_6_port, YS => SUMB_2_6_port);
   S2_2_7 : FAX1 port map( A => ab_2_7_port, B => n10, C => SUMB_1_8_port, YC 
                           => CARRYB_2_7_port, YS => SUMB_2_7_port);
   S2_2_8 : FAX1 port map( A => ab_2_8_port, B => n11, C => SUMB_1_9_port, YC 
                           => CARRYB_2_8_port, YS => SUMB_2_8_port);
   S2_2_9 : FAX1 port map( A => ab_2_9_port, B => n16, C => SUMB_1_10_port, YC 
                           => CARRYB_2_9_port, YS => SUMB_2_9_port);
   S2_2_10 : FAX1 port map( A => ab_2_10_port, B => n15, C => SUMB_1_11_port, 
                           YC => CARRYB_2_10_port, YS => SUMB_2_10_port);
   S2_2_11 : FAX1 port map( A => ab_2_11_port, B => n14, C => SUMB_1_12_port, 
                           YC => CARRYB_2_11_port, YS => SUMB_2_11_port);
   S2_2_12 : FAX1 port map( A => ab_2_12_port, B => n13, C => SUMB_1_13_port, 
                           YC => CARRYB_2_12_port, YS => SUMB_2_12_port);
   S2_2_13 : FAX1 port map( A => ab_2_13_port, B => n12, C => SUMB_1_14_port, 
                           YC => n_1095, YS => SUMB_2_13_port);
   U2 : AND2X2 port map( A => ab_0_1_port, B => ab_1_0_port, Y => n3);
   U3 : AND2X2 port map( A => ab_0_2_port, B => ab_1_1_port, Y => n4);
   U4 : AND2X2 port map( A => ab_0_3_port, B => ab_1_2_port, Y => n5);
   U5 : AND2X2 port map( A => ab_0_4_port, B => ab_1_3_port, Y => n6);
   U6 : AND2X2 port map( A => ab_0_5_port, B => ab_1_4_port, Y => n7);
   U7 : AND2X2 port map( A => ab_0_6_port, B => ab_1_5_port, Y => n8);
   U8 : AND2X2 port map( A => ab_0_7_port, B => ab_1_6_port, Y => n9);
   U9 : AND2X2 port map( A => ab_0_8_port, B => ab_1_7_port, Y => n10);
   U10 : AND2X2 port map( A => ab_0_9_port, B => ab_1_8_port, Y => n11);
   U11 : AND2X2 port map( A => ab_0_14_port, B => ab_1_13_port, Y => n12);
   U12 : AND2X2 port map( A => ab_0_13_port, B => ab_1_12_port, Y => n13);
   U13 : AND2X2 port map( A => ab_0_12_port, B => ab_1_11_port, Y => n14);
   U14 : AND2X2 port map( A => ab_0_11_port, B => ab_1_10_port, Y => n15);
   U15 : AND2X2 port map( A => ab_0_10_port, B => ab_1_9_port, Y => n16);
   U16 : INVX2 port map( A => A(0), Y => n48);
   U17 : INVX2 port map( A => A(1), Y => n47);
   U18 : INVX2 port map( A => B(0), Y => n32);
   U19 : INVX2 port map( A => B(1), Y => n31);
   U20 : INVX2 port map( A => A(2), Y => n46);
   U21 : INVX2 port map( A => B(2), Y => n30);
   U22 : INVX2 port map( A => A(3), Y => n45);
   U23 : INVX2 port map( A => B(3), Y => n29);
   U24 : INVX2 port map( A => A(4), Y => n44);
   U25 : INVX2 port map( A => B(4), Y => n28);
   U26 : INVX2 port map( A => A(5), Y => n43);
   U27 : INVX2 port map( A => B(5), Y => n27);
   U28 : INVX2 port map( A => A(6), Y => n42);
   U29 : INVX2 port map( A => B(6), Y => n26);
   U30 : INVX2 port map( A => A(7), Y => n41);
   U31 : INVX2 port map( A => B(7), Y => n25);
   U32 : XOR2X1 port map( A => ab_1_0_port, B => ab_0_1_port, Y => PRODUCT(1));
   U33 : XOR2X1 port map( A => ab_1_1_port, B => ab_0_2_port, Y => 
                           SUMB_1_1_port);
   U34 : XOR2X1 port map( A => ab_1_2_port, B => ab_0_3_port, Y => 
                           SUMB_1_2_port);
   U35 : XOR2X1 port map( A => ab_1_3_port, B => ab_0_4_port, Y => 
                           SUMB_1_3_port);
   U36 : XOR2X1 port map( A => ab_1_4_port, B => ab_0_5_port, Y => 
                           SUMB_1_4_port);
   U37 : XOR2X1 port map( A => ab_1_5_port, B => ab_0_6_port, Y => 
                           SUMB_1_5_port);
   U38 : XOR2X1 port map( A => ab_1_6_port, B => ab_0_7_port, Y => 
                           SUMB_1_6_port);
   U39 : XOR2X1 port map( A => ab_1_7_port, B => ab_0_8_port, Y => 
                           SUMB_1_7_port);
   U40 : XOR2X1 port map( A => ab_1_8_port, B => ab_0_9_port, Y => 
                           SUMB_1_8_port);
   U41 : XOR2X1 port map( A => ab_1_9_port, B => ab_0_10_port, Y => 
                           SUMB_1_9_port);
   U42 : XOR2X1 port map( A => ab_1_10_port, B => ab_0_11_port, Y => 
                           SUMB_1_10_port);
   U43 : XOR2X1 port map( A => ab_1_11_port, B => ab_0_12_port, Y => 
                           SUMB_1_11_port);
   U44 : XOR2X1 port map( A => ab_1_12_port, B => ab_0_13_port, Y => 
                           SUMB_1_12_port);
   U45 : XOR2X1 port map( A => ab_1_13_port, B => ab_0_14_port, Y => 
                           SUMB_1_13_port);
   U46 : XOR2X1 port map( A => ab_1_14_port, B => ab_0_15_port, Y => 
                           SUMB_1_14_port);
   U47 : INVX2 port map( A => B(15), Y => n17);
   U48 : INVX2 port map( A => B(14), Y => n18);
   U49 : INVX2 port map( A => B(13), Y => n19);
   U50 : INVX2 port map( A => B(12), Y => n20);
   U51 : INVX2 port map( A => B(11), Y => n21);
   U52 : INVX2 port map( A => B(10), Y => n22);
   U53 : INVX2 port map( A => B(9), Y => n23);
   U54 : INVX2 port map( A => B(8), Y => n24);
   U55 : INVX2 port map( A => A(15), Y => n33);
   U56 : INVX2 port map( A => A(14), Y => n34);
   U57 : INVX2 port map( A => A(13), Y => n35);
   U58 : INVX2 port map( A => A(12), Y => n36);
   U59 : INVX2 port map( A => A(11), Y => n37);
   U60 : INVX2 port map( A => A(10), Y => n38);
   U61 : INVX2 port map( A => A(9), Y => n39);
   U62 : INVX2 port map( A => A(8), Y => n40);
   U63 : NOR2X1 port map( A => n39, B => n26, Y => ab_9_6_port);
   U64 : NOR2X1 port map( A => n39, B => n27, Y => ab_9_5_port);
   U65 : NOR2X1 port map( A => n39, B => n28, Y => ab_9_4_port);
   U66 : NOR2X1 port map( A => n39, B => n29, Y => ab_9_3_port);
   U67 : NOR2X1 port map( A => n39, B => n30, Y => ab_9_2_port);
   U68 : NOR2X1 port map( A => n39, B => n31, Y => ab_9_1_port);
   U69 : NOR2X1 port map( A => n39, B => n32, Y => ab_9_0_port);
   U70 : NOR2X1 port map( A => n25, B => n40, Y => ab_8_7_port);
   U71 : NOR2X1 port map( A => n26, B => n40, Y => ab_8_6_port);
   U72 : NOR2X1 port map( A => n27, B => n40, Y => ab_8_5_port);
   U73 : NOR2X1 port map( A => n28, B => n40, Y => ab_8_4_port);
   U74 : NOR2X1 port map( A => n29, B => n40, Y => ab_8_3_port);
   U75 : NOR2X1 port map( A => n30, B => n40, Y => ab_8_2_port);
   U76 : NOR2X1 port map( A => n31, B => n40, Y => ab_8_1_port);
   U77 : NOR2X1 port map( A => n32, B => n40, Y => ab_8_0_port);
   U78 : NOR2X1 port map( A => n24, B => n41, Y => ab_7_8_port);
   U79 : NOR2X1 port map( A => n25, B => n41, Y => ab_7_7_port);
   U80 : NOR2X1 port map( A => n26, B => n41, Y => ab_7_6_port);
   U81 : NOR2X1 port map( A => n27, B => n41, Y => ab_7_5_port);
   U82 : NOR2X1 port map( A => n28, B => n41, Y => ab_7_4_port);
   U83 : NOR2X1 port map( A => n29, B => n41, Y => ab_7_3_port);
   U84 : NOR2X1 port map( A => n30, B => n41, Y => ab_7_2_port);
   U85 : NOR2X1 port map( A => n31, B => n41, Y => ab_7_1_port);
   U86 : NOR2X1 port map( A => n32, B => n41, Y => ab_7_0_port);
   U87 : NOR2X1 port map( A => n23, B => n42, Y => ab_6_9_port);
   U88 : NOR2X1 port map( A => n24, B => n42, Y => ab_6_8_port);
   U89 : NOR2X1 port map( A => n25, B => n42, Y => ab_6_7_port);
   U90 : NOR2X1 port map( A => n26, B => n42, Y => ab_6_6_port);
   U91 : NOR2X1 port map( A => n27, B => n42, Y => ab_6_5_port);
   U92 : NOR2X1 port map( A => n28, B => n42, Y => ab_6_4_port);
   U93 : NOR2X1 port map( A => n29, B => n42, Y => ab_6_3_port);
   U94 : NOR2X1 port map( A => n30, B => n42, Y => ab_6_2_port);
   U95 : NOR2X1 port map( A => n31, B => n42, Y => ab_6_1_port);
   U96 : NOR2X1 port map( A => n32, B => n42, Y => ab_6_0_port);
   U97 : NOR2X1 port map( A => n23, B => n43, Y => ab_5_9_port);
   U98 : NOR2X1 port map( A => n24, B => n43, Y => ab_5_8_port);
   U99 : NOR2X1 port map( A => n25, B => n43, Y => ab_5_7_port);
   U100 : NOR2X1 port map( A => n26, B => n43, Y => ab_5_6_port);
   U101 : NOR2X1 port map( A => n27, B => n43, Y => ab_5_5_port);
   U102 : NOR2X1 port map( A => n28, B => n43, Y => ab_5_4_port);
   U103 : NOR2X1 port map( A => n29, B => n43, Y => ab_5_3_port);
   U104 : NOR2X1 port map( A => n30, B => n43, Y => ab_5_2_port);
   U105 : NOR2X1 port map( A => n31, B => n43, Y => ab_5_1_port);
   U106 : NOR2X1 port map( A => n22, B => n43, Y => ab_5_10_port);
   U107 : NOR2X1 port map( A => n32, B => n43, Y => ab_5_0_port);
   U108 : NOR2X1 port map( A => n23, B => n44, Y => ab_4_9_port);
   U109 : NOR2X1 port map( A => n24, B => n44, Y => ab_4_8_port);
   U110 : NOR2X1 port map( A => n25, B => n44, Y => ab_4_7_port);
   U111 : NOR2X1 port map( A => n26, B => n44, Y => ab_4_6_port);
   U112 : NOR2X1 port map( A => n27, B => n44, Y => ab_4_5_port);
   U113 : NOR2X1 port map( A => n28, B => n44, Y => ab_4_4_port);
   U114 : NOR2X1 port map( A => n29, B => n44, Y => ab_4_3_port);
   U115 : NOR2X1 port map( A => n30, B => n44, Y => ab_4_2_port);
   U116 : NOR2X1 port map( A => n31, B => n44, Y => ab_4_1_port);
   U117 : NOR2X1 port map( A => n21, B => n44, Y => ab_4_11_port);
   U118 : NOR2X1 port map( A => n22, B => n44, Y => ab_4_10_port);
   U119 : NOR2X1 port map( A => n32, B => n44, Y => ab_4_0_port);
   U120 : NOR2X1 port map( A => n23, B => n45, Y => ab_3_9_port);
   U121 : NOR2X1 port map( A => n24, B => n45, Y => ab_3_8_port);
   U122 : NOR2X1 port map( A => n25, B => n45, Y => ab_3_7_port);
   U123 : NOR2X1 port map( A => n26, B => n45, Y => ab_3_6_port);
   U124 : NOR2X1 port map( A => n27, B => n45, Y => ab_3_5_port);
   U125 : NOR2X1 port map( A => n28, B => n45, Y => ab_3_4_port);
   U126 : NOR2X1 port map( A => n29, B => n45, Y => ab_3_3_port);
   U127 : NOR2X1 port map( A => n30, B => n45, Y => ab_3_2_port);
   U128 : NOR2X1 port map( A => n31, B => n45, Y => ab_3_1_port);
   U129 : NOR2X1 port map( A => n20, B => n45, Y => ab_3_12_port);
   U130 : NOR2X1 port map( A => n21, B => n45, Y => ab_3_11_port);
   U131 : NOR2X1 port map( A => n22, B => n45, Y => ab_3_10_port);
   U132 : NOR2X1 port map( A => n32, B => n45, Y => ab_3_0_port);
   U133 : NOR2X1 port map( A => n23, B => n46, Y => ab_2_9_port);
   U134 : NOR2X1 port map( A => n24, B => n46, Y => ab_2_8_port);
   U135 : NOR2X1 port map( A => n25, B => n46, Y => ab_2_7_port);
   U136 : NOR2X1 port map( A => n26, B => n46, Y => ab_2_6_port);
   U137 : NOR2X1 port map( A => n27, B => n46, Y => ab_2_5_port);
   U138 : NOR2X1 port map( A => n28, B => n46, Y => ab_2_4_port);
   U139 : NOR2X1 port map( A => n29, B => n46, Y => ab_2_3_port);
   U140 : NOR2X1 port map( A => n30, B => n46, Y => ab_2_2_port);
   U141 : NOR2X1 port map( A => n31, B => n46, Y => ab_2_1_port);
   U142 : NOR2X1 port map( A => n19, B => n46, Y => ab_2_13_port);
   U143 : NOR2X1 port map( A => n20, B => n46, Y => ab_2_12_port);
   U144 : NOR2X1 port map( A => n21, B => n46, Y => ab_2_11_port);
   U145 : NOR2X1 port map( A => n22, B => n46, Y => ab_2_10_port);
   U146 : NOR2X1 port map( A => n32, B => n46, Y => ab_2_0_port);
   U147 : NOR2X1 port map( A => n23, B => n47, Y => ab_1_9_port);
   U148 : NOR2X1 port map( A => n24, B => n47, Y => ab_1_8_port);
   U149 : NOR2X1 port map( A => n25, B => n47, Y => ab_1_7_port);
   U150 : NOR2X1 port map( A => n26, B => n47, Y => ab_1_6_port);
   U151 : NOR2X1 port map( A => n27, B => n47, Y => ab_1_5_port);
   U152 : NOR2X1 port map( A => n28, B => n47, Y => ab_1_4_port);
   U153 : NOR2X1 port map( A => n29, B => n47, Y => ab_1_3_port);
   U154 : NOR2X1 port map( A => n30, B => n47, Y => ab_1_2_port);
   U155 : NOR2X1 port map( A => n31, B => n47, Y => ab_1_1_port);
   U156 : NOR2X1 port map( A => n18, B => n47, Y => ab_1_14_port);
   U157 : NOR2X1 port map( A => n19, B => n47, Y => ab_1_13_port);
   U158 : NOR2X1 port map( A => n20, B => n47, Y => ab_1_12_port);
   U159 : NOR2X1 port map( A => n21, B => n47, Y => ab_1_11_port);
   U160 : NOR2X1 port map( A => n22, B => n47, Y => ab_1_10_port);
   U161 : NOR2X1 port map( A => n32, B => n47, Y => ab_1_0_port);
   U162 : NOR2X1 port map( A => B(0), B => n33, Y => ab_15_0_port);
   U163 : NOR2X1 port map( A => n31, B => n34, Y => ab_14_1_port);
   U164 : NOR2X1 port map( A => n32, B => n34, Y => ab_14_0_port);
   U165 : NOR2X1 port map( A => n30, B => n35, Y => ab_13_2_port);
   U166 : NOR2X1 port map( A => n31, B => n35, Y => ab_13_1_port);
   U167 : NOR2X1 port map( A => n32, B => n35, Y => ab_13_0_port);
   U168 : NOR2X1 port map( A => n29, B => n36, Y => ab_12_3_port);
   U169 : NOR2X1 port map( A => n30, B => n36, Y => ab_12_2_port);
   U170 : NOR2X1 port map( A => n31, B => n36, Y => ab_12_1_port);
   U171 : NOR2X1 port map( A => n32, B => n36, Y => ab_12_0_port);
   U172 : NOR2X1 port map( A => n28, B => n37, Y => ab_11_4_port);
   U173 : NOR2X1 port map( A => n29, B => n37, Y => ab_11_3_port);
   U174 : NOR2X1 port map( A => n30, B => n37, Y => ab_11_2_port);
   U175 : NOR2X1 port map( A => n31, B => n37, Y => ab_11_1_port);
   U176 : NOR2X1 port map( A => n32, B => n37, Y => ab_11_0_port);
   U177 : NOR2X1 port map( A => n27, B => n38, Y => ab_10_5_port);
   U178 : NOR2X1 port map( A => n28, B => n38, Y => ab_10_4_port);
   U179 : NOR2X1 port map( A => n29, B => n38, Y => ab_10_3_port);
   U180 : NOR2X1 port map( A => n30, B => n38, Y => ab_10_2_port);
   U181 : NOR2X1 port map( A => n31, B => n38, Y => ab_10_1_port);
   U182 : NOR2X1 port map( A => n32, B => n38, Y => ab_10_0_port);
   U183 : NOR2X1 port map( A => n23, B => n48, Y => ab_0_9_port);
   U184 : NOR2X1 port map( A => n24, B => n48, Y => ab_0_8_port);
   U185 : NOR2X1 port map( A => n25, B => n48, Y => ab_0_7_port);
   U186 : NOR2X1 port map( A => n26, B => n48, Y => ab_0_6_port);
   U187 : NOR2X1 port map( A => n27, B => n48, Y => ab_0_5_port);
   U188 : NOR2X1 port map( A => n28, B => n48, Y => ab_0_4_port);
   U189 : NOR2X1 port map( A => n29, B => n48, Y => ab_0_3_port);
   U190 : NOR2X1 port map( A => n30, B => n48, Y => ab_0_2_port);
   U191 : NOR2X1 port map( A => n31, B => n48, Y => ab_0_1_port);
   U192 : NOR2X1 port map( A => A(0), B => n17, Y => ab_0_15_port);
   U193 : NOR2X1 port map( A => n18, B => n48, Y => ab_0_14_port);
   U194 : NOR2X1 port map( A => n19, B => n48, Y => ab_0_13_port);
   U195 : NOR2X1 port map( A => n20, B => n48, Y => ab_0_12_port);
   U196 : NOR2X1 port map( A => n21, B => n48, Y => ab_0_11_port);
   U197 : NOR2X1 port map( A => n22, B => n48, Y => ab_0_10_port);
   U198 : NOR2X1 port map( A => n32, B => n48, Y => PRODUCT(0));

end SYN_csa;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_matrix_math.all;

entity matrix_math_DW01_add_2 is

   port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (15 downto 0);  CO : out std_logic);

end matrix_math_DW01_add_2;

architecture SYN_rpl of matrix_math_DW01_add_2 is

   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component FAX1
      port( A, B, C : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port, 
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port, n1,
      n2 : std_logic;

begin
   
   U1_15 : FAX1 port map( A => A(15), B => B(15), C => carry_15_port, YC => n2,
                           YS => SUM(15));
   U1_14 : FAX1 port map( A => A(14), B => B(14), C => carry_14_port, YC => 
                           carry_15_port, YS => SUM(14));
   U1_13 : FAX1 port map( A => A(13), B => B(13), C => carry_13_port, YC => 
                           carry_14_port, YS => SUM(13));
   U1_12 : FAX1 port map( A => A(12), B => B(12), C => carry_12_port, YC => 
                           carry_13_port, YS => SUM(12));
   U1_11 : FAX1 port map( A => A(11), B => B(11), C => carry_11_port, YC => 
                           carry_12_port, YS => SUM(11));
   U1_10 : FAX1 port map( A => A(10), B => B(10), C => carry_10_port, YC => 
                           carry_11_port, YS => SUM(10));
   U1_9 : FAX1 port map( A => A(9), B => B(9), C => carry_9_port, YC => 
                           carry_10_port, YS => SUM(9));
   U1_8 : FAX1 port map( A => A(8), B => B(8), C => carry_8_port, YC => 
                           carry_9_port, YS => SUM(8));
   U1_7 : FAX1 port map( A => A(7), B => B(7), C => carry_7_port, YC => 
                           carry_8_port, YS => SUM(7));
   U1_6 : FAX1 port map( A => A(6), B => B(6), C => carry_6_port, YC => 
                           carry_7_port, YS => SUM(6));
   U1_5 : FAX1 port map( A => A(5), B => B(5), C => carry_5_port, YC => 
                           carry_6_port, YS => SUM(5));
   U1_4 : FAX1 port map( A => A(4), B => B(4), C => carry_4_port, YC => 
                           carry_5_port, YS => SUM(4));
   U1_3 : FAX1 port map( A => A(3), B => B(3), C => carry_3_port, YC => 
                           carry_4_port, YS => SUM(3));
   U1_2 : FAX1 port map( A => A(2), B => B(2), C => carry_2_port, YC => 
                           carry_3_port, YS => SUM(2));
   U1_1 : FAX1 port map( A => A(1), B => B(1), C => n1, YC => carry_2_port, YS 
                           => SUM(1));
   U1 : AND2X2 port map( A => B(0), B => A(0), Y => n1);
   U2 : XOR2X1 port map( A => B(0), B => A(0), Y => SUM(0));

end SYN_rpl;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_matrix_math.all;

entity matrix_math_DW01_add_1 is

   port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (15 downto 0);  CO : out std_logic);

end matrix_math_DW01_add_1;

architecture SYN_rpl of matrix_math_DW01_add_1 is

   component XOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component AND2X2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component FAX1
      port( A, B, C : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, carry_7_port, 
      carry_6_port, carry_5_port, carry_4_port, carry_3_port, carry_2_port, n1,
      n2 : std_logic;

begin
   
   U1_15 : FAX1 port map( A => A(15), B => B(15), C => carry_15_port, YC => n2,
                           YS => SUM(15));
   U1_14 : FAX1 port map( A => A(14), B => B(14), C => carry_14_port, YC => 
                           carry_15_port, YS => SUM(14));
   U1_13 : FAX1 port map( A => A(13), B => B(13), C => carry_13_port, YC => 
                           carry_14_port, YS => SUM(13));
   U1_12 : FAX1 port map( A => A(12), B => B(12), C => carry_12_port, YC => 
                           carry_13_port, YS => SUM(12));
   U1_11 : FAX1 port map( A => A(11), B => B(11), C => carry_11_port, YC => 
                           carry_12_port, YS => SUM(11));
   U1_10 : FAX1 port map( A => A(10), B => B(10), C => carry_10_port, YC => 
                           carry_11_port, YS => SUM(10));
   U1_9 : FAX1 port map( A => A(9), B => B(9), C => carry_9_port, YC => 
                           carry_10_port, YS => SUM(9));
   U1_8 : FAX1 port map( A => A(8), B => B(8), C => carry_8_port, YC => 
                           carry_9_port, YS => SUM(8));
   U1_7 : FAX1 port map( A => A(7), B => B(7), C => carry_7_port, YC => 
                           carry_8_port, YS => SUM(7));
   U1_6 : FAX1 port map( A => A(6), B => B(6), C => carry_6_port, YC => 
                           carry_7_port, YS => SUM(6));
   U1_5 : FAX1 port map( A => A(5), B => B(5), C => carry_5_port, YC => 
                           carry_6_port, YS => SUM(5));
   U1_4 : FAX1 port map( A => A(4), B => B(4), C => carry_4_port, YC => 
                           carry_5_port, YS => SUM(4));
   U1_3 : FAX1 port map( A => A(3), B => B(3), C => carry_3_port, YC => 
                           carry_4_port, YS => SUM(3));
   U1_2 : FAX1 port map( A => A(2), B => B(2), C => carry_2_port, YC => 
                           carry_3_port, YS => SUM(2));
   U1_1 : FAX1 port map( A => A(1), B => B(1), C => n1, YC => carry_2_port, YS 
                           => SUM(1));
   U1 : AND2X2 port map( A => B(0), B => A(0), Y => n1);
   U2 : XOR2X1 port map( A => B(0), B => A(0), Y => SUM(0));

end SYN_rpl;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_matrix_math.all;

entity matrix_math_DW01_add_0 is

   port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM : 
         out std_logic_vector (15 downto 0);  CO : out std_logic);

end matrix_math_DW01_add_0;

architecture SYN_rpl of matrix_math_DW01_add_0 is

   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI22X1
      port( A, B, C, D : in std_logic;  Y : out std_logic);
   end component;
   
   component AOI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component FAX1
      port( A, B, C : in std_logic;  YC, YS : out std_logic);
   end component;
   
   signal carry_15_port, carry_14_port, carry_13_port, carry_12_port, 
      carry_11_port, carry_10_port, carry_9_port, carry_8_port, n1, n2, n3, n4,
      n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20
      , n21, n22, n23, n24, n25 : std_logic;

begin
   
   U1_15 : FAX1 port map( A => A(15), B => B(15), C => carry_15_port, YC => n25
                           , YS => SUM(15));
   U1_14 : FAX1 port map( A => A(14), B => B(14), C => carry_14_port, YC => 
                           carry_15_port, YS => SUM(14));
   U1_13 : FAX1 port map( A => A(13), B => B(13), C => carry_13_port, YC => 
                           carry_14_port, YS => SUM(13));
   U1_12 : FAX1 port map( A => A(12), B => B(12), C => carry_12_port, YC => 
                           carry_13_port, YS => SUM(12));
   U1_11 : FAX1 port map( A => A(11), B => B(11), C => carry_11_port, YC => 
                           carry_12_port, YS => SUM(11));
   U1_10 : FAX1 port map( A => A(10), B => B(10), C => carry_10_port, YC => 
                           carry_11_port, YS => SUM(10));
   U1_9 : FAX1 port map( A => A(9), B => B(9), C => carry_9_port, YC => 
                           carry_10_port, YS => SUM(9));
   U1_8 : FAX1 port map( A => A(8), B => B(8), C => carry_8_port, YC => 
                           carry_9_port, YS => SUM(8));
   U1 : INVX2 port map( A => n13, Y => n1);
   U2 : INVX2 port map( A => n14, Y => n2);
   U3 : INVX2 port map( A => n17, Y => n3);
   U4 : INVX2 port map( A => n18, Y => n4);
   U5 : INVX2 port map( A => n21, Y => n5);
   U6 : INVX2 port map( A => n22, Y => n6);
   U7 : INVX2 port map( A => n24, Y => n7);
   U8 : INVX2 port map( A => A(7), Y => n8);
   U9 : INVX2 port map( A => A(6), Y => n9);
   U10 : INVX2 port map( A => A(4), Y => n10);
   U11 : INVX2 port map( A => A(2), Y => n11);
   U12 : OAI21X1 port map( A => n1, B => n8, C => n12, Y => carry_8_port);
   U13 : OAI21X1 port map( A => A(7), B => n13, C => B(7), Y => n12);
   U14 : OAI21X1 port map( A => n14, B => n9, C => n15, Y => n13);
   U15 : OAI21X1 port map( A => A(6), B => n2, C => B(6), Y => n15);
   U16 : AOI21X1 port map( A => n16, B => A(5), C => n3, Y => n14);
   U17 : OAI21X1 port map( A => A(5), B => n16, C => B(5), Y => n17);
   U18 : OAI21X1 port map( A => n18, B => n10, C => n19, Y => n16);
   U19 : OAI21X1 port map( A => A(4), B => n4, C => B(4), Y => n19);
   U20 : AOI21X1 port map( A => n20, B => A(3), C => n5, Y => n18);
   U21 : OAI21X1 port map( A => A(3), B => n20, C => B(3), Y => n21);
   U22 : OAI21X1 port map( A => n22, B => n11, C => n23, Y => n20);
   U23 : OAI21X1 port map( A => A(2), B => n6, C => B(2), Y => n23);
   U24 : AOI22X1 port map( A => A(1), B => B(1), C => B(0), D => n7, Y => n22);
   U25 : OAI21X1 port map( A => A(1), B => B(1), C => A(0), Y => n24);

end SYN_rpl;

library IEEE,OSU_AMI05;

use IEEE.std_logic_1164.all;

use work.CONV_PACK_matrix_math.all;

entity matrix_math is

   port( screen_cor : out std_logic_vector (7 downto 0);  init_matrix, clk, 
         rst_n : in std_logic;  row_sel : out std_logic_vector (1 downto 0);  
         sel, math_done, strb_screen : out std_logic;  point : in 
         std_logic_vector (47 downto 0);  row : in std_logic_vector (63 downto 
         0);  err : out std_logic);

end matrix_math;

architecture SYN_math_behav of matrix_math is

   component INVX2
      port( A : in std_logic;  Y : out std_logic);
   end component;
   
   component matrix_math_DW01_add_0
      port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (15 downto 0);  CO : out std_logic);
   end component;
   
   component matrix_math_DW01_add_1
      port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (15 downto 0);  CO : out std_logic);
   end component;
   
   component matrix_math_DW01_add_2
      port( A, B : in std_logic_vector (15 downto 0);  CI : in std_logic;  SUM 
            : out std_logic_vector (15 downto 0);  CO : out std_logic);
   end component;
   
   component matrix_math_DW02_mult_0
      port( A, B : in std_logic_vector (15 downto 0);  TC : in std_logic;  
            PRODUCT : out std_logic_vector (31 downto 0));
   end component;
   
   component matrix_math_DW02_mult_1
      port( A, B : in std_logic_vector (15 downto 0);  TC : in std_logic;  
            PRODUCT : out std_logic_vector (31 downto 0));
   end component;
   
   component matrix_math_DW02_mult_2
      port( A, B : in std_logic_vector (15 downto 0);  TC : in std_logic;  
            PRODUCT : out std_logic_vector (31 downto 0));
   end component;
   
   component NAND2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NOR2X1
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component NAND3X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OAI21X1
      port( A, B, C : in std_logic;  Y : out std_logic);
   end component;
   
   component OR2X2
      port( A, B : in std_logic;  Y : out std_logic);
   end component;
   
   component DFFSR
      port( D, CLK, R, S : in std_logic;  Q : out std_logic);
   end component;
   
   signal strb_screen_port, state_3_port, state_2_port, state_1_port, 
      state_0_port, V1_15_port, n1, n2, n3, n4, n15, n16, n17, n18, n19, n20, 
      n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35
      , N9, N8, N79, N78, N77, N76, N75, N74, N73, N72, N71, N70, N7, N69, N68,
      N67, N66, N65, N64, N63, N62, N61, N60, N6, N59, N58, N57, N56, N55, N54,
      N53, N52, N51, N50, N5, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40,
      N4_port, N39, N38, N37, N36, N35_port, N34_port, N33_port, N32_port, 
      N31_port, N30_port, N3_port, N29_port, N28_port, N27_port, N26_port, 
      N25_port, N24_port, N23_port, N22_port, N21_port, N20_port, N2_port, 
      N19_port, N18_port, N17_port, N16_port, N15_port, N14, N13, N12, N11, N10
      , N1_port, N0, n38_port, n39_port, n40_port, n41_port, n42_port, n43_port
      , n44_port, n45_port, n46_port, n47_port, n48_port, n49_port, n50_port, 
      n51_port, n52_port, n_1111, n_1112, n_1113, n_1114, n_1115, n_1116, 
      n_1117, n_1118, n_1119, n_1120, n_1121, n_1122, n_1123, n_1124, n_1125, 
      n_1126, n_1127, n_1128, n_1129, n_1130, n_1131, n_1132, n_1133, n_1134, 
      n_1135, n_1136, n_1137, n_1138, n_1139, n_1140, n_1141, n_1142, n_1143, 
      n_1144, n_1145, n_1146, n_1147, n_1148, n_1149, n_1150, n_1151, n_1152, 
      n_1153, n_1154, n_1155, n_1156, n_1157, n_1158, n_1159, n_1160, n_1161, 
      n_1162, n_1163, n_1164, n_1165, n_1166, n_1167, n_1168, n_1169 : 
      std_logic;

begin
   strb_screen <= strb_screen_port;
   
   row_sel(1) <= '0';
   state_reg_0_inst : DFFSR port map( D => n38_port, CLK => clk, R => rst_n, S 
                           => n4, Q => state_0_port);
   state_reg_1_inst : DFFSR port map( D => n34, CLK => clk, R => rst_n, S => n3
                           , Q => state_1_port);
   state_reg_2_inst : DFFSR port map( D => n33, CLK => clk, R => rst_n, S => n2
                           , Q => state_2_port);
   state_reg_3_inst : DFFSR port map( D => n35, CLK => clk, R => rst_n, S => n1
                           , Q => state_3_port);
   n1 <= '1';
   n2 <= '1';
   n3 <= '1';
   n4 <= '1';
   U6 : OR2X2 port map( A => n19, B => n20, Y => n34);
   U17 : NAND2X1 port map( A => n40_port, B => n41_port, Y => sel);
   U18 : NAND2X1 port map( A => n42_port, B => n41_port, Y => row_sel(0));
   U19 : NAND2X1 port map( A => n42_port, B => n40_port, Y => n33);
   U20 : OAI21X1 port map( A => n16, B => n17, C => n18, Y => n15);
   U21 : NAND2X1 port map( A => state_0_port, B => state_1_port, Y => n17);
   U22 : NAND2X1 port map( A => n45_port, B => n46_port, Y => n16);
   U23 : OAI21X1 port map( A => n43_port, B => n21, C => n22, Y => n20);
   U24 : OAI21X1 port map( A => n43_port, B => n23, C => n24, Y => n19);
   U25 : NAND3X1 port map( A => state_1_port, B => n43_port, C => n25, Y => n24
                           );
   U26 : NAND2X1 port map( A => n25, B => n44_port, Y => n23);
   U27 : OAI21X1 port map( A => n43_port, B => n26, C => n27, Y => n35);
   U28 : NAND2X1 port map( A => n25, B => state_1_port, Y => n26);
   U29 : OAI21X1 port map( A => init_matrix, B => n21, C => n29, Y => n28);
   U30 : OAI21X1 port map( A => state_0_port, B => n21, C => n39_port, Y => n29
                           );
   U31 : NAND3X1 port map( A => n18, B => n22, C => n27, Y => strb_screen_port)
                           ;
   U32 : NAND3X1 port map( A => n44_port, B => n45_port, C => n30, Y => n27);
   U33 : NOR2X1 port map( A => state_0_port, B => n46_port, Y => n30);
   U34 : NAND3X1 port map( A => n43_port, B => n46_port, C => state_1_port, Y 
                           => n22);
   U35 : NAND3X1 port map( A => n43_port, B => n44_port, C => n25, Y => n18);
   U36 : NOR2X1 port map( A => n45_port, B => state_3_port, Y => n25);
   U37 : NAND3X1 port map( A => n45_port, B => n46_port, C => n44_port, Y => 
                           n21);
   U38 : NOR2X1 port map( A => n31, B => n32, Y => math_done);
   U39 : NAND2X1 port map( A => state_0_port, B => state_3_port, Y => n32);
   U40 : NAND2X1 port map( A => n44_port, B => n45_port, Y => n31);
   mult_53 : matrix_math_DW02_mult_2 port map( A(15) => row(63), A(14) => 
                           row(62), A(13) => row(61), A(12) => row(60), A(11) 
                           => row(59), A(10) => row(58), A(9) => row(57), A(8) 
                           => row(56), A(7) => row(55), A(6) => row(54), A(5) 
                           => row(53), A(4) => row(52), A(3) => row(51), A(2) 
                           => row(50), A(1) => row(49), A(0) => row(48), B(15) 
                           => point(47), B(14) => point(46), B(13) => point(45)
                           , B(12) => point(44), B(11) => point(43), B(10) => 
                           point(42), B(9) => point(41), B(8) => point(40), 
                           B(7) => point(39), B(6) => point(38), B(5) => 
                           point(37), B(4) => point(36), B(3) => point(35), 
                           B(2) => point(34), B(1) => point(33), B(0) => 
                           point(32), TC => n47_port, PRODUCT(31) => n_1111, 
                           PRODUCT(30) => n_1112, PRODUCT(29) => n_1113, 
                           PRODUCT(28) => n_1114, PRODUCT(27) => n_1115, 
                           PRODUCT(26) => n_1116, PRODUCT(25) => n_1117, 
                           PRODUCT(24) => n_1118, PRODUCT(23) => n_1119, 
                           PRODUCT(22) => n_1120, PRODUCT(21) => n_1121, 
                           PRODUCT(20) => n_1122, PRODUCT(19) => n_1123, 
                           PRODUCT(18) => n_1124, PRODUCT(17) => n_1125, 
                           PRODUCT(16) => n_1126, PRODUCT(15) => N15_port, 
                           PRODUCT(14) => N14, PRODUCT(13) => N13, PRODUCT(12) 
                           => N12, PRODUCT(11) => N11, PRODUCT(10) => N10, 
                           PRODUCT(9) => N9, PRODUCT(8) => N8, PRODUCT(7) => N7
                           , PRODUCT(6) => N6, PRODUCT(5) => N5, PRODUCT(4) => 
                           N4_port, PRODUCT(3) => N3_port, PRODUCT(2) => 
                           N2_port, PRODUCT(1) => N1_port, PRODUCT(0) => N0);
   mult_53_2 : matrix_math_DW02_mult_1 port map( A(15) => row(47), A(14) => 
                           row(46), A(13) => row(45), A(12) => row(44), A(11) 
                           => row(43), A(10) => row(42), A(9) => row(41), A(8) 
                           => row(40), A(7) => row(39), A(6) => row(38), A(5) 
                           => row(37), A(4) => row(36), A(3) => row(35), A(2) 
                           => row(34), A(1) => row(33), A(0) => row(32), B(15) 
                           => point(31), B(14) => point(30), B(13) => point(29)
                           , B(12) => point(28), B(11) => point(27), B(10) => 
                           point(26), B(9) => point(25), B(8) => point(24), 
                           B(7) => point(23), B(6) => point(22), B(5) => 
                           point(21), B(4) => point(20), B(3) => point(19), 
                           B(2) => point(18), B(1) => point(17), B(0) => 
                           point(16), TC => n48_port, PRODUCT(31) => n_1127, 
                           PRODUCT(30) => n_1128, PRODUCT(29) => n_1129, 
                           PRODUCT(28) => n_1130, PRODUCT(27) => n_1131, 
                           PRODUCT(26) => n_1132, PRODUCT(25) => n_1133, 
                           PRODUCT(24) => n_1134, PRODUCT(23) => n_1135, 
                           PRODUCT(22) => n_1136, PRODUCT(21) => n_1137, 
                           PRODUCT(20) => n_1138, PRODUCT(19) => n_1139, 
                           PRODUCT(18) => n_1140, PRODUCT(17) => n_1141, 
                           PRODUCT(16) => n_1142, PRODUCT(15) => N31_port, 
                           PRODUCT(14) => N30_port, PRODUCT(13) => N29_port, 
                           PRODUCT(12) => N28_port, PRODUCT(11) => N27_port, 
                           PRODUCT(10) => N26_port, PRODUCT(9) => N25_port, 
                           PRODUCT(8) => N24_port, PRODUCT(7) => N23_port, 
                           PRODUCT(6) => N22_port, PRODUCT(5) => N21_port, 
                           PRODUCT(4) => N20_port, PRODUCT(3) => N19_port, 
                           PRODUCT(2) => N18_port, PRODUCT(1) => N17_port, 
                           PRODUCT(0) => N16_port);
   mult_53_3 : matrix_math_DW02_mult_0 port map( A(15) => row(31), A(14) => 
                           row(30), A(13) => row(29), A(12) => row(28), A(11) 
                           => row(27), A(10) => row(26), A(9) => row(25), A(8) 
                           => row(24), A(7) => row(23), A(6) => row(22), A(5) 
                           => row(21), A(4) => row(20), A(3) => row(19), A(2) 
                           => row(18), A(1) => row(17), A(0) => row(16), B(15) 
                           => point(15), B(14) => point(14), B(13) => point(13)
                           , B(12) => point(12), B(11) => point(11), B(10) => 
                           point(10), B(9) => point(9), B(8) => point(8), B(7) 
                           => point(7), B(6) => point(6), B(5) => point(5), 
                           B(4) => point(4), B(3) => point(3), B(2) => point(2)
                           , B(1) => point(1), B(0) => point(0), TC => n49_port
                           , PRODUCT(31) => n_1143, PRODUCT(30) => n_1144, 
                           PRODUCT(29) => n_1145, PRODUCT(28) => n_1146, 
                           PRODUCT(27) => n_1147, PRODUCT(26) => n_1148, 
                           PRODUCT(25) => n_1149, PRODUCT(24) => n_1150, 
                           PRODUCT(23) => n_1151, PRODUCT(22) => n_1152, 
                           PRODUCT(21) => n_1153, PRODUCT(20) => n_1154, 
                           PRODUCT(19) => n_1155, PRODUCT(18) => n_1156, 
                           PRODUCT(17) => n_1157, PRODUCT(16) => n_1158, 
                           PRODUCT(15) => N63, PRODUCT(14) => N62, PRODUCT(13) 
                           => N61, PRODUCT(12) => N60, PRODUCT(11) => N59, 
                           PRODUCT(10) => N58, PRODUCT(9) => N57, PRODUCT(8) =>
                           N56, PRODUCT(7) => N55, PRODUCT(6) => N54, 
                           PRODUCT(5) => N53, PRODUCT(4) => N52, PRODUCT(3) => 
                           N51, PRODUCT(2) => N50, PRODUCT(1) => N49, 
                           PRODUCT(0) => N48);
   add_1_root_add_0_root_add_53_3 : matrix_math_DW01_add_2 port map( A(15) => 
                           N15_port, A(14) => N14, A(13) => N13, A(12) => N12, 
                           A(11) => N11, A(10) => N10, A(9) => N9, A(8) => N8, 
                           A(7) => N7, A(6) => N6, A(5) => N5, A(4) => N4_port,
                           A(3) => N3_port, A(2) => N2_port, A(1) => N1_port, 
                           A(0) => N0, B(15) => N63, B(14) => N62, B(13) => N61
                           , B(12) => N60, B(11) => N59, B(10) => N58, B(9) => 
                           N57, B(8) => N56, B(7) => N55, B(6) => N54, B(5) => 
                           N53, B(4) => N52, B(3) => N51, B(2) => N50, B(1) => 
                           N49, B(0) => N48, CI => n50_port, SUM(15) => N47, 
                           SUM(14) => N46, SUM(13) => N45, SUM(12) => N44, 
                           SUM(11) => N43, SUM(10) => N42, SUM(9) => N41, 
                           SUM(8) => N40, SUM(7) => N39, SUM(6) => N38, SUM(5) 
                           => N37, SUM(4) => N36, SUM(3) => N35_port, SUM(2) =>
                           N34_port, SUM(1) => N33_port, SUM(0) => N32_port, CO
                           => n_1159);
   add_2_root_add_0_root_add_53_3 : matrix_math_DW01_add_1 port map( A(15) => 
                           row(15), A(14) => row(14), A(13) => row(13), A(12) 
                           => row(12), A(11) => row(11), A(10) => row(10), A(9)
                           => row(9), A(8) => row(8), A(7) => row(7), A(6) => 
                           row(6), A(5) => row(5), A(4) => row(4), A(3) => 
                           row(3), A(2) => row(2), A(1) => row(1), A(0) => 
                           row(0), B(15) => N31_port, B(14) => N30_port, B(13) 
                           => N29_port, B(12) => N28_port, B(11) => N27_port, 
                           B(10) => N26_port, B(9) => N25_port, B(8) => 
                           N24_port, B(7) => N23_port, B(6) => N22_port, B(5) 
                           => N21_port, B(4) => N20_port, B(3) => N19_port, 
                           B(2) => N18_port, B(1) => N17_port, B(0) => N16_port
                           , CI => n51_port, SUM(15) => N79, SUM(14) => N78, 
                           SUM(13) => N77, SUM(12) => N76, SUM(11) => N75, 
                           SUM(10) => N74, SUM(9) => N73, SUM(8) => N72, SUM(7)
                           => N71, SUM(6) => N70, SUM(5) => N69, SUM(4) => N68,
                           SUM(3) => N67, SUM(2) => N66, SUM(1) => N65, SUM(0) 
                           => N64, CO => n_1160);
   add_0_root_add_0_root_add_53_3 : matrix_math_DW01_add_0 port map( A(15) => 
                           N79, A(14) => N78, A(13) => N77, A(12) => N76, A(11)
                           => N75, A(10) => N74, A(9) => N73, A(8) => N72, A(7)
                           => N71, A(6) => N70, A(5) => N69, A(4) => N68, A(3) 
                           => N67, A(2) => N66, A(1) => N65, A(0) => N64, B(15)
                           => N47, B(14) => N46, B(13) => N45, B(12) => N44, 
                           B(11) => N43, B(10) => N42, B(9) => N41, B(8) => N40
                           , B(7) => N39, B(6) => N38, B(5) => N37, B(4) => N36
                           , B(3) => N35_port, B(2) => N34_port, B(1) => 
                           N33_port, B(0) => N32_port, CI => n52_port, SUM(15) 
                           => V1_15_port, SUM(14) => screen_cor(6), SUM(13) => 
                           screen_cor(5), SUM(12) => screen_cor(4), SUM(11) => 
                           screen_cor(3), SUM(10) => screen_cor(2), SUM(9) => 
                           screen_cor(1), SUM(8) => screen_cor(0), SUM(7) => 
                           n_1161, SUM(6) => n_1162, SUM(5) => n_1163, SUM(4) 
                           => n_1164, SUM(3) => n_1165, SUM(2) => n_1166, 
                           SUM(1) => n_1167, SUM(0) => n_1168, CO => n_1169);
   U41 : INVX2 port map( A => V1_15_port, Y => screen_cor(7));
   U42 : INVX2 port map( A => n28, Y => n38_port);
   U43 : INVX2 port map( A => strb_screen_port, Y => n39_port);
   U44 : INVX2 port map( A => n15, Y => n40_port);
   U45 : INVX2 port map( A => n35, Y => n41_port);
   U46 : INVX2 port map( A => n19, Y => n42_port);
   U47 : INVX2 port map( A => state_0_port, Y => n43_port);
   U48 : INVX2 port map( A => state_1_port, Y => n44_port);
   U49 : INVX2 port map( A => state_2_port, Y => n45_port);
   U50 : INVX2 port map( A => state_3_port, Y => n46_port);
   n47_port <= '1';
   n48_port <= '1';
   n49_port <= '1';
   n50_port <= '0';
   n51_port <= '0';
   n52_port <= '0';

end SYN_math_behav;
