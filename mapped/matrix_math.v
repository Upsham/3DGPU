
module matrix_math_DW02_mult_2 ( A, B, TC, PRODUCT );
  input [15:0] A;
  input [15:0] B;
  output [31:0] PRODUCT;
  input TC;
  wire   \ab[15][0] , \ab[14][1] , \ab[14][0] , \ab[13][2] , \ab[13][1] ,
         \ab[13][0] , \ab[12][3] , \ab[12][2] , \ab[12][1] , \ab[12][0] ,
         \ab[11][4] , \ab[11][3] , \ab[11][2] , \ab[11][1] , \ab[11][0] ,
         \ab[10][5] , \ab[10][4] , \ab[10][3] , \ab[10][2] , \ab[10][1] ,
         \ab[10][0] , \ab[9][6] , \ab[9][5] , \ab[9][4] , \ab[9][3] ,
         \ab[9][2] , \ab[9][1] , \ab[9][0] , \ab[8][7] , \ab[8][6] ,
         \ab[8][5] , \ab[8][4] , \ab[8][3] , \ab[8][2] , \ab[8][1] ,
         \ab[8][0] , \ab[7][8] , \ab[7][7] , \ab[7][6] , \ab[7][5] ,
         \ab[7][4] , \ab[7][3] , \ab[7][2] , \ab[7][1] , \ab[7][0] ,
         \ab[6][9] , \ab[6][8] , \ab[6][7] , \ab[6][6] , \ab[6][5] ,
         \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] , \ab[6][0] ,
         \ab[5][10] , \ab[5][9] , \ab[5][8] , \ab[5][7] , \ab[5][6] ,
         \ab[5][5] , \ab[5][4] , \ab[5][3] , \ab[5][2] , \ab[5][1] ,
         \ab[5][0] , \ab[4][11] , \ab[4][10] , \ab[4][9] , \ab[4][8] ,
         \ab[4][7] , \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] ,
         \ab[4][2] , \ab[4][1] , \ab[4][0] , \ab[3][12] , \ab[3][11] ,
         \ab[3][10] , \ab[3][9] , \ab[3][8] , \ab[3][7] , \ab[3][6] ,
         \ab[3][5] , \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] ,
         \ab[3][0] , \ab[2][13] , \ab[2][12] , \ab[2][11] , \ab[2][10] ,
         \ab[2][9] , \ab[2][8] , \ab[2][7] , \ab[2][6] , \ab[2][5] ,
         \ab[2][4] , \ab[2][3] , \ab[2][2] , \ab[2][1] , \ab[2][0] ,
         \ab[1][14] , \ab[1][13] , \ab[1][12] , \ab[1][11] , \ab[1][10] ,
         \ab[1][9] , \ab[1][8] , \ab[1][7] , \ab[1][6] , \ab[1][5] ,
         \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] , \ab[1][0] ,
         \ab[0][15] , \ab[0][14] , \ab[0][13] , \ab[0][12] , \ab[0][11] ,
         \ab[0][10] , \ab[0][9] , \ab[0][8] , \ab[0][7] , \ab[0][6] ,
         \ab[0][5] , \ab[0][4] , \ab[0][3] , \ab[0][2] , \ab[0][1] ,
         \CARRYB[14][0] , \CARRYB[13][1] , \CARRYB[13][0] , \CARRYB[12][2] ,
         \CARRYB[12][1] , \CARRYB[12][0] , \CARRYB[11][3] , \CARRYB[11][2] ,
         \CARRYB[11][1] , \CARRYB[11][0] , \CARRYB[10][4] , \CARRYB[10][3] ,
         \CARRYB[10][2] , \CARRYB[10][1] , \CARRYB[10][0] , \CARRYB[9][5] ,
         \CARRYB[9][4] , \CARRYB[9][3] , \CARRYB[9][2] , \CARRYB[9][1] ,
         \CARRYB[9][0] , \CARRYB[8][6] , \CARRYB[8][5] , \CARRYB[8][4] ,
         \CARRYB[8][3] , \CARRYB[8][2] , \CARRYB[8][1] , \CARRYB[8][0] ,
         \CARRYB[7][7] , \CARRYB[7][6] , \CARRYB[7][5] , \CARRYB[7][4] ,
         \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] , \CARRYB[7][0] ,
         \CARRYB[6][8] , \CARRYB[6][7] , \CARRYB[6][6] , \CARRYB[6][5] ,
         \CARRYB[6][4] , \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] ,
         \CARRYB[6][0] , \CARRYB[5][9] , \CARRYB[5][8] , \CARRYB[5][7] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][10] ,
         \CARRYB[4][9] , \CARRYB[4][8] , \CARRYB[4][7] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][11] , \CARRYB[3][10] ,
         \CARRYB[3][9] , \CARRYB[3][8] , \CARRYB[3][7] , \CARRYB[3][6] ,
         \CARRYB[3][5] , \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] ,
         \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][12] , \CARRYB[2][11] ,
         \CARRYB[2][10] , \CARRYB[2][9] , \CARRYB[2][8] , \CARRYB[2][7] ,
         \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] , \CARRYB[2][3] ,
         \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] , \SUMB[15][0] ,
         \SUMB[14][1] , \SUMB[13][2] , \SUMB[13][1] , \SUMB[12][3] ,
         \SUMB[12][2] , \SUMB[12][1] , \SUMB[11][4] , \SUMB[11][3] ,
         \SUMB[11][2] , \SUMB[11][1] , \SUMB[10][5] , \SUMB[10][4] ,
         \SUMB[10][3] , \SUMB[10][2] , \SUMB[10][1] , \SUMB[9][6] ,
         \SUMB[9][5] , \SUMB[9][4] , \SUMB[9][3] , \SUMB[9][2] , \SUMB[9][1] ,
         \SUMB[8][7] , \SUMB[8][6] , \SUMB[8][5] , \SUMB[8][4] , \SUMB[8][3] ,
         \SUMB[8][2] , \SUMB[8][1] , \SUMB[7][8] , \SUMB[7][7] , \SUMB[7][6] ,
         \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] , \SUMB[7][1] ,
         \SUMB[6][9] , \SUMB[6][8] , \SUMB[6][7] , \SUMB[6][6] , \SUMB[6][5] ,
         \SUMB[6][4] , \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][10] ,
         \SUMB[5][9] , \SUMB[5][8] , \SUMB[5][7] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][11] ,
         \SUMB[4][10] , \SUMB[4][9] , \SUMB[4][8] , \SUMB[4][7] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][12] , \SUMB[3][11] , \SUMB[3][10] , \SUMB[3][9] ,
         \SUMB[3][8] , \SUMB[3][7] , \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] ,
         \SUMB[3][3] , \SUMB[3][2] , \SUMB[3][1] , \SUMB[2][13] ,
         \SUMB[2][12] , \SUMB[2][11] , \SUMB[2][10] , \SUMB[2][9] ,
         \SUMB[2][8] , \SUMB[2][7] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] ,
         \SUMB[2][3] , \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][14] ,
         \SUMB[1][13] , \SUMB[1][12] , \SUMB[1][11] , \SUMB[1][10] ,
         \SUMB[1][9] , \SUMB[1][8] , \SUMB[1][7] , \SUMB[1][6] , \SUMB[1][5] ,
         \SUMB[1][4] , \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , ZA, ZB, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48;
  assign ZA = A[15];
  assign ZB = B[15];

  FAX1 S14_15_0 ( .A(ZA), .B(ZB), .C(\SUMB[15][0] ), .YS(PRODUCT[15]) );
  FAX1 S4_0 ( .A(\ab[15][0] ), .B(\CARRYB[14][0] ), .C(\SUMB[14][1] ), .YS(
        \SUMB[15][0] ) );
  FAX1 S1_14_0 ( .A(\ab[14][0] ), .B(\CARRYB[13][0] ), .C(\SUMB[13][1] ), .YC(
        \CARRYB[14][0] ), .YS(PRODUCT[14]) );
  FAX1 S2_14_1 ( .A(\ab[14][1] ), .B(\CARRYB[13][1] ), .C(\SUMB[13][2] ), .YS(
        \SUMB[14][1] ) );
  FAX1 S1_13_0 ( .A(\ab[13][0] ), .B(\CARRYB[12][0] ), .C(\SUMB[12][1] ), .YC(
        \CARRYB[13][0] ), .YS(PRODUCT[13]) );
  FAX1 S2_13_1 ( .A(\ab[13][1] ), .B(\CARRYB[12][1] ), .C(\SUMB[12][2] ), .YC(
        \CARRYB[13][1] ), .YS(\SUMB[13][1] ) );
  FAX1 S2_13_2 ( .A(\ab[13][2] ), .B(\CARRYB[12][2] ), .C(\SUMB[12][3] ), .YS(
        \SUMB[13][2] ) );
  FAX1 S1_12_0 ( .A(\ab[12][0] ), .B(\CARRYB[11][0] ), .C(\SUMB[11][1] ), .YC(
        \CARRYB[12][0] ), .YS(PRODUCT[12]) );
  FAX1 S2_12_1 ( .A(\ab[12][1] ), .B(\CARRYB[11][1] ), .C(\SUMB[11][2] ), .YC(
        \CARRYB[12][1] ), .YS(\SUMB[12][1] ) );
  FAX1 S2_12_2 ( .A(\ab[12][2] ), .B(\CARRYB[11][2] ), .C(\SUMB[11][3] ), .YC(
        \CARRYB[12][2] ), .YS(\SUMB[12][2] ) );
  FAX1 S2_12_3 ( .A(\ab[12][3] ), .B(\CARRYB[11][3] ), .C(\SUMB[11][4] ), .YS(
        \SUMB[12][3] ) );
  FAX1 S1_11_0 ( .A(\ab[11][0] ), .B(\CARRYB[10][0] ), .C(\SUMB[10][1] ), .YC(
        \CARRYB[11][0] ), .YS(PRODUCT[11]) );
  FAX1 S2_11_1 ( .A(\ab[11][1] ), .B(\CARRYB[10][1] ), .C(\SUMB[10][2] ), .YC(
        \CARRYB[11][1] ), .YS(\SUMB[11][1] ) );
  FAX1 S2_11_2 ( .A(\ab[11][2] ), .B(\CARRYB[10][2] ), .C(\SUMB[10][3] ), .YC(
        \CARRYB[11][2] ), .YS(\SUMB[11][2] ) );
  FAX1 S2_11_3 ( .A(\ab[11][3] ), .B(\CARRYB[10][3] ), .C(\SUMB[10][4] ), .YC(
        \CARRYB[11][3] ), .YS(\SUMB[11][3] ) );
  FAX1 S2_11_4 ( .A(\ab[11][4] ), .B(\CARRYB[10][4] ), .C(\SUMB[10][5] ), .YS(
        \SUMB[11][4] ) );
  FAX1 S1_10_0 ( .A(\ab[10][0] ), .B(\CARRYB[9][0] ), .C(\SUMB[9][1] ), .YC(
        \CARRYB[10][0] ), .YS(PRODUCT[10]) );
  FAX1 S2_10_1 ( .A(\ab[10][1] ), .B(\CARRYB[9][1] ), .C(\SUMB[9][2] ), .YC(
        \CARRYB[10][1] ), .YS(\SUMB[10][1] ) );
  FAX1 S2_10_2 ( .A(\ab[10][2] ), .B(\CARRYB[9][2] ), .C(\SUMB[9][3] ), .YC(
        \CARRYB[10][2] ), .YS(\SUMB[10][2] ) );
  FAX1 S2_10_3 ( .A(\ab[10][3] ), .B(\CARRYB[9][3] ), .C(\SUMB[9][4] ), .YC(
        \CARRYB[10][3] ), .YS(\SUMB[10][3] ) );
  FAX1 S2_10_4 ( .A(\ab[10][4] ), .B(\CARRYB[9][4] ), .C(\SUMB[9][5] ), .YC(
        \CARRYB[10][4] ), .YS(\SUMB[10][4] ) );
  FAX1 S2_10_5 ( .A(\ab[10][5] ), .B(\CARRYB[9][5] ), .C(\SUMB[9][6] ), .YS(
        \SUMB[10][5] ) );
  FAX1 S1_9_0 ( .A(\ab[9][0] ), .B(\CARRYB[8][0] ), .C(\SUMB[8][1] ), .YC(
        \CARRYB[9][0] ), .YS(PRODUCT[9]) );
  FAX1 S2_9_1 ( .A(\ab[9][1] ), .B(\CARRYB[8][1] ), .C(\SUMB[8][2] ), .YC(
        \CARRYB[9][1] ), .YS(\SUMB[9][1] ) );
  FAX1 S2_9_2 ( .A(\ab[9][2] ), .B(\CARRYB[8][2] ), .C(\SUMB[8][3] ), .YC(
        \CARRYB[9][2] ), .YS(\SUMB[9][2] ) );
  FAX1 S2_9_3 ( .A(\ab[9][3] ), .B(\CARRYB[8][3] ), .C(\SUMB[8][4] ), .YC(
        \CARRYB[9][3] ), .YS(\SUMB[9][3] ) );
  FAX1 S2_9_4 ( .A(\ab[9][4] ), .B(\CARRYB[8][4] ), .C(\SUMB[8][5] ), .YC(
        \CARRYB[9][4] ), .YS(\SUMB[9][4] ) );
  FAX1 S2_9_5 ( .A(\ab[9][5] ), .B(\CARRYB[8][5] ), .C(\SUMB[8][6] ), .YC(
        \CARRYB[9][5] ), .YS(\SUMB[9][5] ) );
  FAX1 S2_9_6 ( .A(\ab[9][6] ), .B(\CARRYB[8][6] ), .C(\SUMB[8][7] ), .YS(
        \SUMB[9][6] ) );
  FAX1 S1_8_0 ( .A(\ab[8][0] ), .B(\CARRYB[7][0] ), .C(\SUMB[7][1] ), .YC(
        \CARRYB[8][0] ), .YS(PRODUCT[8]) );
  FAX1 S2_8_1 ( .A(\ab[8][1] ), .B(\CARRYB[7][1] ), .C(\SUMB[7][2] ), .YC(
        \CARRYB[8][1] ), .YS(\SUMB[8][1] ) );
  FAX1 S2_8_2 ( .A(\ab[8][2] ), .B(\CARRYB[7][2] ), .C(\SUMB[7][3] ), .YC(
        \CARRYB[8][2] ), .YS(\SUMB[8][2] ) );
  FAX1 S2_8_3 ( .A(\ab[8][3] ), .B(\CARRYB[7][3] ), .C(\SUMB[7][4] ), .YC(
        \CARRYB[8][3] ), .YS(\SUMB[8][3] ) );
  FAX1 S2_8_4 ( .A(\ab[8][4] ), .B(\CARRYB[7][4] ), .C(\SUMB[7][5] ), .YC(
        \CARRYB[8][4] ), .YS(\SUMB[8][4] ) );
  FAX1 S2_8_5 ( .A(\ab[8][5] ), .B(\CARRYB[7][5] ), .C(\SUMB[7][6] ), .YC(
        \CARRYB[8][5] ), .YS(\SUMB[8][5] ) );
  FAX1 S2_8_6 ( .A(\ab[8][6] ), .B(\CARRYB[7][6] ), .C(\SUMB[7][7] ), .YC(
        \CARRYB[8][6] ), .YS(\SUMB[8][6] ) );
  FAX1 S2_8_7 ( .A(\ab[8][7] ), .B(\CARRYB[7][7] ), .C(\SUMB[7][8] ), .YS(
        \SUMB[8][7] ) );
  FAX1 S1_7_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .C(\SUMB[6][1] ), .YC(
        \CARRYB[7][0] ), .YS(PRODUCT[7]) );
  FAX1 S2_7_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .C(\SUMB[6][2] ), .YC(
        \CARRYB[7][1] ), .YS(\SUMB[7][1] ) );
  FAX1 S2_7_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .C(\SUMB[6][3] ), .YC(
        \CARRYB[7][2] ), .YS(\SUMB[7][2] ) );
  FAX1 S2_7_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .C(\SUMB[6][4] ), .YC(
        \CARRYB[7][3] ), .YS(\SUMB[7][3] ) );
  FAX1 S2_7_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .C(\SUMB[6][5] ), .YC(
        \CARRYB[7][4] ), .YS(\SUMB[7][4] ) );
  FAX1 S2_7_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .C(\SUMB[6][6] ), .YC(
        \CARRYB[7][5] ), .YS(\SUMB[7][5] ) );
  FAX1 S2_7_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .C(\SUMB[6][7] ), .YC(
        \CARRYB[7][6] ), .YS(\SUMB[7][6] ) );
  FAX1 S2_7_7 ( .A(\ab[7][7] ), .B(\CARRYB[6][7] ), .C(\SUMB[6][8] ), .YC(
        \CARRYB[7][7] ), .YS(\SUMB[7][7] ) );
  FAX1 S2_7_8 ( .A(\ab[7][8] ), .B(\CARRYB[6][8] ), .C(\SUMB[6][9] ), .YS(
        \SUMB[7][8] ) );
  FAX1 S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .C(\SUMB[5][1] ), .YC(
        \CARRYB[6][0] ), .YS(PRODUCT[6]) );
  FAX1 S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .C(\SUMB[5][2] ), .YC(
        \CARRYB[6][1] ), .YS(\SUMB[6][1] ) );
  FAX1 S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .C(\SUMB[5][3] ), .YC(
        \CARRYB[6][2] ), .YS(\SUMB[6][2] ) );
  FAX1 S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .C(\SUMB[5][4] ), .YC(
        \CARRYB[6][3] ), .YS(\SUMB[6][3] ) );
  FAX1 S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .C(\SUMB[5][5] ), .YC(
        \CARRYB[6][4] ), .YS(\SUMB[6][4] ) );
  FAX1 S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .C(\SUMB[5][6] ), .YC(
        \CARRYB[6][5] ), .YS(\SUMB[6][5] ) );
  FAX1 S2_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .C(\SUMB[5][7] ), .YC(
        \CARRYB[6][6] ), .YS(\SUMB[6][6] ) );
  FAX1 S2_6_7 ( .A(\ab[6][7] ), .B(\CARRYB[5][7] ), .C(\SUMB[5][8] ), .YC(
        \CARRYB[6][7] ), .YS(\SUMB[6][7] ) );
  FAX1 S2_6_8 ( .A(\ab[6][8] ), .B(\CARRYB[5][8] ), .C(\SUMB[5][9] ), .YC(
        \CARRYB[6][8] ), .YS(\SUMB[6][8] ) );
  FAX1 S2_6_9 ( .A(\ab[6][9] ), .B(\CARRYB[5][9] ), .C(\SUMB[5][10] ), .YS(
        \SUMB[6][9] ) );
  FAX1 S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .C(\SUMB[4][1] ), .YC(
        \CARRYB[5][0] ), .YS(PRODUCT[5]) );
  FAX1 S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .C(\SUMB[4][2] ), .YC(
        \CARRYB[5][1] ), .YS(\SUMB[5][1] ) );
  FAX1 S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .C(\SUMB[4][3] ), .YC(
        \CARRYB[5][2] ), .YS(\SUMB[5][2] ) );
  FAX1 S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .C(\SUMB[4][4] ), .YC(
        \CARRYB[5][3] ), .YS(\SUMB[5][3] ) );
  FAX1 S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .C(\SUMB[4][5] ), .YC(
        \CARRYB[5][4] ), .YS(\SUMB[5][4] ) );
  FAX1 S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .C(\SUMB[4][6] ), .YC(
        \CARRYB[5][5] ), .YS(\SUMB[5][5] ) );
  FAX1 S2_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .C(\SUMB[4][7] ), .YC(
        \CARRYB[5][6] ), .YS(\SUMB[5][6] ) );
  FAX1 S2_5_7 ( .A(\ab[5][7] ), .B(\CARRYB[4][7] ), .C(\SUMB[4][8] ), .YC(
        \CARRYB[5][7] ), .YS(\SUMB[5][7] ) );
  FAX1 S2_5_8 ( .A(\ab[5][8] ), .B(\CARRYB[4][8] ), .C(\SUMB[4][9] ), .YC(
        \CARRYB[5][8] ), .YS(\SUMB[5][8] ) );
  FAX1 S2_5_9 ( .A(\ab[5][9] ), .B(\CARRYB[4][9] ), .C(\SUMB[4][10] ), .YC(
        \CARRYB[5][9] ), .YS(\SUMB[5][9] ) );
  FAX1 S2_5_10 ( .A(\ab[5][10] ), .B(\CARRYB[4][10] ), .C(\SUMB[4][11] ), .YS(
        \SUMB[5][10] ) );
  FAX1 S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .C(\SUMB[3][1] ), .YC(
        \CARRYB[4][0] ), .YS(PRODUCT[4]) );
  FAX1 S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .C(\SUMB[3][2] ), .YC(
        \CARRYB[4][1] ), .YS(\SUMB[4][1] ) );
  FAX1 S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .C(\SUMB[3][3] ), .YC(
        \CARRYB[4][2] ), .YS(\SUMB[4][2] ) );
  FAX1 S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .C(\SUMB[3][4] ), .YC(
        \CARRYB[4][3] ), .YS(\SUMB[4][3] ) );
  FAX1 S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .C(\SUMB[3][5] ), .YC(
        \CARRYB[4][4] ), .YS(\SUMB[4][4] ) );
  FAX1 S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .C(\SUMB[3][6] ), .YC(
        \CARRYB[4][5] ), .YS(\SUMB[4][5] ) );
  FAX1 S2_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .C(\SUMB[3][7] ), .YC(
        \CARRYB[4][6] ), .YS(\SUMB[4][6] ) );
  FAX1 S2_4_7 ( .A(\ab[4][7] ), .B(\CARRYB[3][7] ), .C(\SUMB[3][8] ), .YC(
        \CARRYB[4][7] ), .YS(\SUMB[4][7] ) );
  FAX1 S2_4_8 ( .A(\ab[4][8] ), .B(\CARRYB[3][8] ), .C(\SUMB[3][9] ), .YC(
        \CARRYB[4][8] ), .YS(\SUMB[4][8] ) );
  FAX1 S2_4_9 ( .A(\ab[4][9] ), .B(\CARRYB[3][9] ), .C(\SUMB[3][10] ), .YC(
        \CARRYB[4][9] ), .YS(\SUMB[4][9] ) );
  FAX1 S2_4_10 ( .A(\ab[4][10] ), .B(\CARRYB[3][10] ), .C(\SUMB[3][11] ), .YC(
        \CARRYB[4][10] ), .YS(\SUMB[4][10] ) );
  FAX1 S2_4_11 ( .A(\ab[4][11] ), .B(\CARRYB[3][11] ), .C(\SUMB[3][12] ), .YS(
        \SUMB[4][11] ) );
  FAX1 S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .C(\SUMB[2][1] ), .YC(
        \CARRYB[3][0] ), .YS(PRODUCT[3]) );
  FAX1 S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .C(\SUMB[2][2] ), .YC(
        \CARRYB[3][1] ), .YS(\SUMB[3][1] ) );
  FAX1 S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .C(\SUMB[2][3] ), .YC(
        \CARRYB[3][2] ), .YS(\SUMB[3][2] ) );
  FAX1 S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .C(\SUMB[2][4] ), .YC(
        \CARRYB[3][3] ), .YS(\SUMB[3][3] ) );
  FAX1 S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .C(\SUMB[2][5] ), .YC(
        \CARRYB[3][4] ), .YS(\SUMB[3][4] ) );
  FAX1 S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .C(\SUMB[2][6] ), .YC(
        \CARRYB[3][5] ), .YS(\SUMB[3][5] ) );
  FAX1 S2_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .C(\SUMB[2][7] ), .YC(
        \CARRYB[3][6] ), .YS(\SUMB[3][6] ) );
  FAX1 S2_3_7 ( .A(\ab[3][7] ), .B(\CARRYB[2][7] ), .C(\SUMB[2][8] ), .YC(
        \CARRYB[3][7] ), .YS(\SUMB[3][7] ) );
  FAX1 S2_3_8 ( .A(\ab[3][8] ), .B(\CARRYB[2][8] ), .C(\SUMB[2][9] ), .YC(
        \CARRYB[3][8] ), .YS(\SUMB[3][8] ) );
  FAX1 S2_3_9 ( .A(\ab[3][9] ), .B(\CARRYB[2][9] ), .C(\SUMB[2][10] ), .YC(
        \CARRYB[3][9] ), .YS(\SUMB[3][9] ) );
  FAX1 S2_3_10 ( .A(\ab[3][10] ), .B(\CARRYB[2][10] ), .C(\SUMB[2][11] ), .YC(
        \CARRYB[3][10] ), .YS(\SUMB[3][10] ) );
  FAX1 S2_3_11 ( .A(\ab[3][11] ), .B(\CARRYB[2][11] ), .C(\SUMB[2][12] ), .YC(
        \CARRYB[3][11] ), .YS(\SUMB[3][11] ) );
  FAX1 S2_3_12 ( .A(\ab[3][12] ), .B(\CARRYB[2][12] ), .C(\SUMB[2][13] ), .YS(
        \SUMB[3][12] ) );
  FAX1 S1_2_0 ( .A(\ab[2][0] ), .B(n3), .C(\SUMB[1][1] ), .YC(\CARRYB[2][0] ), 
        .YS(PRODUCT[2]) );
  FAX1 S2_2_1 ( .A(\ab[2][1] ), .B(n4), .C(\SUMB[1][2] ), .YC(\CARRYB[2][1] ), 
        .YS(\SUMB[2][1] ) );
  FAX1 S2_2_2 ( .A(\ab[2][2] ), .B(n5), .C(\SUMB[1][3] ), .YC(\CARRYB[2][2] ), 
        .YS(\SUMB[2][2] ) );
  FAX1 S2_2_3 ( .A(\ab[2][3] ), .B(n6), .C(\SUMB[1][4] ), .YC(\CARRYB[2][3] ), 
        .YS(\SUMB[2][3] ) );
  FAX1 S2_2_4 ( .A(\ab[2][4] ), .B(n7), .C(\SUMB[1][5] ), .YC(\CARRYB[2][4] ), 
        .YS(\SUMB[2][4] ) );
  FAX1 S2_2_5 ( .A(\ab[2][5] ), .B(n8), .C(\SUMB[1][6] ), .YC(\CARRYB[2][5] ), 
        .YS(\SUMB[2][5] ) );
  FAX1 S2_2_6 ( .A(\ab[2][6] ), .B(n9), .C(\SUMB[1][7] ), .YC(\CARRYB[2][6] ), 
        .YS(\SUMB[2][6] ) );
  FAX1 S2_2_7 ( .A(\ab[2][7] ), .B(n10), .C(\SUMB[1][8] ), .YC(\CARRYB[2][7] ), 
        .YS(\SUMB[2][7] ) );
  FAX1 S2_2_8 ( .A(\ab[2][8] ), .B(n11), .C(\SUMB[1][9] ), .YC(\CARRYB[2][8] ), 
        .YS(\SUMB[2][8] ) );
  FAX1 S2_2_9 ( .A(\ab[2][9] ), .B(n16), .C(\SUMB[1][10] ), .YC(\CARRYB[2][9] ), .YS(\SUMB[2][9] ) );
  FAX1 S2_2_10 ( .A(\ab[2][10] ), .B(n15), .C(\SUMB[1][11] ), .YC(
        \CARRYB[2][10] ), .YS(\SUMB[2][10] ) );
  FAX1 S2_2_11 ( .A(\ab[2][11] ), .B(n14), .C(\SUMB[1][12] ), .YC(
        \CARRYB[2][11] ), .YS(\SUMB[2][11] ) );
  FAX1 S2_2_12 ( .A(\ab[2][12] ), .B(n13), .C(\SUMB[1][13] ), .YC(
        \CARRYB[2][12] ), .YS(\SUMB[2][12] ) );
  FAX1 S2_2_13 ( .A(\ab[2][13] ), .B(n12), .C(\SUMB[1][14] ), .YS(
        \SUMB[2][13] ) );
  AND2X2 U2 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n3) );
  AND2X2 U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2 U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2 U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2 U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2 U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2 U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2 U9 ( .A(\ab[0][8] ), .B(\ab[1][7] ), .Y(n10) );
  AND2X2 U10 ( .A(\ab[0][9] ), .B(\ab[1][8] ), .Y(n11) );
  AND2X2 U11 ( .A(\ab[0][14] ), .B(\ab[1][13] ), .Y(n12) );
  AND2X2 U12 ( .A(\ab[0][13] ), .B(\ab[1][12] ), .Y(n13) );
  AND2X2 U13 ( .A(\ab[0][12] ), .B(\ab[1][11] ), .Y(n14) );
  AND2X2 U14 ( .A(\ab[0][11] ), .B(\ab[1][10] ), .Y(n15) );
  AND2X2 U15 ( .A(\ab[0][10] ), .B(\ab[1][9] ), .Y(n16) );
  INVX2 U16 ( .A(A[0]), .Y(n48) );
  INVX2 U17 ( .A(A[1]), .Y(n47) );
  INVX2 U18 ( .A(B[0]), .Y(n32) );
  INVX2 U19 ( .A(B[1]), .Y(n31) );
  INVX2 U20 ( .A(A[2]), .Y(n46) );
  INVX2 U21 ( .A(B[2]), .Y(n30) );
  INVX2 U22 ( .A(A[3]), .Y(n45) );
  INVX2 U23 ( .A(B[3]), .Y(n29) );
  INVX2 U24 ( .A(A[4]), .Y(n44) );
  INVX2 U25 ( .A(B[4]), .Y(n28) );
  INVX2 U26 ( .A(A[5]), .Y(n43) );
  INVX2 U27 ( .A(B[5]), .Y(n27) );
  INVX2 U28 ( .A(A[6]), .Y(n42) );
  INVX2 U29 ( .A(B[6]), .Y(n26) );
  INVX2 U30 ( .A(A[7]), .Y(n41) );
  INVX2 U31 ( .A(B[7]), .Y(n25) );
  XOR2X1 U32 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XOR2X1 U33 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  XOR2X1 U34 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1 U35 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2X1 U36 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1 U37 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  XOR2X1 U38 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1 U39 ( .A(\ab[1][7] ), .B(\ab[0][8] ), .Y(\SUMB[1][7] ) );
  XOR2X1 U40 ( .A(\ab[1][8] ), .B(\ab[0][9] ), .Y(\SUMB[1][8] ) );
  XOR2X1 U41 ( .A(\ab[1][9] ), .B(\ab[0][10] ), .Y(\SUMB[1][9] ) );
  XOR2X1 U42 ( .A(\ab[1][10] ), .B(\ab[0][11] ), .Y(\SUMB[1][10] ) );
  XOR2X1 U43 ( .A(\ab[1][11] ), .B(\ab[0][12] ), .Y(\SUMB[1][11] ) );
  XOR2X1 U44 ( .A(\ab[1][12] ), .B(\ab[0][13] ), .Y(\SUMB[1][12] ) );
  XOR2X1 U45 ( .A(\ab[1][13] ), .B(\ab[0][14] ), .Y(\SUMB[1][13] ) );
  XOR2X1 U46 ( .A(\ab[1][14] ), .B(\ab[0][15] ), .Y(\SUMB[1][14] ) );
  INVX2 U47 ( .A(ZB), .Y(n17) );
  INVX2 U48 ( .A(B[14]), .Y(n18) );
  INVX2 U49 ( .A(B[13]), .Y(n19) );
  INVX2 U50 ( .A(B[12]), .Y(n20) );
  INVX2 U51 ( .A(B[11]), .Y(n21) );
  INVX2 U52 ( .A(B[10]), .Y(n22) );
  INVX2 U53 ( .A(B[9]), .Y(n23) );
  INVX2 U54 ( .A(B[8]), .Y(n24) );
  INVX2 U55 ( .A(ZA), .Y(n33) );
  INVX2 U56 ( .A(A[14]), .Y(n34) );
  INVX2 U57 ( .A(A[13]), .Y(n35) );
  INVX2 U58 ( .A(A[12]), .Y(n36) );
  INVX2 U59 ( .A(A[11]), .Y(n37) );
  INVX2 U60 ( .A(A[10]), .Y(n38) );
  INVX2 U61 ( .A(A[9]), .Y(n39) );
  INVX2 U62 ( .A(A[8]), .Y(n40) );
  NOR2X1 U63 ( .A(n39), .B(n26), .Y(\ab[9][6] ) );
  NOR2X1 U64 ( .A(n39), .B(n27), .Y(\ab[9][5] ) );
  NOR2X1 U65 ( .A(n39), .B(n28), .Y(\ab[9][4] ) );
  NOR2X1 U66 ( .A(n39), .B(n29), .Y(\ab[9][3] ) );
  NOR2X1 U67 ( .A(n39), .B(n30), .Y(\ab[9][2] ) );
  NOR2X1 U68 ( .A(n39), .B(n31), .Y(\ab[9][1] ) );
  NOR2X1 U69 ( .A(n39), .B(n32), .Y(\ab[9][0] ) );
  NOR2X1 U70 ( .A(n25), .B(n40), .Y(\ab[8][7] ) );
  NOR2X1 U71 ( .A(n26), .B(n40), .Y(\ab[8][6] ) );
  NOR2X1 U72 ( .A(n27), .B(n40), .Y(\ab[8][5] ) );
  NOR2X1 U73 ( .A(n28), .B(n40), .Y(\ab[8][4] ) );
  NOR2X1 U74 ( .A(n29), .B(n40), .Y(\ab[8][3] ) );
  NOR2X1 U75 ( .A(n30), .B(n40), .Y(\ab[8][2] ) );
  NOR2X1 U76 ( .A(n31), .B(n40), .Y(\ab[8][1] ) );
  NOR2X1 U77 ( .A(n32), .B(n40), .Y(\ab[8][0] ) );
  NOR2X1 U78 ( .A(n24), .B(n41), .Y(\ab[7][8] ) );
  NOR2X1 U79 ( .A(n25), .B(n41), .Y(\ab[7][7] ) );
  NOR2X1 U80 ( .A(n26), .B(n41), .Y(\ab[7][6] ) );
  NOR2X1 U81 ( .A(n27), .B(n41), .Y(\ab[7][5] ) );
  NOR2X1 U82 ( .A(n28), .B(n41), .Y(\ab[7][4] ) );
  NOR2X1 U83 ( .A(n29), .B(n41), .Y(\ab[7][3] ) );
  NOR2X1 U84 ( .A(n30), .B(n41), .Y(\ab[7][2] ) );
  NOR2X1 U85 ( .A(n31), .B(n41), .Y(\ab[7][1] ) );
  NOR2X1 U86 ( .A(n32), .B(n41), .Y(\ab[7][0] ) );
  NOR2X1 U87 ( .A(n23), .B(n42), .Y(\ab[6][9] ) );
  NOR2X1 U88 ( .A(n24), .B(n42), .Y(\ab[6][8] ) );
  NOR2X1 U89 ( .A(n25), .B(n42), .Y(\ab[6][7] ) );
  NOR2X1 U90 ( .A(n26), .B(n42), .Y(\ab[6][6] ) );
  NOR2X1 U91 ( .A(n27), .B(n42), .Y(\ab[6][5] ) );
  NOR2X1 U92 ( .A(n28), .B(n42), .Y(\ab[6][4] ) );
  NOR2X1 U93 ( .A(n29), .B(n42), .Y(\ab[6][3] ) );
  NOR2X1 U94 ( .A(n30), .B(n42), .Y(\ab[6][2] ) );
  NOR2X1 U95 ( .A(n31), .B(n42), .Y(\ab[6][1] ) );
  NOR2X1 U96 ( .A(n32), .B(n42), .Y(\ab[6][0] ) );
  NOR2X1 U97 ( .A(n23), .B(n43), .Y(\ab[5][9] ) );
  NOR2X1 U98 ( .A(n24), .B(n43), .Y(\ab[5][8] ) );
  NOR2X1 U99 ( .A(n25), .B(n43), .Y(\ab[5][7] ) );
  NOR2X1 U100 ( .A(n26), .B(n43), .Y(\ab[5][6] ) );
  NOR2X1 U101 ( .A(n27), .B(n43), .Y(\ab[5][5] ) );
  NOR2X1 U102 ( .A(n28), .B(n43), .Y(\ab[5][4] ) );
  NOR2X1 U103 ( .A(n29), .B(n43), .Y(\ab[5][3] ) );
  NOR2X1 U104 ( .A(n30), .B(n43), .Y(\ab[5][2] ) );
  NOR2X1 U105 ( .A(n31), .B(n43), .Y(\ab[5][1] ) );
  NOR2X1 U106 ( .A(n22), .B(n43), .Y(\ab[5][10] ) );
  NOR2X1 U107 ( .A(n32), .B(n43), .Y(\ab[5][0] ) );
  NOR2X1 U108 ( .A(n23), .B(n44), .Y(\ab[4][9] ) );
  NOR2X1 U109 ( .A(n24), .B(n44), .Y(\ab[4][8] ) );
  NOR2X1 U110 ( .A(n25), .B(n44), .Y(\ab[4][7] ) );
  NOR2X1 U111 ( .A(n26), .B(n44), .Y(\ab[4][6] ) );
  NOR2X1 U112 ( .A(n27), .B(n44), .Y(\ab[4][5] ) );
  NOR2X1 U113 ( .A(n28), .B(n44), .Y(\ab[4][4] ) );
  NOR2X1 U114 ( .A(n29), .B(n44), .Y(\ab[4][3] ) );
  NOR2X1 U115 ( .A(n30), .B(n44), .Y(\ab[4][2] ) );
  NOR2X1 U116 ( .A(n31), .B(n44), .Y(\ab[4][1] ) );
  NOR2X1 U117 ( .A(n21), .B(n44), .Y(\ab[4][11] ) );
  NOR2X1 U118 ( .A(n22), .B(n44), .Y(\ab[4][10] ) );
  NOR2X1 U119 ( .A(n32), .B(n44), .Y(\ab[4][0] ) );
  NOR2X1 U120 ( .A(n23), .B(n45), .Y(\ab[3][9] ) );
  NOR2X1 U121 ( .A(n24), .B(n45), .Y(\ab[3][8] ) );
  NOR2X1 U122 ( .A(n25), .B(n45), .Y(\ab[3][7] ) );
  NOR2X1 U123 ( .A(n26), .B(n45), .Y(\ab[3][6] ) );
  NOR2X1 U124 ( .A(n27), .B(n45), .Y(\ab[3][5] ) );
  NOR2X1 U125 ( .A(n28), .B(n45), .Y(\ab[3][4] ) );
  NOR2X1 U126 ( .A(n29), .B(n45), .Y(\ab[3][3] ) );
  NOR2X1 U127 ( .A(n30), .B(n45), .Y(\ab[3][2] ) );
  NOR2X1 U128 ( .A(n31), .B(n45), .Y(\ab[3][1] ) );
  NOR2X1 U129 ( .A(n20), .B(n45), .Y(\ab[3][12] ) );
  NOR2X1 U130 ( .A(n21), .B(n45), .Y(\ab[3][11] ) );
  NOR2X1 U131 ( .A(n22), .B(n45), .Y(\ab[3][10] ) );
  NOR2X1 U132 ( .A(n32), .B(n45), .Y(\ab[3][0] ) );
  NOR2X1 U133 ( .A(n23), .B(n46), .Y(\ab[2][9] ) );
  NOR2X1 U134 ( .A(n24), .B(n46), .Y(\ab[2][8] ) );
  NOR2X1 U135 ( .A(n25), .B(n46), .Y(\ab[2][7] ) );
  NOR2X1 U136 ( .A(n26), .B(n46), .Y(\ab[2][6] ) );
  NOR2X1 U137 ( .A(n27), .B(n46), .Y(\ab[2][5] ) );
  NOR2X1 U138 ( .A(n28), .B(n46), .Y(\ab[2][4] ) );
  NOR2X1 U139 ( .A(n29), .B(n46), .Y(\ab[2][3] ) );
  NOR2X1 U140 ( .A(n30), .B(n46), .Y(\ab[2][2] ) );
  NOR2X1 U141 ( .A(n31), .B(n46), .Y(\ab[2][1] ) );
  NOR2X1 U142 ( .A(n19), .B(n46), .Y(\ab[2][13] ) );
  NOR2X1 U143 ( .A(n20), .B(n46), .Y(\ab[2][12] ) );
  NOR2X1 U144 ( .A(n21), .B(n46), .Y(\ab[2][11] ) );
  NOR2X1 U145 ( .A(n22), .B(n46), .Y(\ab[2][10] ) );
  NOR2X1 U146 ( .A(n32), .B(n46), .Y(\ab[2][0] ) );
  NOR2X1 U147 ( .A(n23), .B(n47), .Y(\ab[1][9] ) );
  NOR2X1 U148 ( .A(n24), .B(n47), .Y(\ab[1][8] ) );
  NOR2X1 U149 ( .A(n25), .B(n47), .Y(\ab[1][7] ) );
  NOR2X1 U150 ( .A(n26), .B(n47), .Y(\ab[1][6] ) );
  NOR2X1 U151 ( .A(n27), .B(n47), .Y(\ab[1][5] ) );
  NOR2X1 U152 ( .A(n28), .B(n47), .Y(\ab[1][4] ) );
  NOR2X1 U153 ( .A(n29), .B(n47), .Y(\ab[1][3] ) );
  NOR2X1 U154 ( .A(n30), .B(n47), .Y(\ab[1][2] ) );
  NOR2X1 U155 ( .A(n31), .B(n47), .Y(\ab[1][1] ) );
  NOR2X1 U156 ( .A(n18), .B(n47), .Y(\ab[1][14] ) );
  NOR2X1 U157 ( .A(n19), .B(n47), .Y(\ab[1][13] ) );
  NOR2X1 U158 ( .A(n20), .B(n47), .Y(\ab[1][12] ) );
  NOR2X1 U159 ( .A(n21), .B(n47), .Y(\ab[1][11] ) );
  NOR2X1 U160 ( .A(n22), .B(n47), .Y(\ab[1][10] ) );
  NOR2X1 U161 ( .A(n32), .B(n47), .Y(\ab[1][0] ) );
  NOR2X1 U162 ( .A(B[0]), .B(n33), .Y(\ab[15][0] ) );
  NOR2X1 U163 ( .A(n31), .B(n34), .Y(\ab[14][1] ) );
  NOR2X1 U164 ( .A(n32), .B(n34), .Y(\ab[14][0] ) );
  NOR2X1 U165 ( .A(n30), .B(n35), .Y(\ab[13][2] ) );
  NOR2X1 U166 ( .A(n31), .B(n35), .Y(\ab[13][1] ) );
  NOR2X1 U167 ( .A(n32), .B(n35), .Y(\ab[13][0] ) );
  NOR2X1 U168 ( .A(n29), .B(n36), .Y(\ab[12][3] ) );
  NOR2X1 U169 ( .A(n30), .B(n36), .Y(\ab[12][2] ) );
  NOR2X1 U170 ( .A(n31), .B(n36), .Y(\ab[12][1] ) );
  NOR2X1 U171 ( .A(n32), .B(n36), .Y(\ab[12][0] ) );
  NOR2X1 U172 ( .A(n28), .B(n37), .Y(\ab[11][4] ) );
  NOR2X1 U173 ( .A(n29), .B(n37), .Y(\ab[11][3] ) );
  NOR2X1 U174 ( .A(n30), .B(n37), .Y(\ab[11][2] ) );
  NOR2X1 U175 ( .A(n31), .B(n37), .Y(\ab[11][1] ) );
  NOR2X1 U176 ( .A(n32), .B(n37), .Y(\ab[11][0] ) );
  NOR2X1 U177 ( .A(n27), .B(n38), .Y(\ab[10][5] ) );
  NOR2X1 U178 ( .A(n28), .B(n38), .Y(\ab[10][4] ) );
  NOR2X1 U179 ( .A(n29), .B(n38), .Y(\ab[10][3] ) );
  NOR2X1 U180 ( .A(n30), .B(n38), .Y(\ab[10][2] ) );
  NOR2X1 U181 ( .A(n31), .B(n38), .Y(\ab[10][1] ) );
  NOR2X1 U182 ( .A(n32), .B(n38), .Y(\ab[10][0] ) );
  NOR2X1 U183 ( .A(n23), .B(n48), .Y(\ab[0][9] ) );
  NOR2X1 U184 ( .A(n24), .B(n48), .Y(\ab[0][8] ) );
  NOR2X1 U185 ( .A(n25), .B(n48), .Y(\ab[0][7] ) );
  NOR2X1 U186 ( .A(n26), .B(n48), .Y(\ab[0][6] ) );
  NOR2X1 U187 ( .A(n27), .B(n48), .Y(\ab[0][5] ) );
  NOR2X1 U188 ( .A(n28), .B(n48), .Y(\ab[0][4] ) );
  NOR2X1 U189 ( .A(n29), .B(n48), .Y(\ab[0][3] ) );
  NOR2X1 U190 ( .A(n30), .B(n48), .Y(\ab[0][2] ) );
  NOR2X1 U191 ( .A(n31), .B(n48), .Y(\ab[0][1] ) );
  NOR2X1 U192 ( .A(A[0]), .B(n17), .Y(\ab[0][15] ) );
  NOR2X1 U193 ( .A(n18), .B(n48), .Y(\ab[0][14] ) );
  NOR2X1 U194 ( .A(n19), .B(n48), .Y(\ab[0][13] ) );
  NOR2X1 U195 ( .A(n20), .B(n48), .Y(\ab[0][12] ) );
  NOR2X1 U196 ( .A(n21), .B(n48), .Y(\ab[0][11] ) );
  NOR2X1 U197 ( .A(n22), .B(n48), .Y(\ab[0][10] ) );
  NOR2X1 U198 ( .A(n32), .B(n48), .Y(PRODUCT[0]) );
endmodule


module matrix_math_DW02_mult_1 ( A, B, TC, PRODUCT );
  input [15:0] A;
  input [15:0] B;
  output [31:0] PRODUCT;
  input TC;
  wire   \ab[15][0] , \ab[14][1] , \ab[14][0] , \ab[13][2] , \ab[13][1] ,
         \ab[13][0] , \ab[12][3] , \ab[12][2] , \ab[12][1] , \ab[12][0] ,
         \ab[11][4] , \ab[11][3] , \ab[11][2] , \ab[11][1] , \ab[11][0] ,
         \ab[10][5] , \ab[10][4] , \ab[10][3] , \ab[10][2] , \ab[10][1] ,
         \ab[10][0] , \ab[9][6] , \ab[9][5] , \ab[9][4] , \ab[9][3] ,
         \ab[9][2] , \ab[9][1] , \ab[9][0] , \ab[8][7] , \ab[8][6] ,
         \ab[8][5] , \ab[8][4] , \ab[8][3] , \ab[8][2] , \ab[8][1] ,
         \ab[8][0] , \ab[7][8] , \ab[7][7] , \ab[7][6] , \ab[7][5] ,
         \ab[7][4] , \ab[7][3] , \ab[7][2] , \ab[7][1] , \ab[7][0] ,
         \ab[6][9] , \ab[6][8] , \ab[6][7] , \ab[6][6] , \ab[6][5] ,
         \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] , \ab[6][0] ,
         \ab[5][10] , \ab[5][9] , \ab[5][8] , \ab[5][7] , \ab[5][6] ,
         \ab[5][5] , \ab[5][4] , \ab[5][3] , \ab[5][2] , \ab[5][1] ,
         \ab[5][0] , \ab[4][11] , \ab[4][10] , \ab[4][9] , \ab[4][8] ,
         \ab[4][7] , \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] ,
         \ab[4][2] , \ab[4][1] , \ab[4][0] , \ab[3][12] , \ab[3][11] ,
         \ab[3][10] , \ab[3][9] , \ab[3][8] , \ab[3][7] , \ab[3][6] ,
         \ab[3][5] , \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] ,
         \ab[3][0] , \ab[2][13] , \ab[2][12] , \ab[2][11] , \ab[2][10] ,
         \ab[2][9] , \ab[2][8] , \ab[2][7] , \ab[2][6] , \ab[2][5] ,
         \ab[2][4] , \ab[2][3] , \ab[2][2] , \ab[2][1] , \ab[2][0] ,
         \ab[1][14] , \ab[1][13] , \ab[1][12] , \ab[1][11] , \ab[1][10] ,
         \ab[1][9] , \ab[1][8] , \ab[1][7] , \ab[1][6] , \ab[1][5] ,
         \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] , \ab[1][0] ,
         \ab[0][15] , \ab[0][14] , \ab[0][13] , \ab[0][12] , \ab[0][11] ,
         \ab[0][10] , \ab[0][9] , \ab[0][8] , \ab[0][7] , \ab[0][6] ,
         \ab[0][5] , \ab[0][4] , \ab[0][3] , \ab[0][2] , \ab[0][1] ,
         \CARRYB[14][0] , \CARRYB[13][1] , \CARRYB[13][0] , \CARRYB[12][2] ,
         \CARRYB[12][1] , \CARRYB[12][0] , \CARRYB[11][3] , \CARRYB[11][2] ,
         \CARRYB[11][1] , \CARRYB[11][0] , \CARRYB[10][4] , \CARRYB[10][3] ,
         \CARRYB[10][2] , \CARRYB[10][1] , \CARRYB[10][0] , \CARRYB[9][5] ,
         \CARRYB[9][4] , \CARRYB[9][3] , \CARRYB[9][2] , \CARRYB[9][1] ,
         \CARRYB[9][0] , \CARRYB[8][6] , \CARRYB[8][5] , \CARRYB[8][4] ,
         \CARRYB[8][3] , \CARRYB[8][2] , \CARRYB[8][1] , \CARRYB[8][0] ,
         \CARRYB[7][7] , \CARRYB[7][6] , \CARRYB[7][5] , \CARRYB[7][4] ,
         \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] , \CARRYB[7][0] ,
         \CARRYB[6][8] , \CARRYB[6][7] , \CARRYB[6][6] , \CARRYB[6][5] ,
         \CARRYB[6][4] , \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] ,
         \CARRYB[6][0] , \CARRYB[5][9] , \CARRYB[5][8] , \CARRYB[5][7] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][10] ,
         \CARRYB[4][9] , \CARRYB[4][8] , \CARRYB[4][7] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][11] , \CARRYB[3][10] ,
         \CARRYB[3][9] , \CARRYB[3][8] , \CARRYB[3][7] , \CARRYB[3][6] ,
         \CARRYB[3][5] , \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] ,
         \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][12] , \CARRYB[2][11] ,
         \CARRYB[2][10] , \CARRYB[2][9] , \CARRYB[2][8] , \CARRYB[2][7] ,
         \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] , \CARRYB[2][3] ,
         \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] , \SUMB[15][0] ,
         \SUMB[14][1] , \SUMB[13][2] , \SUMB[13][1] , \SUMB[12][3] ,
         \SUMB[12][2] , \SUMB[12][1] , \SUMB[11][4] , \SUMB[11][3] ,
         \SUMB[11][2] , \SUMB[11][1] , \SUMB[10][5] , \SUMB[10][4] ,
         \SUMB[10][3] , \SUMB[10][2] , \SUMB[10][1] , \SUMB[9][6] ,
         \SUMB[9][5] , \SUMB[9][4] , \SUMB[9][3] , \SUMB[9][2] , \SUMB[9][1] ,
         \SUMB[8][7] , \SUMB[8][6] , \SUMB[8][5] , \SUMB[8][4] , \SUMB[8][3] ,
         \SUMB[8][2] , \SUMB[8][1] , \SUMB[7][8] , \SUMB[7][7] , \SUMB[7][6] ,
         \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] , \SUMB[7][1] ,
         \SUMB[6][9] , \SUMB[6][8] , \SUMB[6][7] , \SUMB[6][6] , \SUMB[6][5] ,
         \SUMB[6][4] , \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][10] ,
         \SUMB[5][9] , \SUMB[5][8] , \SUMB[5][7] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][11] ,
         \SUMB[4][10] , \SUMB[4][9] , \SUMB[4][8] , \SUMB[4][7] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][12] , \SUMB[3][11] , \SUMB[3][10] , \SUMB[3][9] ,
         \SUMB[3][8] , \SUMB[3][7] , \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] ,
         \SUMB[3][3] , \SUMB[3][2] , \SUMB[3][1] , \SUMB[2][13] ,
         \SUMB[2][12] , \SUMB[2][11] , \SUMB[2][10] , \SUMB[2][9] ,
         \SUMB[2][8] , \SUMB[2][7] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] ,
         \SUMB[2][3] , \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][14] ,
         \SUMB[1][13] , \SUMB[1][12] , \SUMB[1][11] , \SUMB[1][10] ,
         \SUMB[1][9] , \SUMB[1][8] , \SUMB[1][7] , \SUMB[1][6] , \SUMB[1][5] ,
         \SUMB[1][4] , \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , ZA, ZB, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48;
  assign ZA = A[15];
  assign ZB = B[15];

  FAX1 S14_15_0 ( .A(ZA), .B(ZB), .C(\SUMB[15][0] ), .YS(PRODUCT[15]) );
  FAX1 S4_0 ( .A(\ab[15][0] ), .B(\CARRYB[14][0] ), .C(\SUMB[14][1] ), .YS(
        \SUMB[15][0] ) );
  FAX1 S1_14_0 ( .A(\ab[14][0] ), .B(\CARRYB[13][0] ), .C(\SUMB[13][1] ), .YC(
        \CARRYB[14][0] ), .YS(PRODUCT[14]) );
  FAX1 S2_14_1 ( .A(\ab[14][1] ), .B(\CARRYB[13][1] ), .C(\SUMB[13][2] ), .YS(
        \SUMB[14][1] ) );
  FAX1 S1_13_0 ( .A(\ab[13][0] ), .B(\CARRYB[12][0] ), .C(\SUMB[12][1] ), .YC(
        \CARRYB[13][0] ), .YS(PRODUCT[13]) );
  FAX1 S2_13_1 ( .A(\ab[13][1] ), .B(\CARRYB[12][1] ), .C(\SUMB[12][2] ), .YC(
        \CARRYB[13][1] ), .YS(\SUMB[13][1] ) );
  FAX1 S2_13_2 ( .A(\ab[13][2] ), .B(\CARRYB[12][2] ), .C(\SUMB[12][3] ), .YS(
        \SUMB[13][2] ) );
  FAX1 S1_12_0 ( .A(\ab[12][0] ), .B(\CARRYB[11][0] ), .C(\SUMB[11][1] ), .YC(
        \CARRYB[12][0] ), .YS(PRODUCT[12]) );
  FAX1 S2_12_1 ( .A(\ab[12][1] ), .B(\CARRYB[11][1] ), .C(\SUMB[11][2] ), .YC(
        \CARRYB[12][1] ), .YS(\SUMB[12][1] ) );
  FAX1 S2_12_2 ( .A(\ab[12][2] ), .B(\CARRYB[11][2] ), .C(\SUMB[11][3] ), .YC(
        \CARRYB[12][2] ), .YS(\SUMB[12][2] ) );
  FAX1 S2_12_3 ( .A(\ab[12][3] ), .B(\CARRYB[11][3] ), .C(\SUMB[11][4] ), .YS(
        \SUMB[12][3] ) );
  FAX1 S1_11_0 ( .A(\ab[11][0] ), .B(\CARRYB[10][0] ), .C(\SUMB[10][1] ), .YC(
        \CARRYB[11][0] ), .YS(PRODUCT[11]) );
  FAX1 S2_11_1 ( .A(\ab[11][1] ), .B(\CARRYB[10][1] ), .C(\SUMB[10][2] ), .YC(
        \CARRYB[11][1] ), .YS(\SUMB[11][1] ) );
  FAX1 S2_11_2 ( .A(\ab[11][2] ), .B(\CARRYB[10][2] ), .C(\SUMB[10][3] ), .YC(
        \CARRYB[11][2] ), .YS(\SUMB[11][2] ) );
  FAX1 S2_11_3 ( .A(\ab[11][3] ), .B(\CARRYB[10][3] ), .C(\SUMB[10][4] ), .YC(
        \CARRYB[11][3] ), .YS(\SUMB[11][3] ) );
  FAX1 S2_11_4 ( .A(\ab[11][4] ), .B(\CARRYB[10][4] ), .C(\SUMB[10][5] ), .YS(
        \SUMB[11][4] ) );
  FAX1 S1_10_0 ( .A(\ab[10][0] ), .B(\CARRYB[9][0] ), .C(\SUMB[9][1] ), .YC(
        \CARRYB[10][0] ), .YS(PRODUCT[10]) );
  FAX1 S2_10_1 ( .A(\ab[10][1] ), .B(\CARRYB[9][1] ), .C(\SUMB[9][2] ), .YC(
        \CARRYB[10][1] ), .YS(\SUMB[10][1] ) );
  FAX1 S2_10_2 ( .A(\ab[10][2] ), .B(\CARRYB[9][2] ), .C(\SUMB[9][3] ), .YC(
        \CARRYB[10][2] ), .YS(\SUMB[10][2] ) );
  FAX1 S2_10_3 ( .A(\ab[10][3] ), .B(\CARRYB[9][3] ), .C(\SUMB[9][4] ), .YC(
        \CARRYB[10][3] ), .YS(\SUMB[10][3] ) );
  FAX1 S2_10_4 ( .A(\ab[10][4] ), .B(\CARRYB[9][4] ), .C(\SUMB[9][5] ), .YC(
        \CARRYB[10][4] ), .YS(\SUMB[10][4] ) );
  FAX1 S2_10_5 ( .A(\ab[10][5] ), .B(\CARRYB[9][5] ), .C(\SUMB[9][6] ), .YS(
        \SUMB[10][5] ) );
  FAX1 S1_9_0 ( .A(\ab[9][0] ), .B(\CARRYB[8][0] ), .C(\SUMB[8][1] ), .YC(
        \CARRYB[9][0] ), .YS(PRODUCT[9]) );
  FAX1 S2_9_1 ( .A(\ab[9][1] ), .B(\CARRYB[8][1] ), .C(\SUMB[8][2] ), .YC(
        \CARRYB[9][1] ), .YS(\SUMB[9][1] ) );
  FAX1 S2_9_2 ( .A(\ab[9][2] ), .B(\CARRYB[8][2] ), .C(\SUMB[8][3] ), .YC(
        \CARRYB[9][2] ), .YS(\SUMB[9][2] ) );
  FAX1 S2_9_3 ( .A(\ab[9][3] ), .B(\CARRYB[8][3] ), .C(\SUMB[8][4] ), .YC(
        \CARRYB[9][3] ), .YS(\SUMB[9][3] ) );
  FAX1 S2_9_4 ( .A(\ab[9][4] ), .B(\CARRYB[8][4] ), .C(\SUMB[8][5] ), .YC(
        \CARRYB[9][4] ), .YS(\SUMB[9][4] ) );
  FAX1 S2_9_5 ( .A(\ab[9][5] ), .B(\CARRYB[8][5] ), .C(\SUMB[8][6] ), .YC(
        \CARRYB[9][5] ), .YS(\SUMB[9][5] ) );
  FAX1 S2_9_6 ( .A(\ab[9][6] ), .B(\CARRYB[8][6] ), .C(\SUMB[8][7] ), .YS(
        \SUMB[9][6] ) );
  FAX1 S1_8_0 ( .A(\ab[8][0] ), .B(\CARRYB[7][0] ), .C(\SUMB[7][1] ), .YC(
        \CARRYB[8][0] ), .YS(PRODUCT[8]) );
  FAX1 S2_8_1 ( .A(\ab[8][1] ), .B(\CARRYB[7][1] ), .C(\SUMB[7][2] ), .YC(
        \CARRYB[8][1] ), .YS(\SUMB[8][1] ) );
  FAX1 S2_8_2 ( .A(\ab[8][2] ), .B(\CARRYB[7][2] ), .C(\SUMB[7][3] ), .YC(
        \CARRYB[8][2] ), .YS(\SUMB[8][2] ) );
  FAX1 S2_8_3 ( .A(\ab[8][3] ), .B(\CARRYB[7][3] ), .C(\SUMB[7][4] ), .YC(
        \CARRYB[8][3] ), .YS(\SUMB[8][3] ) );
  FAX1 S2_8_4 ( .A(\ab[8][4] ), .B(\CARRYB[7][4] ), .C(\SUMB[7][5] ), .YC(
        \CARRYB[8][4] ), .YS(\SUMB[8][4] ) );
  FAX1 S2_8_5 ( .A(\ab[8][5] ), .B(\CARRYB[7][5] ), .C(\SUMB[7][6] ), .YC(
        \CARRYB[8][5] ), .YS(\SUMB[8][5] ) );
  FAX1 S2_8_6 ( .A(\ab[8][6] ), .B(\CARRYB[7][6] ), .C(\SUMB[7][7] ), .YC(
        \CARRYB[8][6] ), .YS(\SUMB[8][6] ) );
  FAX1 S2_8_7 ( .A(\ab[8][7] ), .B(\CARRYB[7][7] ), .C(\SUMB[7][8] ), .YS(
        \SUMB[8][7] ) );
  FAX1 S1_7_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .C(\SUMB[6][1] ), .YC(
        \CARRYB[7][0] ), .YS(PRODUCT[7]) );
  FAX1 S2_7_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .C(\SUMB[6][2] ), .YC(
        \CARRYB[7][1] ), .YS(\SUMB[7][1] ) );
  FAX1 S2_7_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .C(\SUMB[6][3] ), .YC(
        \CARRYB[7][2] ), .YS(\SUMB[7][2] ) );
  FAX1 S2_7_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .C(\SUMB[6][4] ), .YC(
        \CARRYB[7][3] ), .YS(\SUMB[7][3] ) );
  FAX1 S2_7_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .C(\SUMB[6][5] ), .YC(
        \CARRYB[7][4] ), .YS(\SUMB[7][4] ) );
  FAX1 S2_7_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .C(\SUMB[6][6] ), .YC(
        \CARRYB[7][5] ), .YS(\SUMB[7][5] ) );
  FAX1 S2_7_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .C(\SUMB[6][7] ), .YC(
        \CARRYB[7][6] ), .YS(\SUMB[7][6] ) );
  FAX1 S2_7_7 ( .A(\ab[7][7] ), .B(\CARRYB[6][7] ), .C(\SUMB[6][8] ), .YC(
        \CARRYB[7][7] ), .YS(\SUMB[7][7] ) );
  FAX1 S2_7_8 ( .A(\ab[7][8] ), .B(\CARRYB[6][8] ), .C(\SUMB[6][9] ), .YS(
        \SUMB[7][8] ) );
  FAX1 S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .C(\SUMB[5][1] ), .YC(
        \CARRYB[6][0] ), .YS(PRODUCT[6]) );
  FAX1 S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .C(\SUMB[5][2] ), .YC(
        \CARRYB[6][1] ), .YS(\SUMB[6][1] ) );
  FAX1 S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .C(\SUMB[5][3] ), .YC(
        \CARRYB[6][2] ), .YS(\SUMB[6][2] ) );
  FAX1 S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .C(\SUMB[5][4] ), .YC(
        \CARRYB[6][3] ), .YS(\SUMB[6][3] ) );
  FAX1 S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .C(\SUMB[5][5] ), .YC(
        \CARRYB[6][4] ), .YS(\SUMB[6][4] ) );
  FAX1 S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .C(\SUMB[5][6] ), .YC(
        \CARRYB[6][5] ), .YS(\SUMB[6][5] ) );
  FAX1 S2_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .C(\SUMB[5][7] ), .YC(
        \CARRYB[6][6] ), .YS(\SUMB[6][6] ) );
  FAX1 S2_6_7 ( .A(\ab[6][7] ), .B(\CARRYB[5][7] ), .C(\SUMB[5][8] ), .YC(
        \CARRYB[6][7] ), .YS(\SUMB[6][7] ) );
  FAX1 S2_6_8 ( .A(\ab[6][8] ), .B(\CARRYB[5][8] ), .C(\SUMB[5][9] ), .YC(
        \CARRYB[6][8] ), .YS(\SUMB[6][8] ) );
  FAX1 S2_6_9 ( .A(\ab[6][9] ), .B(\CARRYB[5][9] ), .C(\SUMB[5][10] ), .YS(
        \SUMB[6][9] ) );
  FAX1 S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .C(\SUMB[4][1] ), .YC(
        \CARRYB[5][0] ), .YS(PRODUCT[5]) );
  FAX1 S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .C(\SUMB[4][2] ), .YC(
        \CARRYB[5][1] ), .YS(\SUMB[5][1] ) );
  FAX1 S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .C(\SUMB[4][3] ), .YC(
        \CARRYB[5][2] ), .YS(\SUMB[5][2] ) );
  FAX1 S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .C(\SUMB[4][4] ), .YC(
        \CARRYB[5][3] ), .YS(\SUMB[5][3] ) );
  FAX1 S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .C(\SUMB[4][5] ), .YC(
        \CARRYB[5][4] ), .YS(\SUMB[5][4] ) );
  FAX1 S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .C(\SUMB[4][6] ), .YC(
        \CARRYB[5][5] ), .YS(\SUMB[5][5] ) );
  FAX1 S2_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .C(\SUMB[4][7] ), .YC(
        \CARRYB[5][6] ), .YS(\SUMB[5][6] ) );
  FAX1 S2_5_7 ( .A(\ab[5][7] ), .B(\CARRYB[4][7] ), .C(\SUMB[4][8] ), .YC(
        \CARRYB[5][7] ), .YS(\SUMB[5][7] ) );
  FAX1 S2_5_8 ( .A(\ab[5][8] ), .B(\CARRYB[4][8] ), .C(\SUMB[4][9] ), .YC(
        \CARRYB[5][8] ), .YS(\SUMB[5][8] ) );
  FAX1 S2_5_9 ( .A(\ab[5][9] ), .B(\CARRYB[4][9] ), .C(\SUMB[4][10] ), .YC(
        \CARRYB[5][9] ), .YS(\SUMB[5][9] ) );
  FAX1 S2_5_10 ( .A(\ab[5][10] ), .B(\CARRYB[4][10] ), .C(\SUMB[4][11] ), .YS(
        \SUMB[5][10] ) );
  FAX1 S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .C(\SUMB[3][1] ), .YC(
        \CARRYB[4][0] ), .YS(PRODUCT[4]) );
  FAX1 S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .C(\SUMB[3][2] ), .YC(
        \CARRYB[4][1] ), .YS(\SUMB[4][1] ) );
  FAX1 S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .C(\SUMB[3][3] ), .YC(
        \CARRYB[4][2] ), .YS(\SUMB[4][2] ) );
  FAX1 S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .C(\SUMB[3][4] ), .YC(
        \CARRYB[4][3] ), .YS(\SUMB[4][3] ) );
  FAX1 S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .C(\SUMB[3][5] ), .YC(
        \CARRYB[4][4] ), .YS(\SUMB[4][4] ) );
  FAX1 S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .C(\SUMB[3][6] ), .YC(
        \CARRYB[4][5] ), .YS(\SUMB[4][5] ) );
  FAX1 S2_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .C(\SUMB[3][7] ), .YC(
        \CARRYB[4][6] ), .YS(\SUMB[4][6] ) );
  FAX1 S2_4_7 ( .A(\ab[4][7] ), .B(\CARRYB[3][7] ), .C(\SUMB[3][8] ), .YC(
        \CARRYB[4][7] ), .YS(\SUMB[4][7] ) );
  FAX1 S2_4_8 ( .A(\ab[4][8] ), .B(\CARRYB[3][8] ), .C(\SUMB[3][9] ), .YC(
        \CARRYB[4][8] ), .YS(\SUMB[4][8] ) );
  FAX1 S2_4_9 ( .A(\ab[4][9] ), .B(\CARRYB[3][9] ), .C(\SUMB[3][10] ), .YC(
        \CARRYB[4][9] ), .YS(\SUMB[4][9] ) );
  FAX1 S2_4_10 ( .A(\ab[4][10] ), .B(\CARRYB[3][10] ), .C(\SUMB[3][11] ), .YC(
        \CARRYB[4][10] ), .YS(\SUMB[4][10] ) );
  FAX1 S2_4_11 ( .A(\ab[4][11] ), .B(\CARRYB[3][11] ), .C(\SUMB[3][12] ), .YS(
        \SUMB[4][11] ) );
  FAX1 S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .C(\SUMB[2][1] ), .YC(
        \CARRYB[3][0] ), .YS(PRODUCT[3]) );
  FAX1 S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .C(\SUMB[2][2] ), .YC(
        \CARRYB[3][1] ), .YS(\SUMB[3][1] ) );
  FAX1 S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .C(\SUMB[2][3] ), .YC(
        \CARRYB[3][2] ), .YS(\SUMB[3][2] ) );
  FAX1 S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .C(\SUMB[2][4] ), .YC(
        \CARRYB[3][3] ), .YS(\SUMB[3][3] ) );
  FAX1 S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .C(\SUMB[2][5] ), .YC(
        \CARRYB[3][4] ), .YS(\SUMB[3][4] ) );
  FAX1 S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .C(\SUMB[2][6] ), .YC(
        \CARRYB[3][5] ), .YS(\SUMB[3][5] ) );
  FAX1 S2_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .C(\SUMB[2][7] ), .YC(
        \CARRYB[3][6] ), .YS(\SUMB[3][6] ) );
  FAX1 S2_3_7 ( .A(\ab[3][7] ), .B(\CARRYB[2][7] ), .C(\SUMB[2][8] ), .YC(
        \CARRYB[3][7] ), .YS(\SUMB[3][7] ) );
  FAX1 S2_3_8 ( .A(\ab[3][8] ), .B(\CARRYB[2][8] ), .C(\SUMB[2][9] ), .YC(
        \CARRYB[3][8] ), .YS(\SUMB[3][8] ) );
  FAX1 S2_3_9 ( .A(\ab[3][9] ), .B(\CARRYB[2][9] ), .C(\SUMB[2][10] ), .YC(
        \CARRYB[3][9] ), .YS(\SUMB[3][9] ) );
  FAX1 S2_3_10 ( .A(\ab[3][10] ), .B(\CARRYB[2][10] ), .C(\SUMB[2][11] ), .YC(
        \CARRYB[3][10] ), .YS(\SUMB[3][10] ) );
  FAX1 S2_3_11 ( .A(\ab[3][11] ), .B(\CARRYB[2][11] ), .C(\SUMB[2][12] ), .YC(
        \CARRYB[3][11] ), .YS(\SUMB[3][11] ) );
  FAX1 S2_3_12 ( .A(\ab[3][12] ), .B(\CARRYB[2][12] ), .C(\SUMB[2][13] ), .YS(
        \SUMB[3][12] ) );
  FAX1 S1_2_0 ( .A(\ab[2][0] ), .B(n3), .C(\SUMB[1][1] ), .YC(\CARRYB[2][0] ), 
        .YS(PRODUCT[2]) );
  FAX1 S2_2_1 ( .A(\ab[2][1] ), .B(n4), .C(\SUMB[1][2] ), .YC(\CARRYB[2][1] ), 
        .YS(\SUMB[2][1] ) );
  FAX1 S2_2_2 ( .A(\ab[2][2] ), .B(n5), .C(\SUMB[1][3] ), .YC(\CARRYB[2][2] ), 
        .YS(\SUMB[2][2] ) );
  FAX1 S2_2_3 ( .A(\ab[2][3] ), .B(n6), .C(\SUMB[1][4] ), .YC(\CARRYB[2][3] ), 
        .YS(\SUMB[2][3] ) );
  FAX1 S2_2_4 ( .A(\ab[2][4] ), .B(n7), .C(\SUMB[1][5] ), .YC(\CARRYB[2][4] ), 
        .YS(\SUMB[2][4] ) );
  FAX1 S2_2_5 ( .A(\ab[2][5] ), .B(n8), .C(\SUMB[1][6] ), .YC(\CARRYB[2][5] ), 
        .YS(\SUMB[2][5] ) );
  FAX1 S2_2_6 ( .A(\ab[2][6] ), .B(n9), .C(\SUMB[1][7] ), .YC(\CARRYB[2][6] ), 
        .YS(\SUMB[2][6] ) );
  FAX1 S2_2_7 ( .A(\ab[2][7] ), .B(n10), .C(\SUMB[1][8] ), .YC(\CARRYB[2][7] ), 
        .YS(\SUMB[2][7] ) );
  FAX1 S2_2_8 ( .A(\ab[2][8] ), .B(n11), .C(\SUMB[1][9] ), .YC(\CARRYB[2][8] ), 
        .YS(\SUMB[2][8] ) );
  FAX1 S2_2_9 ( .A(\ab[2][9] ), .B(n16), .C(\SUMB[1][10] ), .YC(\CARRYB[2][9] ), .YS(\SUMB[2][9] ) );
  FAX1 S2_2_10 ( .A(\ab[2][10] ), .B(n15), .C(\SUMB[1][11] ), .YC(
        \CARRYB[2][10] ), .YS(\SUMB[2][10] ) );
  FAX1 S2_2_11 ( .A(\ab[2][11] ), .B(n14), .C(\SUMB[1][12] ), .YC(
        \CARRYB[2][11] ), .YS(\SUMB[2][11] ) );
  FAX1 S2_2_12 ( .A(\ab[2][12] ), .B(n13), .C(\SUMB[1][13] ), .YC(
        \CARRYB[2][12] ), .YS(\SUMB[2][12] ) );
  FAX1 S2_2_13 ( .A(\ab[2][13] ), .B(n12), .C(\SUMB[1][14] ), .YS(
        \SUMB[2][13] ) );
  AND2X2 U2 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n3) );
  AND2X2 U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2 U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2 U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2 U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2 U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2 U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2 U9 ( .A(\ab[0][8] ), .B(\ab[1][7] ), .Y(n10) );
  AND2X2 U10 ( .A(\ab[0][9] ), .B(\ab[1][8] ), .Y(n11) );
  AND2X2 U11 ( .A(\ab[0][14] ), .B(\ab[1][13] ), .Y(n12) );
  AND2X2 U12 ( .A(\ab[0][13] ), .B(\ab[1][12] ), .Y(n13) );
  AND2X2 U13 ( .A(\ab[0][12] ), .B(\ab[1][11] ), .Y(n14) );
  AND2X2 U14 ( .A(\ab[0][11] ), .B(\ab[1][10] ), .Y(n15) );
  AND2X2 U15 ( .A(\ab[0][10] ), .B(\ab[1][9] ), .Y(n16) );
  INVX2 U16 ( .A(A[0]), .Y(n48) );
  INVX2 U17 ( .A(A[1]), .Y(n47) );
  INVX2 U18 ( .A(B[0]), .Y(n32) );
  INVX2 U19 ( .A(B[1]), .Y(n31) );
  INVX2 U20 ( .A(A[2]), .Y(n46) );
  INVX2 U21 ( .A(B[2]), .Y(n30) );
  INVX2 U22 ( .A(A[3]), .Y(n45) );
  INVX2 U23 ( .A(B[3]), .Y(n29) );
  INVX2 U24 ( .A(A[4]), .Y(n44) );
  INVX2 U25 ( .A(B[4]), .Y(n28) );
  INVX2 U26 ( .A(A[5]), .Y(n43) );
  INVX2 U27 ( .A(B[5]), .Y(n27) );
  INVX2 U28 ( .A(A[6]), .Y(n42) );
  INVX2 U29 ( .A(B[6]), .Y(n26) );
  INVX2 U30 ( .A(A[7]), .Y(n41) );
  INVX2 U31 ( .A(B[7]), .Y(n25) );
  XOR2X1 U32 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XOR2X1 U33 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  XOR2X1 U34 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1 U35 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2X1 U36 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1 U37 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  XOR2X1 U38 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1 U39 ( .A(\ab[1][7] ), .B(\ab[0][8] ), .Y(\SUMB[1][7] ) );
  XOR2X1 U40 ( .A(\ab[1][8] ), .B(\ab[0][9] ), .Y(\SUMB[1][8] ) );
  XOR2X1 U41 ( .A(\ab[1][9] ), .B(\ab[0][10] ), .Y(\SUMB[1][9] ) );
  XOR2X1 U42 ( .A(\ab[1][10] ), .B(\ab[0][11] ), .Y(\SUMB[1][10] ) );
  XOR2X1 U43 ( .A(\ab[1][11] ), .B(\ab[0][12] ), .Y(\SUMB[1][11] ) );
  XOR2X1 U44 ( .A(\ab[1][12] ), .B(\ab[0][13] ), .Y(\SUMB[1][12] ) );
  XOR2X1 U45 ( .A(\ab[1][13] ), .B(\ab[0][14] ), .Y(\SUMB[1][13] ) );
  XOR2X1 U46 ( .A(\ab[1][14] ), .B(\ab[0][15] ), .Y(\SUMB[1][14] ) );
  INVX2 U47 ( .A(ZB), .Y(n17) );
  INVX2 U48 ( .A(B[14]), .Y(n18) );
  INVX2 U49 ( .A(B[13]), .Y(n19) );
  INVX2 U50 ( .A(B[12]), .Y(n20) );
  INVX2 U51 ( .A(B[11]), .Y(n21) );
  INVX2 U52 ( .A(B[10]), .Y(n22) );
  INVX2 U53 ( .A(B[9]), .Y(n23) );
  INVX2 U54 ( .A(B[8]), .Y(n24) );
  INVX2 U55 ( .A(ZA), .Y(n33) );
  INVX2 U56 ( .A(A[14]), .Y(n34) );
  INVX2 U57 ( .A(A[13]), .Y(n35) );
  INVX2 U58 ( .A(A[12]), .Y(n36) );
  INVX2 U59 ( .A(A[11]), .Y(n37) );
  INVX2 U60 ( .A(A[10]), .Y(n38) );
  INVX2 U61 ( .A(A[9]), .Y(n39) );
  INVX2 U62 ( .A(A[8]), .Y(n40) );
  NOR2X1 U63 ( .A(n39), .B(n26), .Y(\ab[9][6] ) );
  NOR2X1 U64 ( .A(n39), .B(n27), .Y(\ab[9][5] ) );
  NOR2X1 U65 ( .A(n39), .B(n28), .Y(\ab[9][4] ) );
  NOR2X1 U66 ( .A(n39), .B(n29), .Y(\ab[9][3] ) );
  NOR2X1 U67 ( .A(n39), .B(n30), .Y(\ab[9][2] ) );
  NOR2X1 U68 ( .A(n39), .B(n31), .Y(\ab[9][1] ) );
  NOR2X1 U69 ( .A(n39), .B(n32), .Y(\ab[9][0] ) );
  NOR2X1 U70 ( .A(n25), .B(n40), .Y(\ab[8][7] ) );
  NOR2X1 U71 ( .A(n26), .B(n40), .Y(\ab[8][6] ) );
  NOR2X1 U72 ( .A(n27), .B(n40), .Y(\ab[8][5] ) );
  NOR2X1 U73 ( .A(n28), .B(n40), .Y(\ab[8][4] ) );
  NOR2X1 U74 ( .A(n29), .B(n40), .Y(\ab[8][3] ) );
  NOR2X1 U75 ( .A(n30), .B(n40), .Y(\ab[8][2] ) );
  NOR2X1 U76 ( .A(n31), .B(n40), .Y(\ab[8][1] ) );
  NOR2X1 U77 ( .A(n32), .B(n40), .Y(\ab[8][0] ) );
  NOR2X1 U78 ( .A(n24), .B(n41), .Y(\ab[7][8] ) );
  NOR2X1 U79 ( .A(n25), .B(n41), .Y(\ab[7][7] ) );
  NOR2X1 U80 ( .A(n26), .B(n41), .Y(\ab[7][6] ) );
  NOR2X1 U81 ( .A(n27), .B(n41), .Y(\ab[7][5] ) );
  NOR2X1 U82 ( .A(n28), .B(n41), .Y(\ab[7][4] ) );
  NOR2X1 U83 ( .A(n29), .B(n41), .Y(\ab[7][3] ) );
  NOR2X1 U84 ( .A(n30), .B(n41), .Y(\ab[7][2] ) );
  NOR2X1 U85 ( .A(n31), .B(n41), .Y(\ab[7][1] ) );
  NOR2X1 U86 ( .A(n32), .B(n41), .Y(\ab[7][0] ) );
  NOR2X1 U87 ( .A(n23), .B(n42), .Y(\ab[6][9] ) );
  NOR2X1 U88 ( .A(n24), .B(n42), .Y(\ab[6][8] ) );
  NOR2X1 U89 ( .A(n25), .B(n42), .Y(\ab[6][7] ) );
  NOR2X1 U90 ( .A(n26), .B(n42), .Y(\ab[6][6] ) );
  NOR2X1 U91 ( .A(n27), .B(n42), .Y(\ab[6][5] ) );
  NOR2X1 U92 ( .A(n28), .B(n42), .Y(\ab[6][4] ) );
  NOR2X1 U93 ( .A(n29), .B(n42), .Y(\ab[6][3] ) );
  NOR2X1 U94 ( .A(n30), .B(n42), .Y(\ab[6][2] ) );
  NOR2X1 U95 ( .A(n31), .B(n42), .Y(\ab[6][1] ) );
  NOR2X1 U96 ( .A(n32), .B(n42), .Y(\ab[6][0] ) );
  NOR2X1 U97 ( .A(n23), .B(n43), .Y(\ab[5][9] ) );
  NOR2X1 U98 ( .A(n24), .B(n43), .Y(\ab[5][8] ) );
  NOR2X1 U99 ( .A(n25), .B(n43), .Y(\ab[5][7] ) );
  NOR2X1 U100 ( .A(n26), .B(n43), .Y(\ab[5][6] ) );
  NOR2X1 U101 ( .A(n27), .B(n43), .Y(\ab[5][5] ) );
  NOR2X1 U102 ( .A(n28), .B(n43), .Y(\ab[5][4] ) );
  NOR2X1 U103 ( .A(n29), .B(n43), .Y(\ab[5][3] ) );
  NOR2X1 U104 ( .A(n30), .B(n43), .Y(\ab[5][2] ) );
  NOR2X1 U105 ( .A(n31), .B(n43), .Y(\ab[5][1] ) );
  NOR2X1 U106 ( .A(n22), .B(n43), .Y(\ab[5][10] ) );
  NOR2X1 U107 ( .A(n32), .B(n43), .Y(\ab[5][0] ) );
  NOR2X1 U108 ( .A(n23), .B(n44), .Y(\ab[4][9] ) );
  NOR2X1 U109 ( .A(n24), .B(n44), .Y(\ab[4][8] ) );
  NOR2X1 U110 ( .A(n25), .B(n44), .Y(\ab[4][7] ) );
  NOR2X1 U111 ( .A(n26), .B(n44), .Y(\ab[4][6] ) );
  NOR2X1 U112 ( .A(n27), .B(n44), .Y(\ab[4][5] ) );
  NOR2X1 U113 ( .A(n28), .B(n44), .Y(\ab[4][4] ) );
  NOR2X1 U114 ( .A(n29), .B(n44), .Y(\ab[4][3] ) );
  NOR2X1 U115 ( .A(n30), .B(n44), .Y(\ab[4][2] ) );
  NOR2X1 U116 ( .A(n31), .B(n44), .Y(\ab[4][1] ) );
  NOR2X1 U117 ( .A(n21), .B(n44), .Y(\ab[4][11] ) );
  NOR2X1 U118 ( .A(n22), .B(n44), .Y(\ab[4][10] ) );
  NOR2X1 U119 ( .A(n32), .B(n44), .Y(\ab[4][0] ) );
  NOR2X1 U120 ( .A(n23), .B(n45), .Y(\ab[3][9] ) );
  NOR2X1 U121 ( .A(n24), .B(n45), .Y(\ab[3][8] ) );
  NOR2X1 U122 ( .A(n25), .B(n45), .Y(\ab[3][7] ) );
  NOR2X1 U123 ( .A(n26), .B(n45), .Y(\ab[3][6] ) );
  NOR2X1 U124 ( .A(n27), .B(n45), .Y(\ab[3][5] ) );
  NOR2X1 U125 ( .A(n28), .B(n45), .Y(\ab[3][4] ) );
  NOR2X1 U126 ( .A(n29), .B(n45), .Y(\ab[3][3] ) );
  NOR2X1 U127 ( .A(n30), .B(n45), .Y(\ab[3][2] ) );
  NOR2X1 U128 ( .A(n31), .B(n45), .Y(\ab[3][1] ) );
  NOR2X1 U129 ( .A(n20), .B(n45), .Y(\ab[3][12] ) );
  NOR2X1 U130 ( .A(n21), .B(n45), .Y(\ab[3][11] ) );
  NOR2X1 U131 ( .A(n22), .B(n45), .Y(\ab[3][10] ) );
  NOR2X1 U132 ( .A(n32), .B(n45), .Y(\ab[3][0] ) );
  NOR2X1 U133 ( .A(n23), .B(n46), .Y(\ab[2][9] ) );
  NOR2X1 U134 ( .A(n24), .B(n46), .Y(\ab[2][8] ) );
  NOR2X1 U135 ( .A(n25), .B(n46), .Y(\ab[2][7] ) );
  NOR2X1 U136 ( .A(n26), .B(n46), .Y(\ab[2][6] ) );
  NOR2X1 U137 ( .A(n27), .B(n46), .Y(\ab[2][5] ) );
  NOR2X1 U138 ( .A(n28), .B(n46), .Y(\ab[2][4] ) );
  NOR2X1 U139 ( .A(n29), .B(n46), .Y(\ab[2][3] ) );
  NOR2X1 U140 ( .A(n30), .B(n46), .Y(\ab[2][2] ) );
  NOR2X1 U141 ( .A(n31), .B(n46), .Y(\ab[2][1] ) );
  NOR2X1 U142 ( .A(n19), .B(n46), .Y(\ab[2][13] ) );
  NOR2X1 U143 ( .A(n20), .B(n46), .Y(\ab[2][12] ) );
  NOR2X1 U144 ( .A(n21), .B(n46), .Y(\ab[2][11] ) );
  NOR2X1 U145 ( .A(n22), .B(n46), .Y(\ab[2][10] ) );
  NOR2X1 U146 ( .A(n32), .B(n46), .Y(\ab[2][0] ) );
  NOR2X1 U147 ( .A(n23), .B(n47), .Y(\ab[1][9] ) );
  NOR2X1 U148 ( .A(n24), .B(n47), .Y(\ab[1][8] ) );
  NOR2X1 U149 ( .A(n25), .B(n47), .Y(\ab[1][7] ) );
  NOR2X1 U150 ( .A(n26), .B(n47), .Y(\ab[1][6] ) );
  NOR2X1 U151 ( .A(n27), .B(n47), .Y(\ab[1][5] ) );
  NOR2X1 U152 ( .A(n28), .B(n47), .Y(\ab[1][4] ) );
  NOR2X1 U153 ( .A(n29), .B(n47), .Y(\ab[1][3] ) );
  NOR2X1 U154 ( .A(n30), .B(n47), .Y(\ab[1][2] ) );
  NOR2X1 U155 ( .A(n31), .B(n47), .Y(\ab[1][1] ) );
  NOR2X1 U156 ( .A(n18), .B(n47), .Y(\ab[1][14] ) );
  NOR2X1 U157 ( .A(n19), .B(n47), .Y(\ab[1][13] ) );
  NOR2X1 U158 ( .A(n20), .B(n47), .Y(\ab[1][12] ) );
  NOR2X1 U159 ( .A(n21), .B(n47), .Y(\ab[1][11] ) );
  NOR2X1 U160 ( .A(n22), .B(n47), .Y(\ab[1][10] ) );
  NOR2X1 U161 ( .A(n32), .B(n47), .Y(\ab[1][0] ) );
  NOR2X1 U162 ( .A(B[0]), .B(n33), .Y(\ab[15][0] ) );
  NOR2X1 U163 ( .A(n31), .B(n34), .Y(\ab[14][1] ) );
  NOR2X1 U164 ( .A(n32), .B(n34), .Y(\ab[14][0] ) );
  NOR2X1 U165 ( .A(n30), .B(n35), .Y(\ab[13][2] ) );
  NOR2X1 U166 ( .A(n31), .B(n35), .Y(\ab[13][1] ) );
  NOR2X1 U167 ( .A(n32), .B(n35), .Y(\ab[13][0] ) );
  NOR2X1 U168 ( .A(n29), .B(n36), .Y(\ab[12][3] ) );
  NOR2X1 U169 ( .A(n30), .B(n36), .Y(\ab[12][2] ) );
  NOR2X1 U170 ( .A(n31), .B(n36), .Y(\ab[12][1] ) );
  NOR2X1 U171 ( .A(n32), .B(n36), .Y(\ab[12][0] ) );
  NOR2X1 U172 ( .A(n28), .B(n37), .Y(\ab[11][4] ) );
  NOR2X1 U173 ( .A(n29), .B(n37), .Y(\ab[11][3] ) );
  NOR2X1 U174 ( .A(n30), .B(n37), .Y(\ab[11][2] ) );
  NOR2X1 U175 ( .A(n31), .B(n37), .Y(\ab[11][1] ) );
  NOR2X1 U176 ( .A(n32), .B(n37), .Y(\ab[11][0] ) );
  NOR2X1 U177 ( .A(n27), .B(n38), .Y(\ab[10][5] ) );
  NOR2X1 U178 ( .A(n28), .B(n38), .Y(\ab[10][4] ) );
  NOR2X1 U179 ( .A(n29), .B(n38), .Y(\ab[10][3] ) );
  NOR2X1 U180 ( .A(n30), .B(n38), .Y(\ab[10][2] ) );
  NOR2X1 U181 ( .A(n31), .B(n38), .Y(\ab[10][1] ) );
  NOR2X1 U182 ( .A(n32), .B(n38), .Y(\ab[10][0] ) );
  NOR2X1 U183 ( .A(n23), .B(n48), .Y(\ab[0][9] ) );
  NOR2X1 U184 ( .A(n24), .B(n48), .Y(\ab[0][8] ) );
  NOR2X1 U185 ( .A(n25), .B(n48), .Y(\ab[0][7] ) );
  NOR2X1 U186 ( .A(n26), .B(n48), .Y(\ab[0][6] ) );
  NOR2X1 U187 ( .A(n27), .B(n48), .Y(\ab[0][5] ) );
  NOR2X1 U188 ( .A(n28), .B(n48), .Y(\ab[0][4] ) );
  NOR2X1 U189 ( .A(n29), .B(n48), .Y(\ab[0][3] ) );
  NOR2X1 U190 ( .A(n30), .B(n48), .Y(\ab[0][2] ) );
  NOR2X1 U191 ( .A(n31), .B(n48), .Y(\ab[0][1] ) );
  NOR2X1 U192 ( .A(A[0]), .B(n17), .Y(\ab[0][15] ) );
  NOR2X1 U193 ( .A(n18), .B(n48), .Y(\ab[0][14] ) );
  NOR2X1 U194 ( .A(n19), .B(n48), .Y(\ab[0][13] ) );
  NOR2X1 U195 ( .A(n20), .B(n48), .Y(\ab[0][12] ) );
  NOR2X1 U196 ( .A(n21), .B(n48), .Y(\ab[0][11] ) );
  NOR2X1 U197 ( .A(n22), .B(n48), .Y(\ab[0][10] ) );
  NOR2X1 U198 ( .A(n32), .B(n48), .Y(PRODUCT[0]) );
endmodule


module matrix_math_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [15:0] A;
  input [15:0] B;
  output [31:0] PRODUCT;
  input TC;
  wire   \ab[15][0] , \ab[14][1] , \ab[14][0] , \ab[13][2] , \ab[13][1] ,
         \ab[13][0] , \ab[12][3] , \ab[12][2] , \ab[12][1] , \ab[12][0] ,
         \ab[11][4] , \ab[11][3] , \ab[11][2] , \ab[11][1] , \ab[11][0] ,
         \ab[10][5] , \ab[10][4] , \ab[10][3] , \ab[10][2] , \ab[10][1] ,
         \ab[10][0] , \ab[9][6] , \ab[9][5] , \ab[9][4] , \ab[9][3] ,
         \ab[9][2] , \ab[9][1] , \ab[9][0] , \ab[8][7] , \ab[8][6] ,
         \ab[8][5] , \ab[8][4] , \ab[8][3] , \ab[8][2] , \ab[8][1] ,
         \ab[8][0] , \ab[7][8] , \ab[7][7] , \ab[7][6] , \ab[7][5] ,
         \ab[7][4] , \ab[7][3] , \ab[7][2] , \ab[7][1] , \ab[7][0] ,
         \ab[6][9] , \ab[6][8] , \ab[6][7] , \ab[6][6] , \ab[6][5] ,
         \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] , \ab[6][0] ,
         \ab[5][10] , \ab[5][9] , \ab[5][8] , \ab[5][7] , \ab[5][6] ,
         \ab[5][5] , \ab[5][4] , \ab[5][3] , \ab[5][2] , \ab[5][1] ,
         \ab[5][0] , \ab[4][11] , \ab[4][10] , \ab[4][9] , \ab[4][8] ,
         \ab[4][7] , \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] ,
         \ab[4][2] , \ab[4][1] , \ab[4][0] , \ab[3][12] , \ab[3][11] ,
         \ab[3][10] , \ab[3][9] , \ab[3][8] , \ab[3][7] , \ab[3][6] ,
         \ab[3][5] , \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] ,
         \ab[3][0] , \ab[2][13] , \ab[2][12] , \ab[2][11] , \ab[2][10] ,
         \ab[2][9] , \ab[2][8] , \ab[2][7] , \ab[2][6] , \ab[2][5] ,
         \ab[2][4] , \ab[2][3] , \ab[2][2] , \ab[2][1] , \ab[2][0] ,
         \ab[1][14] , \ab[1][13] , \ab[1][12] , \ab[1][11] , \ab[1][10] ,
         \ab[1][9] , \ab[1][8] , \ab[1][7] , \ab[1][6] , \ab[1][5] ,
         \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] , \ab[1][0] ,
         \ab[0][15] , \ab[0][14] , \ab[0][13] , \ab[0][12] , \ab[0][11] ,
         \ab[0][10] , \ab[0][9] , \ab[0][8] , \ab[0][7] , \ab[0][6] ,
         \ab[0][5] , \ab[0][4] , \ab[0][3] , \ab[0][2] , \ab[0][1] ,
         \CARRYB[14][0] , \CARRYB[13][1] , \CARRYB[13][0] , \CARRYB[12][2] ,
         \CARRYB[12][1] , \CARRYB[12][0] , \CARRYB[11][3] , \CARRYB[11][2] ,
         \CARRYB[11][1] , \CARRYB[11][0] , \CARRYB[10][4] , \CARRYB[10][3] ,
         \CARRYB[10][2] , \CARRYB[10][1] , \CARRYB[10][0] , \CARRYB[9][5] ,
         \CARRYB[9][4] , \CARRYB[9][3] , \CARRYB[9][2] , \CARRYB[9][1] ,
         \CARRYB[9][0] , \CARRYB[8][6] , \CARRYB[8][5] , \CARRYB[8][4] ,
         \CARRYB[8][3] , \CARRYB[8][2] , \CARRYB[8][1] , \CARRYB[8][0] ,
         \CARRYB[7][7] , \CARRYB[7][6] , \CARRYB[7][5] , \CARRYB[7][4] ,
         \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] , \CARRYB[7][0] ,
         \CARRYB[6][8] , \CARRYB[6][7] , \CARRYB[6][6] , \CARRYB[6][5] ,
         \CARRYB[6][4] , \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] ,
         \CARRYB[6][0] , \CARRYB[5][9] , \CARRYB[5][8] , \CARRYB[5][7] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][10] ,
         \CARRYB[4][9] , \CARRYB[4][8] , \CARRYB[4][7] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][11] , \CARRYB[3][10] ,
         \CARRYB[3][9] , \CARRYB[3][8] , \CARRYB[3][7] , \CARRYB[3][6] ,
         \CARRYB[3][5] , \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] ,
         \CARRYB[3][1] , \CARRYB[3][0] , \CARRYB[2][12] , \CARRYB[2][11] ,
         \CARRYB[2][10] , \CARRYB[2][9] , \CARRYB[2][8] , \CARRYB[2][7] ,
         \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] , \CARRYB[2][3] ,
         \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] , \SUMB[15][0] ,
         \SUMB[14][1] , \SUMB[13][2] , \SUMB[13][1] , \SUMB[12][3] ,
         \SUMB[12][2] , \SUMB[12][1] , \SUMB[11][4] , \SUMB[11][3] ,
         \SUMB[11][2] , \SUMB[11][1] , \SUMB[10][5] , \SUMB[10][4] ,
         \SUMB[10][3] , \SUMB[10][2] , \SUMB[10][1] , \SUMB[9][6] ,
         \SUMB[9][5] , \SUMB[9][4] , \SUMB[9][3] , \SUMB[9][2] , \SUMB[9][1] ,
         \SUMB[8][7] , \SUMB[8][6] , \SUMB[8][5] , \SUMB[8][4] , \SUMB[8][3] ,
         \SUMB[8][2] , \SUMB[8][1] , \SUMB[7][8] , \SUMB[7][7] , \SUMB[7][6] ,
         \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] , \SUMB[7][1] ,
         \SUMB[6][9] , \SUMB[6][8] , \SUMB[6][7] , \SUMB[6][6] , \SUMB[6][5] ,
         \SUMB[6][4] , \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][10] ,
         \SUMB[5][9] , \SUMB[5][8] , \SUMB[5][7] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][11] ,
         \SUMB[4][10] , \SUMB[4][9] , \SUMB[4][8] , \SUMB[4][7] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][12] , \SUMB[3][11] , \SUMB[3][10] , \SUMB[3][9] ,
         \SUMB[3][8] , \SUMB[3][7] , \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] ,
         \SUMB[3][3] , \SUMB[3][2] , \SUMB[3][1] , \SUMB[2][13] ,
         \SUMB[2][12] , \SUMB[2][11] , \SUMB[2][10] , \SUMB[2][9] ,
         \SUMB[2][8] , \SUMB[2][7] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] ,
         \SUMB[2][3] , \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][14] ,
         \SUMB[1][13] , \SUMB[1][12] , \SUMB[1][11] , \SUMB[1][10] ,
         \SUMB[1][9] , \SUMB[1][8] , \SUMB[1][7] , \SUMB[1][6] , \SUMB[1][5] ,
         \SUMB[1][4] , \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , ZA, ZB, n3,
         n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48;
  assign ZA = A[15];
  assign ZB = B[15];

  FAX1 S14_15_0 ( .A(ZA), .B(ZB), .C(\SUMB[15][0] ), .YS(PRODUCT[15]) );
  FAX1 S4_0 ( .A(\ab[15][0] ), .B(\CARRYB[14][0] ), .C(\SUMB[14][1] ), .YS(
        \SUMB[15][0] ) );
  FAX1 S1_14_0 ( .A(\ab[14][0] ), .B(\CARRYB[13][0] ), .C(\SUMB[13][1] ), .YC(
        \CARRYB[14][0] ), .YS(PRODUCT[14]) );
  FAX1 S2_14_1 ( .A(\ab[14][1] ), .B(\CARRYB[13][1] ), .C(\SUMB[13][2] ), .YS(
        \SUMB[14][1] ) );
  FAX1 S1_13_0 ( .A(\ab[13][0] ), .B(\CARRYB[12][0] ), .C(\SUMB[12][1] ), .YC(
        \CARRYB[13][0] ), .YS(PRODUCT[13]) );
  FAX1 S2_13_1 ( .A(\ab[13][1] ), .B(\CARRYB[12][1] ), .C(\SUMB[12][2] ), .YC(
        \CARRYB[13][1] ), .YS(\SUMB[13][1] ) );
  FAX1 S2_13_2 ( .A(\ab[13][2] ), .B(\CARRYB[12][2] ), .C(\SUMB[12][3] ), .YS(
        \SUMB[13][2] ) );
  FAX1 S1_12_0 ( .A(\ab[12][0] ), .B(\CARRYB[11][0] ), .C(\SUMB[11][1] ), .YC(
        \CARRYB[12][0] ), .YS(PRODUCT[12]) );
  FAX1 S2_12_1 ( .A(\ab[12][1] ), .B(\CARRYB[11][1] ), .C(\SUMB[11][2] ), .YC(
        \CARRYB[12][1] ), .YS(\SUMB[12][1] ) );
  FAX1 S2_12_2 ( .A(\ab[12][2] ), .B(\CARRYB[11][2] ), .C(\SUMB[11][3] ), .YC(
        \CARRYB[12][2] ), .YS(\SUMB[12][2] ) );
  FAX1 S2_12_3 ( .A(\ab[12][3] ), .B(\CARRYB[11][3] ), .C(\SUMB[11][4] ), .YS(
        \SUMB[12][3] ) );
  FAX1 S1_11_0 ( .A(\ab[11][0] ), .B(\CARRYB[10][0] ), .C(\SUMB[10][1] ), .YC(
        \CARRYB[11][0] ), .YS(PRODUCT[11]) );
  FAX1 S2_11_1 ( .A(\ab[11][1] ), .B(\CARRYB[10][1] ), .C(\SUMB[10][2] ), .YC(
        \CARRYB[11][1] ), .YS(\SUMB[11][1] ) );
  FAX1 S2_11_2 ( .A(\ab[11][2] ), .B(\CARRYB[10][2] ), .C(\SUMB[10][3] ), .YC(
        \CARRYB[11][2] ), .YS(\SUMB[11][2] ) );
  FAX1 S2_11_3 ( .A(\ab[11][3] ), .B(\CARRYB[10][3] ), .C(\SUMB[10][4] ), .YC(
        \CARRYB[11][3] ), .YS(\SUMB[11][3] ) );
  FAX1 S2_11_4 ( .A(\ab[11][4] ), .B(\CARRYB[10][4] ), .C(\SUMB[10][5] ), .YS(
        \SUMB[11][4] ) );
  FAX1 S1_10_0 ( .A(\ab[10][0] ), .B(\CARRYB[9][0] ), .C(\SUMB[9][1] ), .YC(
        \CARRYB[10][0] ), .YS(PRODUCT[10]) );
  FAX1 S2_10_1 ( .A(\ab[10][1] ), .B(\CARRYB[9][1] ), .C(\SUMB[9][2] ), .YC(
        \CARRYB[10][1] ), .YS(\SUMB[10][1] ) );
  FAX1 S2_10_2 ( .A(\ab[10][2] ), .B(\CARRYB[9][2] ), .C(\SUMB[9][3] ), .YC(
        \CARRYB[10][2] ), .YS(\SUMB[10][2] ) );
  FAX1 S2_10_3 ( .A(\ab[10][3] ), .B(\CARRYB[9][3] ), .C(\SUMB[9][4] ), .YC(
        \CARRYB[10][3] ), .YS(\SUMB[10][3] ) );
  FAX1 S2_10_4 ( .A(\ab[10][4] ), .B(\CARRYB[9][4] ), .C(\SUMB[9][5] ), .YC(
        \CARRYB[10][4] ), .YS(\SUMB[10][4] ) );
  FAX1 S2_10_5 ( .A(\ab[10][5] ), .B(\CARRYB[9][5] ), .C(\SUMB[9][6] ), .YS(
        \SUMB[10][5] ) );
  FAX1 S1_9_0 ( .A(\ab[9][0] ), .B(\CARRYB[8][0] ), .C(\SUMB[8][1] ), .YC(
        \CARRYB[9][0] ), .YS(PRODUCT[9]) );
  FAX1 S2_9_1 ( .A(\ab[9][1] ), .B(\CARRYB[8][1] ), .C(\SUMB[8][2] ), .YC(
        \CARRYB[9][1] ), .YS(\SUMB[9][1] ) );
  FAX1 S2_9_2 ( .A(\ab[9][2] ), .B(\CARRYB[8][2] ), .C(\SUMB[8][3] ), .YC(
        \CARRYB[9][2] ), .YS(\SUMB[9][2] ) );
  FAX1 S2_9_3 ( .A(\ab[9][3] ), .B(\CARRYB[8][3] ), .C(\SUMB[8][4] ), .YC(
        \CARRYB[9][3] ), .YS(\SUMB[9][3] ) );
  FAX1 S2_9_4 ( .A(\ab[9][4] ), .B(\CARRYB[8][4] ), .C(\SUMB[8][5] ), .YC(
        \CARRYB[9][4] ), .YS(\SUMB[9][4] ) );
  FAX1 S2_9_5 ( .A(\ab[9][5] ), .B(\CARRYB[8][5] ), .C(\SUMB[8][6] ), .YC(
        \CARRYB[9][5] ), .YS(\SUMB[9][5] ) );
  FAX1 S2_9_6 ( .A(\ab[9][6] ), .B(\CARRYB[8][6] ), .C(\SUMB[8][7] ), .YS(
        \SUMB[9][6] ) );
  FAX1 S1_8_0 ( .A(\ab[8][0] ), .B(\CARRYB[7][0] ), .C(\SUMB[7][1] ), .YC(
        \CARRYB[8][0] ), .YS(PRODUCT[8]) );
  FAX1 S2_8_1 ( .A(\ab[8][1] ), .B(\CARRYB[7][1] ), .C(\SUMB[7][2] ), .YC(
        \CARRYB[8][1] ), .YS(\SUMB[8][1] ) );
  FAX1 S2_8_2 ( .A(\ab[8][2] ), .B(\CARRYB[7][2] ), .C(\SUMB[7][3] ), .YC(
        \CARRYB[8][2] ), .YS(\SUMB[8][2] ) );
  FAX1 S2_8_3 ( .A(\ab[8][3] ), .B(\CARRYB[7][3] ), .C(\SUMB[7][4] ), .YC(
        \CARRYB[8][3] ), .YS(\SUMB[8][3] ) );
  FAX1 S2_8_4 ( .A(\ab[8][4] ), .B(\CARRYB[7][4] ), .C(\SUMB[7][5] ), .YC(
        \CARRYB[8][4] ), .YS(\SUMB[8][4] ) );
  FAX1 S2_8_5 ( .A(\ab[8][5] ), .B(\CARRYB[7][5] ), .C(\SUMB[7][6] ), .YC(
        \CARRYB[8][5] ), .YS(\SUMB[8][5] ) );
  FAX1 S2_8_6 ( .A(\ab[8][6] ), .B(\CARRYB[7][6] ), .C(\SUMB[7][7] ), .YC(
        \CARRYB[8][6] ), .YS(\SUMB[8][6] ) );
  FAX1 S2_8_7 ( .A(\ab[8][7] ), .B(\CARRYB[7][7] ), .C(\SUMB[7][8] ), .YS(
        \SUMB[8][7] ) );
  FAX1 S1_7_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .C(\SUMB[6][1] ), .YC(
        \CARRYB[7][0] ), .YS(PRODUCT[7]) );
  FAX1 S2_7_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .C(\SUMB[6][2] ), .YC(
        \CARRYB[7][1] ), .YS(\SUMB[7][1] ) );
  FAX1 S2_7_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .C(\SUMB[6][3] ), .YC(
        \CARRYB[7][2] ), .YS(\SUMB[7][2] ) );
  FAX1 S2_7_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .C(\SUMB[6][4] ), .YC(
        \CARRYB[7][3] ), .YS(\SUMB[7][3] ) );
  FAX1 S2_7_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .C(\SUMB[6][5] ), .YC(
        \CARRYB[7][4] ), .YS(\SUMB[7][4] ) );
  FAX1 S2_7_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .C(\SUMB[6][6] ), .YC(
        \CARRYB[7][5] ), .YS(\SUMB[7][5] ) );
  FAX1 S2_7_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .C(\SUMB[6][7] ), .YC(
        \CARRYB[7][6] ), .YS(\SUMB[7][6] ) );
  FAX1 S2_7_7 ( .A(\ab[7][7] ), .B(\CARRYB[6][7] ), .C(\SUMB[6][8] ), .YC(
        \CARRYB[7][7] ), .YS(\SUMB[7][7] ) );
  FAX1 S2_7_8 ( .A(\ab[7][8] ), .B(\CARRYB[6][8] ), .C(\SUMB[6][9] ), .YS(
        \SUMB[7][8] ) );
  FAX1 S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .C(\SUMB[5][1] ), .YC(
        \CARRYB[6][0] ), .YS(PRODUCT[6]) );
  FAX1 S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .C(\SUMB[5][2] ), .YC(
        \CARRYB[6][1] ), .YS(\SUMB[6][1] ) );
  FAX1 S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .C(\SUMB[5][3] ), .YC(
        \CARRYB[6][2] ), .YS(\SUMB[6][2] ) );
  FAX1 S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .C(\SUMB[5][4] ), .YC(
        \CARRYB[6][3] ), .YS(\SUMB[6][3] ) );
  FAX1 S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .C(\SUMB[5][5] ), .YC(
        \CARRYB[6][4] ), .YS(\SUMB[6][4] ) );
  FAX1 S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .C(\SUMB[5][6] ), .YC(
        \CARRYB[6][5] ), .YS(\SUMB[6][5] ) );
  FAX1 S2_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .C(\SUMB[5][7] ), .YC(
        \CARRYB[6][6] ), .YS(\SUMB[6][6] ) );
  FAX1 S2_6_7 ( .A(\ab[6][7] ), .B(\CARRYB[5][7] ), .C(\SUMB[5][8] ), .YC(
        \CARRYB[6][7] ), .YS(\SUMB[6][7] ) );
  FAX1 S2_6_8 ( .A(\ab[6][8] ), .B(\CARRYB[5][8] ), .C(\SUMB[5][9] ), .YC(
        \CARRYB[6][8] ), .YS(\SUMB[6][8] ) );
  FAX1 S2_6_9 ( .A(\ab[6][9] ), .B(\CARRYB[5][9] ), .C(\SUMB[5][10] ), .YS(
        \SUMB[6][9] ) );
  FAX1 S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .C(\SUMB[4][1] ), .YC(
        \CARRYB[5][0] ), .YS(PRODUCT[5]) );
  FAX1 S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .C(\SUMB[4][2] ), .YC(
        \CARRYB[5][1] ), .YS(\SUMB[5][1] ) );
  FAX1 S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .C(\SUMB[4][3] ), .YC(
        \CARRYB[5][2] ), .YS(\SUMB[5][2] ) );
  FAX1 S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .C(\SUMB[4][4] ), .YC(
        \CARRYB[5][3] ), .YS(\SUMB[5][3] ) );
  FAX1 S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .C(\SUMB[4][5] ), .YC(
        \CARRYB[5][4] ), .YS(\SUMB[5][4] ) );
  FAX1 S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .C(\SUMB[4][6] ), .YC(
        \CARRYB[5][5] ), .YS(\SUMB[5][5] ) );
  FAX1 S2_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .C(\SUMB[4][7] ), .YC(
        \CARRYB[5][6] ), .YS(\SUMB[5][6] ) );
  FAX1 S2_5_7 ( .A(\ab[5][7] ), .B(\CARRYB[4][7] ), .C(\SUMB[4][8] ), .YC(
        \CARRYB[5][7] ), .YS(\SUMB[5][7] ) );
  FAX1 S2_5_8 ( .A(\ab[5][8] ), .B(\CARRYB[4][8] ), .C(\SUMB[4][9] ), .YC(
        \CARRYB[5][8] ), .YS(\SUMB[5][8] ) );
  FAX1 S2_5_9 ( .A(\ab[5][9] ), .B(\CARRYB[4][9] ), .C(\SUMB[4][10] ), .YC(
        \CARRYB[5][9] ), .YS(\SUMB[5][9] ) );
  FAX1 S2_5_10 ( .A(\ab[5][10] ), .B(\CARRYB[4][10] ), .C(\SUMB[4][11] ), .YS(
        \SUMB[5][10] ) );
  FAX1 S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .C(\SUMB[3][1] ), .YC(
        \CARRYB[4][0] ), .YS(PRODUCT[4]) );
  FAX1 S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .C(\SUMB[3][2] ), .YC(
        \CARRYB[4][1] ), .YS(\SUMB[4][1] ) );
  FAX1 S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .C(\SUMB[3][3] ), .YC(
        \CARRYB[4][2] ), .YS(\SUMB[4][2] ) );
  FAX1 S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .C(\SUMB[3][4] ), .YC(
        \CARRYB[4][3] ), .YS(\SUMB[4][3] ) );
  FAX1 S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .C(\SUMB[3][5] ), .YC(
        \CARRYB[4][4] ), .YS(\SUMB[4][4] ) );
  FAX1 S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .C(\SUMB[3][6] ), .YC(
        \CARRYB[4][5] ), .YS(\SUMB[4][5] ) );
  FAX1 S2_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .C(\SUMB[3][7] ), .YC(
        \CARRYB[4][6] ), .YS(\SUMB[4][6] ) );
  FAX1 S2_4_7 ( .A(\ab[4][7] ), .B(\CARRYB[3][7] ), .C(\SUMB[3][8] ), .YC(
        \CARRYB[4][7] ), .YS(\SUMB[4][7] ) );
  FAX1 S2_4_8 ( .A(\ab[4][8] ), .B(\CARRYB[3][8] ), .C(\SUMB[3][9] ), .YC(
        \CARRYB[4][8] ), .YS(\SUMB[4][8] ) );
  FAX1 S2_4_9 ( .A(\ab[4][9] ), .B(\CARRYB[3][9] ), .C(\SUMB[3][10] ), .YC(
        \CARRYB[4][9] ), .YS(\SUMB[4][9] ) );
  FAX1 S2_4_10 ( .A(\ab[4][10] ), .B(\CARRYB[3][10] ), .C(\SUMB[3][11] ), .YC(
        \CARRYB[4][10] ), .YS(\SUMB[4][10] ) );
  FAX1 S2_4_11 ( .A(\ab[4][11] ), .B(\CARRYB[3][11] ), .C(\SUMB[3][12] ), .YS(
        \SUMB[4][11] ) );
  FAX1 S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .C(\SUMB[2][1] ), .YC(
        \CARRYB[3][0] ), .YS(PRODUCT[3]) );
  FAX1 S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .C(\SUMB[2][2] ), .YC(
        \CARRYB[3][1] ), .YS(\SUMB[3][1] ) );
  FAX1 S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .C(\SUMB[2][3] ), .YC(
        \CARRYB[3][2] ), .YS(\SUMB[3][2] ) );
  FAX1 S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .C(\SUMB[2][4] ), .YC(
        \CARRYB[3][3] ), .YS(\SUMB[3][3] ) );
  FAX1 S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .C(\SUMB[2][5] ), .YC(
        \CARRYB[3][4] ), .YS(\SUMB[3][4] ) );
  FAX1 S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .C(\SUMB[2][6] ), .YC(
        \CARRYB[3][5] ), .YS(\SUMB[3][5] ) );
  FAX1 S2_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .C(\SUMB[2][7] ), .YC(
        \CARRYB[3][6] ), .YS(\SUMB[3][6] ) );
  FAX1 S2_3_7 ( .A(\ab[3][7] ), .B(\CARRYB[2][7] ), .C(\SUMB[2][8] ), .YC(
        \CARRYB[3][7] ), .YS(\SUMB[3][7] ) );
  FAX1 S2_3_8 ( .A(\ab[3][8] ), .B(\CARRYB[2][8] ), .C(\SUMB[2][9] ), .YC(
        \CARRYB[3][8] ), .YS(\SUMB[3][8] ) );
  FAX1 S2_3_9 ( .A(\ab[3][9] ), .B(\CARRYB[2][9] ), .C(\SUMB[2][10] ), .YC(
        \CARRYB[3][9] ), .YS(\SUMB[3][9] ) );
  FAX1 S2_3_10 ( .A(\ab[3][10] ), .B(\CARRYB[2][10] ), .C(\SUMB[2][11] ), .YC(
        \CARRYB[3][10] ), .YS(\SUMB[3][10] ) );
  FAX1 S2_3_11 ( .A(\ab[3][11] ), .B(\CARRYB[2][11] ), .C(\SUMB[2][12] ), .YC(
        \CARRYB[3][11] ), .YS(\SUMB[3][11] ) );
  FAX1 S2_3_12 ( .A(\ab[3][12] ), .B(\CARRYB[2][12] ), .C(\SUMB[2][13] ), .YS(
        \SUMB[3][12] ) );
  FAX1 S1_2_0 ( .A(\ab[2][0] ), .B(n3), .C(\SUMB[1][1] ), .YC(\CARRYB[2][0] ), 
        .YS(PRODUCT[2]) );
  FAX1 S2_2_1 ( .A(\ab[2][1] ), .B(n4), .C(\SUMB[1][2] ), .YC(\CARRYB[2][1] ), 
        .YS(\SUMB[2][1] ) );
  FAX1 S2_2_2 ( .A(\ab[2][2] ), .B(n5), .C(\SUMB[1][3] ), .YC(\CARRYB[2][2] ), 
        .YS(\SUMB[2][2] ) );
  FAX1 S2_2_3 ( .A(\ab[2][3] ), .B(n6), .C(\SUMB[1][4] ), .YC(\CARRYB[2][3] ), 
        .YS(\SUMB[2][3] ) );
  FAX1 S2_2_4 ( .A(\ab[2][4] ), .B(n7), .C(\SUMB[1][5] ), .YC(\CARRYB[2][4] ), 
        .YS(\SUMB[2][4] ) );
  FAX1 S2_2_5 ( .A(\ab[2][5] ), .B(n8), .C(\SUMB[1][6] ), .YC(\CARRYB[2][5] ), 
        .YS(\SUMB[2][5] ) );
  FAX1 S2_2_6 ( .A(\ab[2][6] ), .B(n9), .C(\SUMB[1][7] ), .YC(\CARRYB[2][6] ), 
        .YS(\SUMB[2][6] ) );
  FAX1 S2_2_7 ( .A(\ab[2][7] ), .B(n10), .C(\SUMB[1][8] ), .YC(\CARRYB[2][7] ), 
        .YS(\SUMB[2][7] ) );
  FAX1 S2_2_8 ( .A(\ab[2][8] ), .B(n11), .C(\SUMB[1][9] ), .YC(\CARRYB[2][8] ), 
        .YS(\SUMB[2][8] ) );
  FAX1 S2_2_9 ( .A(\ab[2][9] ), .B(n16), .C(\SUMB[1][10] ), .YC(\CARRYB[2][9] ), .YS(\SUMB[2][9] ) );
  FAX1 S2_2_10 ( .A(\ab[2][10] ), .B(n15), .C(\SUMB[1][11] ), .YC(
        \CARRYB[2][10] ), .YS(\SUMB[2][10] ) );
  FAX1 S2_2_11 ( .A(\ab[2][11] ), .B(n14), .C(\SUMB[1][12] ), .YC(
        \CARRYB[2][11] ), .YS(\SUMB[2][11] ) );
  FAX1 S2_2_12 ( .A(\ab[2][12] ), .B(n13), .C(\SUMB[1][13] ), .YC(
        \CARRYB[2][12] ), .YS(\SUMB[2][12] ) );
  FAX1 S2_2_13 ( .A(\ab[2][13] ), .B(n12), .C(\SUMB[1][14] ), .YS(
        \SUMB[2][13] ) );
  AND2X2 U2 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n3) );
  AND2X2 U3 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n4) );
  AND2X2 U4 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n5) );
  AND2X2 U5 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n6) );
  AND2X2 U6 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n7) );
  AND2X2 U7 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n8) );
  AND2X2 U8 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n9) );
  AND2X2 U9 ( .A(\ab[0][8] ), .B(\ab[1][7] ), .Y(n10) );
  AND2X2 U10 ( .A(\ab[0][9] ), .B(\ab[1][8] ), .Y(n11) );
  AND2X2 U11 ( .A(\ab[0][14] ), .B(\ab[1][13] ), .Y(n12) );
  AND2X2 U12 ( .A(\ab[0][13] ), .B(\ab[1][12] ), .Y(n13) );
  AND2X2 U13 ( .A(\ab[0][12] ), .B(\ab[1][11] ), .Y(n14) );
  AND2X2 U14 ( .A(\ab[0][11] ), .B(\ab[1][10] ), .Y(n15) );
  AND2X2 U15 ( .A(\ab[0][10] ), .B(\ab[1][9] ), .Y(n16) );
  INVX2 U16 ( .A(A[0]), .Y(n48) );
  INVX2 U17 ( .A(A[1]), .Y(n47) );
  INVX2 U18 ( .A(B[0]), .Y(n32) );
  INVX2 U19 ( .A(B[1]), .Y(n31) );
  INVX2 U20 ( .A(A[2]), .Y(n46) );
  INVX2 U21 ( .A(B[2]), .Y(n30) );
  INVX2 U22 ( .A(A[3]), .Y(n45) );
  INVX2 U23 ( .A(B[3]), .Y(n29) );
  INVX2 U24 ( .A(A[4]), .Y(n44) );
  INVX2 U25 ( .A(B[4]), .Y(n28) );
  INVX2 U26 ( .A(A[5]), .Y(n43) );
  INVX2 U27 ( .A(B[5]), .Y(n27) );
  INVX2 U28 ( .A(A[6]), .Y(n42) );
  INVX2 U29 ( .A(B[6]), .Y(n26) );
  INVX2 U30 ( .A(A[7]), .Y(n41) );
  INVX2 U31 ( .A(B[7]), .Y(n25) );
  XOR2X1 U32 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  XOR2X1 U33 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Y(\SUMB[1][1] ) );
  XOR2X1 U34 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Y(\SUMB[1][2] ) );
  XOR2X1 U35 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Y(\SUMB[1][3] ) );
  XOR2X1 U36 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Y(\SUMB[1][4] ) );
  XOR2X1 U37 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Y(\SUMB[1][5] ) );
  XOR2X1 U38 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Y(\SUMB[1][6] ) );
  XOR2X1 U39 ( .A(\ab[1][7] ), .B(\ab[0][8] ), .Y(\SUMB[1][7] ) );
  XOR2X1 U40 ( .A(\ab[1][8] ), .B(\ab[0][9] ), .Y(\SUMB[1][8] ) );
  XOR2X1 U41 ( .A(\ab[1][9] ), .B(\ab[0][10] ), .Y(\SUMB[1][9] ) );
  XOR2X1 U42 ( .A(\ab[1][10] ), .B(\ab[0][11] ), .Y(\SUMB[1][10] ) );
  XOR2X1 U43 ( .A(\ab[1][11] ), .B(\ab[0][12] ), .Y(\SUMB[1][11] ) );
  XOR2X1 U44 ( .A(\ab[1][12] ), .B(\ab[0][13] ), .Y(\SUMB[1][12] ) );
  XOR2X1 U45 ( .A(\ab[1][13] ), .B(\ab[0][14] ), .Y(\SUMB[1][13] ) );
  XOR2X1 U46 ( .A(\ab[1][14] ), .B(\ab[0][15] ), .Y(\SUMB[1][14] ) );
  INVX2 U47 ( .A(ZB), .Y(n17) );
  INVX2 U48 ( .A(B[14]), .Y(n18) );
  INVX2 U49 ( .A(B[13]), .Y(n19) );
  INVX2 U50 ( .A(B[12]), .Y(n20) );
  INVX2 U51 ( .A(B[11]), .Y(n21) );
  INVX2 U52 ( .A(B[10]), .Y(n22) );
  INVX2 U53 ( .A(B[9]), .Y(n23) );
  INVX2 U54 ( .A(B[8]), .Y(n24) );
  INVX2 U55 ( .A(ZA), .Y(n33) );
  INVX2 U56 ( .A(A[14]), .Y(n34) );
  INVX2 U57 ( .A(A[13]), .Y(n35) );
  INVX2 U58 ( .A(A[12]), .Y(n36) );
  INVX2 U59 ( .A(A[11]), .Y(n37) );
  INVX2 U60 ( .A(A[10]), .Y(n38) );
  INVX2 U61 ( .A(A[9]), .Y(n39) );
  INVX2 U62 ( .A(A[8]), .Y(n40) );
  NOR2X1 U63 ( .A(n39), .B(n26), .Y(\ab[9][6] ) );
  NOR2X1 U64 ( .A(n39), .B(n27), .Y(\ab[9][5] ) );
  NOR2X1 U65 ( .A(n39), .B(n28), .Y(\ab[9][4] ) );
  NOR2X1 U66 ( .A(n39), .B(n29), .Y(\ab[9][3] ) );
  NOR2X1 U67 ( .A(n39), .B(n30), .Y(\ab[9][2] ) );
  NOR2X1 U68 ( .A(n39), .B(n31), .Y(\ab[9][1] ) );
  NOR2X1 U69 ( .A(n39), .B(n32), .Y(\ab[9][0] ) );
  NOR2X1 U70 ( .A(n25), .B(n40), .Y(\ab[8][7] ) );
  NOR2X1 U71 ( .A(n26), .B(n40), .Y(\ab[8][6] ) );
  NOR2X1 U72 ( .A(n27), .B(n40), .Y(\ab[8][5] ) );
  NOR2X1 U73 ( .A(n28), .B(n40), .Y(\ab[8][4] ) );
  NOR2X1 U74 ( .A(n29), .B(n40), .Y(\ab[8][3] ) );
  NOR2X1 U75 ( .A(n30), .B(n40), .Y(\ab[8][2] ) );
  NOR2X1 U76 ( .A(n31), .B(n40), .Y(\ab[8][1] ) );
  NOR2X1 U77 ( .A(n32), .B(n40), .Y(\ab[8][0] ) );
  NOR2X1 U78 ( .A(n24), .B(n41), .Y(\ab[7][8] ) );
  NOR2X1 U79 ( .A(n25), .B(n41), .Y(\ab[7][7] ) );
  NOR2X1 U80 ( .A(n26), .B(n41), .Y(\ab[7][6] ) );
  NOR2X1 U81 ( .A(n27), .B(n41), .Y(\ab[7][5] ) );
  NOR2X1 U82 ( .A(n28), .B(n41), .Y(\ab[7][4] ) );
  NOR2X1 U83 ( .A(n29), .B(n41), .Y(\ab[7][3] ) );
  NOR2X1 U84 ( .A(n30), .B(n41), .Y(\ab[7][2] ) );
  NOR2X1 U85 ( .A(n31), .B(n41), .Y(\ab[7][1] ) );
  NOR2X1 U86 ( .A(n32), .B(n41), .Y(\ab[7][0] ) );
  NOR2X1 U87 ( .A(n23), .B(n42), .Y(\ab[6][9] ) );
  NOR2X1 U88 ( .A(n24), .B(n42), .Y(\ab[6][8] ) );
  NOR2X1 U89 ( .A(n25), .B(n42), .Y(\ab[6][7] ) );
  NOR2X1 U90 ( .A(n26), .B(n42), .Y(\ab[6][6] ) );
  NOR2X1 U91 ( .A(n27), .B(n42), .Y(\ab[6][5] ) );
  NOR2X1 U92 ( .A(n28), .B(n42), .Y(\ab[6][4] ) );
  NOR2X1 U93 ( .A(n29), .B(n42), .Y(\ab[6][3] ) );
  NOR2X1 U94 ( .A(n30), .B(n42), .Y(\ab[6][2] ) );
  NOR2X1 U95 ( .A(n31), .B(n42), .Y(\ab[6][1] ) );
  NOR2X1 U96 ( .A(n32), .B(n42), .Y(\ab[6][0] ) );
  NOR2X1 U97 ( .A(n23), .B(n43), .Y(\ab[5][9] ) );
  NOR2X1 U98 ( .A(n24), .B(n43), .Y(\ab[5][8] ) );
  NOR2X1 U99 ( .A(n25), .B(n43), .Y(\ab[5][7] ) );
  NOR2X1 U100 ( .A(n26), .B(n43), .Y(\ab[5][6] ) );
  NOR2X1 U101 ( .A(n27), .B(n43), .Y(\ab[5][5] ) );
  NOR2X1 U102 ( .A(n28), .B(n43), .Y(\ab[5][4] ) );
  NOR2X1 U103 ( .A(n29), .B(n43), .Y(\ab[5][3] ) );
  NOR2X1 U104 ( .A(n30), .B(n43), .Y(\ab[5][2] ) );
  NOR2X1 U105 ( .A(n31), .B(n43), .Y(\ab[5][1] ) );
  NOR2X1 U106 ( .A(n22), .B(n43), .Y(\ab[5][10] ) );
  NOR2X1 U107 ( .A(n32), .B(n43), .Y(\ab[5][0] ) );
  NOR2X1 U108 ( .A(n23), .B(n44), .Y(\ab[4][9] ) );
  NOR2X1 U109 ( .A(n24), .B(n44), .Y(\ab[4][8] ) );
  NOR2X1 U110 ( .A(n25), .B(n44), .Y(\ab[4][7] ) );
  NOR2X1 U111 ( .A(n26), .B(n44), .Y(\ab[4][6] ) );
  NOR2X1 U112 ( .A(n27), .B(n44), .Y(\ab[4][5] ) );
  NOR2X1 U113 ( .A(n28), .B(n44), .Y(\ab[4][4] ) );
  NOR2X1 U114 ( .A(n29), .B(n44), .Y(\ab[4][3] ) );
  NOR2X1 U115 ( .A(n30), .B(n44), .Y(\ab[4][2] ) );
  NOR2X1 U116 ( .A(n31), .B(n44), .Y(\ab[4][1] ) );
  NOR2X1 U117 ( .A(n21), .B(n44), .Y(\ab[4][11] ) );
  NOR2X1 U118 ( .A(n22), .B(n44), .Y(\ab[4][10] ) );
  NOR2X1 U119 ( .A(n32), .B(n44), .Y(\ab[4][0] ) );
  NOR2X1 U120 ( .A(n23), .B(n45), .Y(\ab[3][9] ) );
  NOR2X1 U121 ( .A(n24), .B(n45), .Y(\ab[3][8] ) );
  NOR2X1 U122 ( .A(n25), .B(n45), .Y(\ab[3][7] ) );
  NOR2X1 U123 ( .A(n26), .B(n45), .Y(\ab[3][6] ) );
  NOR2X1 U124 ( .A(n27), .B(n45), .Y(\ab[3][5] ) );
  NOR2X1 U125 ( .A(n28), .B(n45), .Y(\ab[3][4] ) );
  NOR2X1 U126 ( .A(n29), .B(n45), .Y(\ab[3][3] ) );
  NOR2X1 U127 ( .A(n30), .B(n45), .Y(\ab[3][2] ) );
  NOR2X1 U128 ( .A(n31), .B(n45), .Y(\ab[3][1] ) );
  NOR2X1 U129 ( .A(n20), .B(n45), .Y(\ab[3][12] ) );
  NOR2X1 U130 ( .A(n21), .B(n45), .Y(\ab[3][11] ) );
  NOR2X1 U131 ( .A(n22), .B(n45), .Y(\ab[3][10] ) );
  NOR2X1 U132 ( .A(n32), .B(n45), .Y(\ab[3][0] ) );
  NOR2X1 U133 ( .A(n23), .B(n46), .Y(\ab[2][9] ) );
  NOR2X1 U134 ( .A(n24), .B(n46), .Y(\ab[2][8] ) );
  NOR2X1 U135 ( .A(n25), .B(n46), .Y(\ab[2][7] ) );
  NOR2X1 U136 ( .A(n26), .B(n46), .Y(\ab[2][6] ) );
  NOR2X1 U137 ( .A(n27), .B(n46), .Y(\ab[2][5] ) );
  NOR2X1 U138 ( .A(n28), .B(n46), .Y(\ab[2][4] ) );
  NOR2X1 U139 ( .A(n29), .B(n46), .Y(\ab[2][3] ) );
  NOR2X1 U140 ( .A(n30), .B(n46), .Y(\ab[2][2] ) );
  NOR2X1 U141 ( .A(n31), .B(n46), .Y(\ab[2][1] ) );
  NOR2X1 U142 ( .A(n19), .B(n46), .Y(\ab[2][13] ) );
  NOR2X1 U143 ( .A(n20), .B(n46), .Y(\ab[2][12] ) );
  NOR2X1 U144 ( .A(n21), .B(n46), .Y(\ab[2][11] ) );
  NOR2X1 U145 ( .A(n22), .B(n46), .Y(\ab[2][10] ) );
  NOR2X1 U146 ( .A(n32), .B(n46), .Y(\ab[2][0] ) );
  NOR2X1 U147 ( .A(n23), .B(n47), .Y(\ab[1][9] ) );
  NOR2X1 U148 ( .A(n24), .B(n47), .Y(\ab[1][8] ) );
  NOR2X1 U149 ( .A(n25), .B(n47), .Y(\ab[1][7] ) );
  NOR2X1 U150 ( .A(n26), .B(n47), .Y(\ab[1][6] ) );
  NOR2X1 U151 ( .A(n27), .B(n47), .Y(\ab[1][5] ) );
  NOR2X1 U152 ( .A(n28), .B(n47), .Y(\ab[1][4] ) );
  NOR2X1 U153 ( .A(n29), .B(n47), .Y(\ab[1][3] ) );
  NOR2X1 U154 ( .A(n30), .B(n47), .Y(\ab[1][2] ) );
  NOR2X1 U155 ( .A(n31), .B(n47), .Y(\ab[1][1] ) );
  NOR2X1 U156 ( .A(n18), .B(n47), .Y(\ab[1][14] ) );
  NOR2X1 U157 ( .A(n19), .B(n47), .Y(\ab[1][13] ) );
  NOR2X1 U158 ( .A(n20), .B(n47), .Y(\ab[1][12] ) );
  NOR2X1 U159 ( .A(n21), .B(n47), .Y(\ab[1][11] ) );
  NOR2X1 U160 ( .A(n22), .B(n47), .Y(\ab[1][10] ) );
  NOR2X1 U161 ( .A(n32), .B(n47), .Y(\ab[1][0] ) );
  NOR2X1 U162 ( .A(B[0]), .B(n33), .Y(\ab[15][0] ) );
  NOR2X1 U163 ( .A(n31), .B(n34), .Y(\ab[14][1] ) );
  NOR2X1 U164 ( .A(n32), .B(n34), .Y(\ab[14][0] ) );
  NOR2X1 U165 ( .A(n30), .B(n35), .Y(\ab[13][2] ) );
  NOR2X1 U166 ( .A(n31), .B(n35), .Y(\ab[13][1] ) );
  NOR2X1 U167 ( .A(n32), .B(n35), .Y(\ab[13][0] ) );
  NOR2X1 U168 ( .A(n29), .B(n36), .Y(\ab[12][3] ) );
  NOR2X1 U169 ( .A(n30), .B(n36), .Y(\ab[12][2] ) );
  NOR2X1 U170 ( .A(n31), .B(n36), .Y(\ab[12][1] ) );
  NOR2X1 U171 ( .A(n32), .B(n36), .Y(\ab[12][0] ) );
  NOR2X1 U172 ( .A(n28), .B(n37), .Y(\ab[11][4] ) );
  NOR2X1 U173 ( .A(n29), .B(n37), .Y(\ab[11][3] ) );
  NOR2X1 U174 ( .A(n30), .B(n37), .Y(\ab[11][2] ) );
  NOR2X1 U175 ( .A(n31), .B(n37), .Y(\ab[11][1] ) );
  NOR2X1 U176 ( .A(n32), .B(n37), .Y(\ab[11][0] ) );
  NOR2X1 U177 ( .A(n27), .B(n38), .Y(\ab[10][5] ) );
  NOR2X1 U178 ( .A(n28), .B(n38), .Y(\ab[10][4] ) );
  NOR2X1 U179 ( .A(n29), .B(n38), .Y(\ab[10][3] ) );
  NOR2X1 U180 ( .A(n30), .B(n38), .Y(\ab[10][2] ) );
  NOR2X1 U181 ( .A(n31), .B(n38), .Y(\ab[10][1] ) );
  NOR2X1 U182 ( .A(n32), .B(n38), .Y(\ab[10][0] ) );
  NOR2X1 U183 ( .A(n23), .B(n48), .Y(\ab[0][9] ) );
  NOR2X1 U184 ( .A(n24), .B(n48), .Y(\ab[0][8] ) );
  NOR2X1 U185 ( .A(n25), .B(n48), .Y(\ab[0][7] ) );
  NOR2X1 U186 ( .A(n26), .B(n48), .Y(\ab[0][6] ) );
  NOR2X1 U187 ( .A(n27), .B(n48), .Y(\ab[0][5] ) );
  NOR2X1 U188 ( .A(n28), .B(n48), .Y(\ab[0][4] ) );
  NOR2X1 U189 ( .A(n29), .B(n48), .Y(\ab[0][3] ) );
  NOR2X1 U190 ( .A(n30), .B(n48), .Y(\ab[0][2] ) );
  NOR2X1 U191 ( .A(n31), .B(n48), .Y(\ab[0][1] ) );
  NOR2X1 U192 ( .A(A[0]), .B(n17), .Y(\ab[0][15] ) );
  NOR2X1 U193 ( .A(n18), .B(n48), .Y(\ab[0][14] ) );
  NOR2X1 U194 ( .A(n19), .B(n48), .Y(\ab[0][13] ) );
  NOR2X1 U195 ( .A(n20), .B(n48), .Y(\ab[0][12] ) );
  NOR2X1 U196 ( .A(n21), .B(n48), .Y(\ab[0][11] ) );
  NOR2X1 U197 ( .A(n22), .B(n48), .Y(\ab[0][10] ) );
  NOR2X1 U198 ( .A(n32), .B(n48), .Y(PRODUCT[0]) );
endmodule


module matrix_math_DW01_add_2 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:1] carry;

  FAX1 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .YS(SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matrix_math_DW01_add_1 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [15:1] carry;

  FAX1 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .YS(SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  FAX1 U1_7 ( .A(A[7]), .B(B[7]), .C(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  FAX1 U1_6 ( .A(A[6]), .B(B[6]), .C(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  FAX1 U1_5 ( .A(A[5]), .B(B[5]), .C(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  FAX1 U1_4 ( .A(A[4]), .B(B[4]), .C(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  FAX1 U1_3 ( .A(A[3]), .B(B[3]), .C(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  FAX1 U1_2 ( .A(A[2]), .B(B[2]), .C(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  FAX1 U1_1 ( .A(A[1]), .B(B[1]), .C(n1), .YC(carry[2]), .YS(SUM[1]) );
  AND2X2 U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  XOR2X1 U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module matrix_math_DW01_add_0 ( A, B, CI, SUM, CO );
  input [15:0] A;
  input [15:0] B;
  output [15:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20, n21, n22, n23, n24;
  wire   [15:1] carry;

  FAX1 U1_15 ( .A(A[15]), .B(B[15]), .C(carry[15]), .YS(SUM[15]) );
  FAX1 U1_14 ( .A(A[14]), .B(B[14]), .C(carry[14]), .YC(carry[15]), .YS(
        SUM[14]) );
  FAX1 U1_13 ( .A(A[13]), .B(B[13]), .C(carry[13]), .YC(carry[14]), .YS(
        SUM[13]) );
  FAX1 U1_12 ( .A(A[12]), .B(B[12]), .C(carry[12]), .YC(carry[13]), .YS(
        SUM[12]) );
  FAX1 U1_11 ( .A(A[11]), .B(B[11]), .C(carry[11]), .YC(carry[12]), .YS(
        SUM[11]) );
  FAX1 U1_10 ( .A(A[10]), .B(B[10]), .C(carry[10]), .YC(carry[11]), .YS(
        SUM[10]) );
  FAX1 U1_9 ( .A(A[9]), .B(B[9]), .C(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  FAX1 U1_8 ( .A(A[8]), .B(B[8]), .C(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  INVX2 U1 ( .A(n13), .Y(n1) );
  INVX2 U2 ( .A(n14), .Y(n2) );
  INVX2 U3 ( .A(n17), .Y(n3) );
  INVX2 U4 ( .A(n18), .Y(n4) );
  INVX2 U5 ( .A(n21), .Y(n5) );
  INVX2 U6 ( .A(n22), .Y(n6) );
  INVX2 U7 ( .A(n24), .Y(n7) );
  INVX2 U8 ( .A(A[7]), .Y(n8) );
  INVX2 U9 ( .A(A[6]), .Y(n9) );
  INVX2 U10 ( .A(A[4]), .Y(n10) );
  INVX2 U11 ( .A(A[2]), .Y(n11) );
  OAI21X1 U12 ( .A(n1), .B(n8), .C(n12), .Y(carry[8]) );
  OAI21X1 U13 ( .A(A[7]), .B(n13), .C(B[7]), .Y(n12) );
  OAI21X1 U14 ( .A(n14), .B(n9), .C(n15), .Y(n13) );
  OAI21X1 U15 ( .A(A[6]), .B(n2), .C(B[6]), .Y(n15) );
  AOI21X1 U16 ( .A(n16), .B(A[5]), .C(n3), .Y(n14) );
  OAI21X1 U17 ( .A(A[5]), .B(n16), .C(B[5]), .Y(n17) );
  OAI21X1 U18 ( .A(n18), .B(n10), .C(n19), .Y(n16) );
  OAI21X1 U19 ( .A(A[4]), .B(n4), .C(B[4]), .Y(n19) );
  AOI21X1 U20 ( .A(n20), .B(A[3]), .C(n5), .Y(n18) );
  OAI21X1 U21 ( .A(A[3]), .B(n20), .C(B[3]), .Y(n21) );
  OAI21X1 U22 ( .A(n22), .B(n11), .C(n23), .Y(n20) );
  OAI21X1 U23 ( .A(A[2]), .B(n6), .C(B[2]), .Y(n23) );
  AOI22X1 U24 ( .A(A[1]), .B(B[1]), .C(B[0]), .D(n7), .Y(n22) );
  OAI21X1 U25 ( .A(A[1]), .B(B[1]), .C(A[0]), .Y(n24) );
endmodule


module matrix_math ( screen_cor, init_matrix, clk, rst_n, row_sel, sel, 
        math_done, strb_screen, point, row, err );
  output [7:0] screen_cor;
  output [1:0] row_sel;
  input [47:0] point;
  input [63:0] row;
  input init_matrix, clk, rst_n;
  output sel, math_done, strb_screen, err;
  wire   \V1[15] , n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, N9, N8, N79, N78, N77,
         N76, N75, N74, N73, N72, N71, N70, N7, N69, N68, N67, N66, N65, N64,
         N63, N62, N61, N60, N6, N59, N58, N57, N56, N55, N54, N53, N52, N51,
         N50, N5, N49, N48, N47, N46, N45, N44, N43, N42, N41, N40, N4, N39,
         N38, N37, N36, N35, N34, N33, N32, N31, N30, N3, N29, N28, N27, N26,
         N25, N24, N23, N22, N21, N20, N2, N19, N18, N17, N16, N15, N14, N13,
         N12, N11, N10, N1, N0, n38, n39, n40, n41, n42, n43, n44, n45, n46;
  wire   [3:0] state;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, 
        SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, 
        SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55;
  assign row_sel[1] = 1'b0;

  DFFSR \state_reg[0]  ( .D(n38), .CLK(clk), .R(rst_n), .S(1'b1), .Q(state[0])
         );
  DFFSR \state_reg[1]  ( .D(n34), .CLK(clk), .R(rst_n), .S(1'b1), .Q(state[1])
         );
  DFFSR \state_reg[2]  ( .D(n33), .CLK(clk), .R(rst_n), .S(1'b1), .Q(state[2])
         );
  DFFSR \state_reg[3]  ( .D(n35), .CLK(clk), .R(rst_n), .S(1'b1), .Q(state[3])
         );
  OR2X2 U6 ( .A(n19), .B(n20), .Y(n34) );
  NAND2X1 U17 ( .A(n40), .B(n41), .Y(sel) );
  NAND2X1 U18 ( .A(n42), .B(n41), .Y(row_sel[0]) );
  NAND2X1 U19 ( .A(n42), .B(n40), .Y(n33) );
  OAI21X1 U20 ( .A(n16), .B(n17), .C(n18), .Y(n15) );
  NAND2X1 U21 ( .A(state[0]), .B(state[1]), .Y(n17) );
  NAND2X1 U22 ( .A(n45), .B(n46), .Y(n16) );
  OAI21X1 U23 ( .A(n43), .B(n21), .C(n22), .Y(n20) );
  OAI21X1 U24 ( .A(n43), .B(n23), .C(n24), .Y(n19) );
  NAND3X1 U25 ( .A(state[1]), .B(n43), .C(n25), .Y(n24) );
  NAND2X1 U26 ( .A(n25), .B(n44), .Y(n23) );
  OAI21X1 U27 ( .A(n43), .B(n26), .C(n27), .Y(n35) );
  NAND2X1 U28 ( .A(n25), .B(state[1]), .Y(n26) );
  OAI21X1 U29 ( .A(init_matrix), .B(n21), .C(n29), .Y(n28) );
  OAI21X1 U30 ( .A(state[0]), .B(n21), .C(n39), .Y(n29) );
  NAND3X1 U31 ( .A(n18), .B(n22), .C(n27), .Y(strb_screen) );
  NAND3X1 U32 ( .A(n44), .B(n45), .C(n30), .Y(n27) );
  NOR2X1 U33 ( .A(state[0]), .B(n46), .Y(n30) );
  NAND3X1 U34 ( .A(n43), .B(n46), .C(state[1]), .Y(n22) );
  NAND3X1 U35 ( .A(n43), .B(n44), .C(n25), .Y(n18) );
  NOR2X1 U36 ( .A(n45), .B(state[3]), .Y(n25) );
  NAND3X1 U37 ( .A(n45), .B(n46), .C(n44), .Y(n21) );
  NOR2X1 U38 ( .A(n31), .B(n32), .Y(math_done) );
  NAND2X1 U39 ( .A(state[0]), .B(state[3]), .Y(n32) );
  NAND2X1 U40 ( .A(n44), .B(n45), .Y(n31) );
  matrix_math_DW02_mult_2 mult_53 ( .A(row[63:48]), .B(point[47:32]), .TC(1'b1), .PRODUCT({SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5, 
        SYNOPSYS_UNCONNECTED__6, SYNOPSYS_UNCONNECTED__7, 
        SYNOPSYS_UNCONNECTED__8, SYNOPSYS_UNCONNECTED__9, 
        SYNOPSYS_UNCONNECTED__10, SYNOPSYS_UNCONNECTED__11, 
        SYNOPSYS_UNCONNECTED__12, SYNOPSYS_UNCONNECTED__13, 
        SYNOPSYS_UNCONNECTED__14, SYNOPSYS_UNCONNECTED__15, N15, N14, N13, N12, 
        N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}) );
  matrix_math_DW02_mult_1 mult_53_2 ( .A(row[47:32]), .B(point[31:16]), .TC(
        1'b1), .PRODUCT({SYNOPSYS_UNCONNECTED__16, SYNOPSYS_UNCONNECTED__17, 
        SYNOPSYS_UNCONNECTED__18, SYNOPSYS_UNCONNECTED__19, 
        SYNOPSYS_UNCONNECTED__20, SYNOPSYS_UNCONNECTED__21, 
        SYNOPSYS_UNCONNECTED__22, SYNOPSYS_UNCONNECTED__23, 
        SYNOPSYS_UNCONNECTED__24, SYNOPSYS_UNCONNECTED__25, 
        SYNOPSYS_UNCONNECTED__26, SYNOPSYS_UNCONNECTED__27, 
        SYNOPSYS_UNCONNECTED__28, SYNOPSYS_UNCONNECTED__29, 
        SYNOPSYS_UNCONNECTED__30, SYNOPSYS_UNCONNECTED__31, N31, N30, N29, N28, 
        N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, N17, N16}) );
  matrix_math_DW02_mult_0 mult_53_3 ( .A(row[31:16]), .B(point[15:0]), .TC(
        1'b1), .PRODUCT({SYNOPSYS_UNCONNECTED__32, SYNOPSYS_UNCONNECTED__33, 
        SYNOPSYS_UNCONNECTED__34, SYNOPSYS_UNCONNECTED__35, 
        SYNOPSYS_UNCONNECTED__36, SYNOPSYS_UNCONNECTED__37, 
        SYNOPSYS_UNCONNECTED__38, SYNOPSYS_UNCONNECTED__39, 
        SYNOPSYS_UNCONNECTED__40, SYNOPSYS_UNCONNECTED__41, 
        SYNOPSYS_UNCONNECTED__42, SYNOPSYS_UNCONNECTED__43, 
        SYNOPSYS_UNCONNECTED__44, SYNOPSYS_UNCONNECTED__45, 
        SYNOPSYS_UNCONNECTED__46, SYNOPSYS_UNCONNECTED__47, N63, N62, N61, N60, 
        N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48}) );
  matrix_math_DW01_add_2 add_1_root_add_0_root_add_53_3 ( .A({N15, N14, N13, 
        N12, N11, N10, N9, N8, N7, N6, N5, N4, N3, N2, N1, N0}), .B({N63, N62, 
        N61, N60, N59, N58, N57, N56, N55, N54, N53, N52, N51, N50, N49, N48}), 
        .CI(1'b0), .SUM({N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, 
        N36, N35, N34, N33, N32}) );
  matrix_math_DW01_add_1 add_2_root_add_0_root_add_53_3 ( .A(row[15:0]), .B({
        N31, N30, N29, N28, N27, N26, N25, N24, N23, N22, N21, N20, N19, N18, 
        N17, N16}), .CI(1'b0), .SUM({N79, N78, N77, N76, N75, N74, N73, N72, 
        N71, N70, N69, N68, N67, N66, N65, N64}) );
  matrix_math_DW01_add_0 add_0_root_add_0_root_add_53_3 ( .A({N79, N78, N77, 
        N76, N75, N74, N73, N72, N71, N70, N69, N68, N67, N66, N65, N64}), .B(
        {N47, N46, N45, N44, N43, N42, N41, N40, N39, N38, N37, N36, N35, N34, 
        N33, N32}), .CI(1'b0), .SUM({\V1[15] , screen_cor[6:0], 
        SYNOPSYS_UNCONNECTED__48, SYNOPSYS_UNCONNECTED__49, 
        SYNOPSYS_UNCONNECTED__50, SYNOPSYS_UNCONNECTED__51, 
        SYNOPSYS_UNCONNECTED__52, SYNOPSYS_UNCONNECTED__53, 
        SYNOPSYS_UNCONNECTED__54, SYNOPSYS_UNCONNECTED__55}) );
  INVX2 U41 ( .A(\V1[15] ), .Y(screen_cor[7]) );
  INVX2 U42 ( .A(n28), .Y(n38) );
  INVX2 U43 ( .A(strb_screen), .Y(n39) );
  INVX2 U44 ( .A(n15), .Y(n40) );
  INVX2 U45 ( .A(n35), .Y(n41) );
  INVX2 U46 ( .A(n19), .Y(n42) );
  INVX2 U47 ( .A(state[0]), .Y(n43) );
  INVX2 U48 ( .A(state[1]), .Y(n44) );
  INVX2 U49 ( .A(state[2]), .Y(n45) );
  INVX2 U50 ( .A(state[3]), .Y(n46) );
endmodule

