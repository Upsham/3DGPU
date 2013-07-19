
module gpu_controller_DW01_inc_1 ( A, SUM );
  input [15:0] A;
  output [15:0] SUM;

  wire   [15:2] carry;

  HAX1 U1_1_14 ( .A(A[14]), .B(carry[14]), .YC(carry[15]), .YS(SUM[14]) );
  HAX1 U1_1_13 ( .A(A[13]), .B(carry[13]), .YC(carry[14]), .YS(SUM[13]) );
  HAX1 U1_1_12 ( .A(A[12]), .B(carry[12]), .YC(carry[13]), .YS(SUM[12]) );
  HAX1 U1_1_11 ( .A(A[11]), .B(carry[11]), .YC(carry[12]), .YS(SUM[11]) );
  HAX1 U1_1_10 ( .A(A[10]), .B(carry[10]), .YC(carry[11]), .YS(SUM[10]) );
  HAX1 U1_1_9 ( .A(A[9]), .B(carry[9]), .YC(carry[10]), .YS(SUM[9]) );
  HAX1 U1_1_8 ( .A(A[8]), .B(carry[8]), .YC(carry[9]), .YS(SUM[8]) );
  HAX1 U1_1_7 ( .A(A[7]), .B(carry[7]), .YC(carry[8]), .YS(SUM[7]) );
  HAX1 U1_1_6 ( .A(A[6]), .B(carry[6]), .YC(carry[7]), .YS(SUM[6]) );
  HAX1 U1_1_5 ( .A(A[5]), .B(carry[5]), .YC(carry[6]), .YS(SUM[5]) );
  HAX1 U1_1_4 ( .A(A[4]), .B(carry[4]), .YC(carry[5]), .YS(SUM[4]) );
  HAX1 U1_1_3 ( .A(A[3]), .B(carry[3]), .YC(carry[4]), .YS(SUM[3]) );
  HAX1 U1_1_2 ( .A(A[2]), .B(carry[2]), .YC(carry[3]), .YS(SUM[2]) );
  HAX1 U1_1_1 ( .A(A[1]), .B(A[0]), .YC(carry[2]), .YS(SUM[1]) );
  INVX2 U1 ( .A(A[0]), .Y(SUM[0]) );
  XOR2X1 U2 ( .A(carry[15]), .B(A[15]), .Y(SUM[15]) );
endmodule


module gpu_controller ( databus, strb_in, clk, rst_n, gpu_done, ram_in_use, 
        rast_done, init_rast, rast_addr, rast_strb, rast_index, math_done, 
        init_math, strb_matrix, strb_cor, err, addr_out, re_out, we_out, 
        databus_out, opp );
  inout [15:0] databus;
  input [15:0] rast_addr;
  input [3:0] rast_index;
  output [14:0] addr_out;
  output [15:0] databus_out;
  output [15:0] opp;
  input strb_in, clk, rst_n, ram_in_use, rast_done, rast_strb, math_done, err;
  output gpu_done, init_rast, init_math, strb_matrix, strb_cor, re_out, we_out;
  wire   re, we, tem, tem2, nextre, N297, N298, N299, N300, N301, N302, N303,
         N304, N305, N306, N307, N308, N309, N310, N311, N312, N314, N315,
         N316, N317, n1, n2, n3, n7, n8, n13, n14, n15, n16, n17, n18, n19,
         n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33,
         n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n48,
         n49, n51, n52, n53, n54, n59, n61, n63, n65, n67, n68, n69, n73, n74,
         n75, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n90,
         n91, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n104, n105,
         n107, n108, n109, n110, n111, n112, n114, n115, n116, n117, n119,
         n120, n122, n123, n124, n126, n127, n128, n129, n130, n132, n133,
         n134, n135, n137, n138, n140, n141, n142, n143, n144, n146, n147,
         n149, n150, n151, n154, n155, n156, n157, n158, n159, n160, n161,
         n162, n163, n165, n166, n167, n169, n170, n171, n172, n173, n174,
         n176, n177, n178, n180, n182, n183, n184, n185, n186, n187, n189,
         n190, n193, n194, n195, n196, n197, n198, n199, n200, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n274, n276, n277, n278,
         n279, n280, n281, n282, n283, n284, n285, n286, n287, n288, n289,
         n290, n291, n293, n294, n295, n296, n297, n298, n300, n312, n314,
         n324, n326, n328, n329, n330, n331, \add_213/carry[4] ,
         \add_213/carry[3] , \add_213/carry[2] , n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n388, n389, n390, n391, n392, n393,
         n394, n395, n396, n397, n398, n399, n400, n401, n402, n403, n404,
         n405, n406, n407, n408, n409, n410, n411, n412, n413, n414, n415,
         n416, n417, n418, n419, n420, n421, n422, n423;
  wire   [3:0] state;
  wire   [15:0] addr;
  wire   [4:0] counter;
  wire   [15:0] data_reg;
  tri   [15:0] databus;
  tri   [14:0] addr_out;
  tri   re_out;
  tri   we_out;
  assign databus_out[15] = databus[15];
  assign databus_out[14] = databus[14];
  assign databus_out[13] = databus[13];
  assign databus_out[12] = databus[12];
  assign databus_out[11] = databus[11];
  assign databus_out[10] = databus[10];
  assign databus_out[9] = databus[9];
  assign databus_out[8] = databus[8];
  assign databus_out[7] = databus[7];
  assign databus_out[6] = databus[6];
  assign databus_out[5] = databus[5];
  assign databus_out[4] = databus[4];
  assign databus_out[3] = databus[3];
  assign databus_out[2] = databus[2];
  assign databus_out[1] = databus[1];
  assign databus_out[0] = databus[0];

  DFFSR tem_reg ( .D(strb_in), .CLK(clk), .R(rst_n), .S(1'b1), .Q(tem) );
  DFFSR tem2_reg ( .D(tem), .CLK(clk), .R(rst_n), .S(1'b1), .Q(tem2) );
  DFFSR we_reg ( .D(n274), .CLK(clk), .R(rst_n), .S(1'b1), .Q(we) );
  DFFSR \opcode_reg[15]  ( .D(n361), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        opp[15]) );
  DFFSR \state_reg[3]  ( .D(n331), .CLK(clk), .R(rst_n), .S(1'b1), .Q(state[3]) );
  DFFSR \counter_reg[4]  ( .D(n293), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        counter[4]) );
  DFFSR \state_reg[2]  ( .D(n330), .CLK(clk), .R(rst_n), .S(1'b1), .Q(state[2]) );
  DFFSR \state_reg[0]  ( .D(n328), .CLK(clk), .R(rst_n), .S(1'b1), .Q(state[0]) );
  DFFSR \state_reg[1]  ( .D(n329), .CLK(clk), .R(rst_n), .S(1'b1), .Q(state[1]) );
  DFFPOSX1 \data_reg_reg[0]  ( .D(n354), .CLK(clk), .Q(data_reg[0]) );
  DFFPOSX1 \data_reg_reg[1]  ( .D(n353), .CLK(clk), .Q(data_reg[1]) );
  DFFPOSX1 \data_reg_reg[2]  ( .D(n352), .CLK(clk), .Q(data_reg[2]) );
  DFFPOSX1 \data_reg_reg[3]  ( .D(n351), .CLK(clk), .Q(data_reg[3]) );
  DFFPOSX1 \data_reg_reg[4]  ( .D(n350), .CLK(clk), .Q(data_reg[4]) );
  DFFPOSX1 \data_reg_reg[5]  ( .D(n349), .CLK(clk), .Q(data_reg[5]) );
  DFFPOSX1 \data_reg_reg[6]  ( .D(n348), .CLK(clk), .Q(data_reg[6]) );
  DFFPOSX1 \data_reg_reg[7]  ( .D(n347), .CLK(clk), .Q(data_reg[7]) );
  DFFPOSX1 \data_reg_reg[8]  ( .D(n346), .CLK(clk), .Q(data_reg[8]) );
  DFFPOSX1 \data_reg_reg[9]  ( .D(n345), .CLK(clk), .Q(data_reg[9]) );
  DFFPOSX1 \data_reg_reg[10]  ( .D(n344), .CLK(clk), .Q(data_reg[10]) );
  DFFPOSX1 \data_reg_reg[11]  ( .D(n343), .CLK(clk), .Q(data_reg[11]) );
  DFFPOSX1 \data_reg_reg[12]  ( .D(n342), .CLK(clk), .Q(data_reg[12]) );
  DFFPOSX1 \data_reg_reg[13]  ( .D(n341), .CLK(clk), .Q(data_reg[13]) );
  DFFPOSX1 \data_reg_reg[14]  ( .D(n340), .CLK(clk), .Q(data_reg[14]) );
  DFFPOSX1 \data_reg_reg[15]  ( .D(n339), .CLK(clk), .Q(data_reg[15]) );
  DFFSR \opcode_reg[0]  ( .D(n326), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[0])
         );
  DFFSR \opcode_reg[1]  ( .D(n324), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[1])
         );
  DFFSR \opcode_reg[2]  ( .D(n362), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[2])
         );
  DFFSR \opcode_reg[3]  ( .D(n357), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[3])
         );
  DFFSR \opcode_reg[4]  ( .D(n363), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[4])
         );
  DFFSR \opcode_reg[5]  ( .D(n356), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[5])
         );
  DFFSR \opcode_reg[6]  ( .D(n314), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[6])
         );
  DFFSR \opcode_reg[7]  ( .D(n312), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[7])
         );
  DFFSR \opcode_reg[8]  ( .D(n364), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[8])
         );
  DFFSR \opcode_reg[9]  ( .D(n355), .CLK(clk), .R(rst_n), .S(1'b1), .Q(opp[9])
         );
  DFFSR \opcode_reg[10]  ( .D(n359), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        opp[10]) );
  DFFSR \opcode_reg[11]  ( .D(n360), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        opp[11]) );
  DFFSR \opcode_reg[12]  ( .D(n358), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        opp[12]) );
  DFFSR \opcode_reg[13]  ( .D(n300), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        opp[13]) );
  DFFSR \opcode_reg[14]  ( .D(n298), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        opp[14]) );
  DFFSR \counter_reg[3]  ( .D(n294), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        counter[3]) );
  DFFSR \counter_reg[0]  ( .D(n297), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        counter[0]) );
  DFFSR \counter_reg[1]  ( .D(n296), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        counter[1]) );
  DFFSR \counter_reg[2]  ( .D(n295), .CLK(clk), .R(rst_n), .S(1'b1), .Q(
        counter[2]) );
  DFFSR \addr_reg[15]  ( .D(n276), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[15]) );
  DFFSR \addr_reg[0]  ( .D(n291), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[0])
         );
  DFFSR \addr_reg[1]  ( .D(n290), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[1])
         );
  DFFSR \addr_reg[2]  ( .D(n289), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[2])
         );
  DFFSR \addr_reg[3]  ( .D(n288), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[3])
         );
  DFFSR \addr_reg[4]  ( .D(n287), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[4])
         );
  DFFSR \addr_reg[5]  ( .D(n286), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[5])
         );
  DFFSR \addr_reg[6]  ( .D(n285), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[6])
         );
  DFFSR \addr_reg[7]  ( .D(n284), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[7])
         );
  DFFSR \addr_reg[8]  ( .D(n283), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[8])
         );
  DFFSR \addr_reg[9]  ( .D(n282), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[9])
         );
  DFFSR \addr_reg[10]  ( .D(n281), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[10]) );
  DFFSR \addr_reg[11]  ( .D(n280), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[11]) );
  DFFSR \addr_reg[12]  ( .D(n279), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[12]) );
  DFFSR \addr_reg[13]  ( .D(n278), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[13]) );
  DFFSR \addr_reg[14]  ( .D(n277), .CLK(clk), .R(rst_n), .S(1'b1), .Q(addr[14]) );
  DFFSR re_reg ( .D(nextre), .CLK(clk), .R(rst_n), .S(1'b1), .Q(re) );
  NOR2X1 U4 ( .A(n1), .B(n2), .Y(strb_matrix) );
  NOR2X1 U5 ( .A(n2), .B(n3), .Y(strb_cor) );
  OAI21X1 U6 ( .A(n367), .B(n368), .C(n376), .Y(nextre) );
  NAND2X1 U8 ( .A(n7), .B(n8), .Y(n276) );
  AOI22X1 U9 ( .A(addr[15]), .B(n333), .C(N312), .D(n379), .Y(n8) );
  AOI22X1 U10 ( .A(rast_addr[15]), .B(n384), .C(databus[15]), .D(n385), .Y(n7)
         );
  NAND2X1 U11 ( .A(n13), .B(n14), .Y(n277) );
  AOI22X1 U12 ( .A(n333), .B(addr[14]), .C(N311), .D(n379), .Y(n14) );
  AOI22X1 U13 ( .A(rast_addr[14]), .B(n384), .C(databus[14]), .D(n385), .Y(n13) );
  NAND2X1 U14 ( .A(n15), .B(n16), .Y(n278) );
  AOI22X1 U15 ( .A(n333), .B(addr[13]), .C(N310), .D(n379), .Y(n16) );
  AOI22X1 U16 ( .A(rast_addr[13]), .B(n384), .C(databus[13]), .D(n385), .Y(n15) );
  NAND2X1 U17 ( .A(n17), .B(n18), .Y(n279) );
  AOI22X1 U18 ( .A(n333), .B(addr[12]), .C(N309), .D(n379), .Y(n18) );
  AOI22X1 U19 ( .A(rast_addr[12]), .B(n384), .C(databus[12]), .D(n385), .Y(n17) );
  NAND2X1 U20 ( .A(n19), .B(n20), .Y(n280) );
  AOI22X1 U21 ( .A(n333), .B(addr[11]), .C(N308), .D(n379), .Y(n20) );
  AOI22X1 U22 ( .A(rast_addr[11]), .B(n384), .C(databus[11]), .D(n385), .Y(n19) );
  NAND2X1 U23 ( .A(n21), .B(n22), .Y(n281) );
  AOI22X1 U24 ( .A(n333), .B(addr[10]), .C(N307), .D(n379), .Y(n22) );
  AOI22X1 U25 ( .A(rast_addr[10]), .B(n384), .C(databus[10]), .D(n385), .Y(n21) );
  NAND2X1 U26 ( .A(n23), .B(n24), .Y(n282) );
  AOI22X1 U27 ( .A(n333), .B(addr[9]), .C(N306), .D(n379), .Y(n24) );
  AOI22X1 U28 ( .A(rast_addr[9]), .B(n384), .C(databus[9]), .D(n385), .Y(n23)
         );
  NAND2X1 U29 ( .A(n25), .B(n26), .Y(n283) );
  AOI22X1 U30 ( .A(n333), .B(addr[8]), .C(N305), .D(n379), .Y(n26) );
  AOI22X1 U31 ( .A(rast_addr[8]), .B(n384), .C(databus[8]), .D(n385), .Y(n25)
         );
  NAND2X1 U32 ( .A(n27), .B(n28), .Y(n284) );
  AOI22X1 U33 ( .A(n333), .B(addr[7]), .C(N304), .D(n379), .Y(n28) );
  AOI22X1 U34 ( .A(rast_addr[7]), .B(n384), .C(databus[7]), .D(n385), .Y(n27)
         );
  NAND2X1 U35 ( .A(n29), .B(n30), .Y(n285) );
  AOI22X1 U36 ( .A(n333), .B(addr[6]), .C(N303), .D(n379), .Y(n30) );
  AOI22X1 U37 ( .A(rast_addr[6]), .B(n384), .C(databus[6]), .D(n385), .Y(n29)
         );
  NAND2X1 U38 ( .A(n31), .B(n32), .Y(n286) );
  AOI22X1 U39 ( .A(n333), .B(addr[5]), .C(N302), .D(n379), .Y(n32) );
  AOI22X1 U40 ( .A(rast_addr[5]), .B(n384), .C(databus[5]), .D(n385), .Y(n31)
         );
  NAND2X1 U41 ( .A(n33), .B(n34), .Y(n287) );
  AOI22X1 U42 ( .A(n333), .B(addr[4]), .C(N301), .D(n379), .Y(n34) );
  AOI22X1 U43 ( .A(rast_addr[4]), .B(n384), .C(databus[4]), .D(n385), .Y(n33)
         );
  NAND2X1 U44 ( .A(n35), .B(n36), .Y(n288) );
  AOI22X1 U45 ( .A(n333), .B(addr[3]), .C(N300), .D(n379), .Y(n36) );
  AOI22X1 U46 ( .A(rast_addr[3]), .B(n384), .C(databus[3]), .D(n385), .Y(n35)
         );
  NAND2X1 U47 ( .A(n37), .B(n38), .Y(n289) );
  AOI22X1 U48 ( .A(n333), .B(addr[2]), .C(N299), .D(n379), .Y(n38) );
  AOI22X1 U49 ( .A(rast_addr[2]), .B(n384), .C(databus[2]), .D(n385), .Y(n37)
         );
  NAND2X1 U50 ( .A(n39), .B(n40), .Y(n290) );
  AOI22X1 U51 ( .A(n333), .B(addr[1]), .C(N298), .D(n379), .Y(n40) );
  AOI22X1 U52 ( .A(rast_addr[1]), .B(n384), .C(databus[1]), .D(n385), .Y(n39)
         );
  NAND2X1 U53 ( .A(n41), .B(n42), .Y(n291) );
  AOI22X1 U54 ( .A(n333), .B(addr[0]), .C(N297), .D(n379), .Y(n42) );
  NAND3X1 U56 ( .A(n45), .B(n46), .C(n383), .Y(n44) );
  NAND3X1 U58 ( .A(n49), .B(n386), .C(n51), .Y(n43) );
  AOI22X1 U59 ( .A(rast_addr[0]), .B(n384), .C(databus[0]), .D(n385), .Y(n41)
         );
  AOI22X1 U63 ( .A(databus[15]), .B(n338), .C(n334), .D(data_reg[15]), .Y(n54)
         );
  OAI21X1 U64 ( .A(n381), .B(n390), .C(n59), .Y(n293) );
  NAND2X1 U65 ( .A(N317), .B(n379), .Y(n59) );
  OAI21X1 U66 ( .A(n381), .B(n404), .C(n61), .Y(n294) );
  NAND2X1 U67 ( .A(N316), .B(n379), .Y(n61) );
  OAI21X1 U68 ( .A(n381), .B(n407), .C(n63), .Y(n295) );
  NAND2X1 U69 ( .A(N315), .B(n379), .Y(n63) );
  OAI21X1 U70 ( .A(n381), .B(n406), .C(n65), .Y(n296) );
  NAND2X1 U71 ( .A(N314), .B(n379), .Y(n65) );
  OAI21X1 U72 ( .A(n381), .B(n405), .C(n67), .Y(n297) );
  NAND2X1 U73 ( .A(n405), .B(n379), .Y(n67) );
  NAND3X1 U75 ( .A(n69), .B(n386), .C(n382), .Y(n68) );
  OAI22X1 U77 ( .A(n336), .B(n403), .C(n73), .D(n337), .Y(n298) );
  AOI22X1 U80 ( .A(databus[14]), .B(n338), .C(n334), .D(data_reg[14]), .Y(n75)
         );
  OAI22X1 U81 ( .A(n336), .B(n402), .C(n77), .D(n337), .Y(n300) );
  AOI22X1 U84 ( .A(databus[13]), .B(n338), .C(n334), .D(data_reg[13]), .Y(n78)
         );
  AOI22X1 U86 ( .A(n337), .B(opp[12]), .C(databus[12]), .D(n336), .Y(n79) );
  AOI22X1 U88 ( .A(databus[12]), .B(n338), .C(n334), .D(data_reg[12]), .Y(n80)
         );
  AOI22X1 U90 ( .A(n74), .B(opp[11]), .C(databus[11]), .D(n336), .Y(n81) );
  AOI22X1 U92 ( .A(databus[11]), .B(n338), .C(n334), .D(data_reg[11]), .Y(n82)
         );
  AOI22X1 U94 ( .A(n74), .B(opp[10]), .C(databus[10]), .D(n336), .Y(n83) );
  AOI22X1 U96 ( .A(databus[10]), .B(n338), .C(n334), .D(data_reg[10]), .Y(n84)
         );
  AOI22X1 U98 ( .A(n74), .B(opp[9]), .C(databus[9]), .D(n336), .Y(n85) );
  AOI22X1 U100 ( .A(databus[9]), .B(n338), .C(n334), .D(data_reg[9]), .Y(n86)
         );
  AOI22X1 U102 ( .A(n74), .B(opp[8]), .C(databus[8]), .D(n336), .Y(n87) );
  AOI22X1 U104 ( .A(databus[8]), .B(n338), .C(n334), .D(data_reg[8]), .Y(n88)
         );
  OAI22X1 U105 ( .A(n336), .B(n400), .C(n90), .D(n337), .Y(n312) );
  AOI22X1 U108 ( .A(databus[7]), .B(n338), .C(n334), .D(data_reg[7]), .Y(n91)
         );
  OAI22X1 U109 ( .A(n336), .B(n399), .C(n93), .D(n337), .Y(n314) );
  AOI22X1 U112 ( .A(databus[6]), .B(n338), .C(n334), .D(data_reg[6]), .Y(n94)
         );
  AOI22X1 U114 ( .A(n74), .B(opp[5]), .C(databus[5]), .D(n336), .Y(n95) );
  AOI22X1 U116 ( .A(databus[5]), .B(n338), .C(n334), .D(data_reg[5]), .Y(n96)
         );
  AOI22X1 U118 ( .A(n74), .B(opp[4]), .C(databus[4]), .D(n336), .Y(n97) );
  AOI22X1 U120 ( .A(databus[4]), .B(n338), .C(n334), .D(data_reg[4]), .Y(n98)
         );
  AOI22X1 U122 ( .A(n74), .B(opp[3]), .C(databus[3]), .D(n336), .Y(n99) );
  AOI22X1 U124 ( .A(databus[3]), .B(n338), .C(n334), .D(data_reg[3]), .Y(n100)
         );
  AOI22X1 U126 ( .A(n74), .B(opp[2]), .C(databus[2]), .D(n336), .Y(n101) );
  AOI22X1 U128 ( .A(databus[2]), .B(n338), .C(n334), .D(data_reg[2]), .Y(n102)
         );
  OAI22X1 U129 ( .A(n336), .B(n397), .C(n104), .D(n337), .Y(n324) );
  AOI22X1 U132 ( .A(databus[1]), .B(n338), .C(n334), .D(data_reg[1]), .Y(n105)
         );
  OAI22X1 U133 ( .A(n336), .B(n396), .C(n107), .D(n337), .Y(n326) );
  AOI22X1 U136 ( .A(databus[0]), .B(n338), .C(n334), .D(data_reg[0]), .Y(n108)
         );
  NAND3X1 U139 ( .A(n382), .B(n69), .C(rst_n), .Y(n110) );
  NAND3X1 U140 ( .A(n46), .B(n2), .C(n111), .Y(n109) );
  OAI21X1 U141 ( .A(n112), .B(n394), .C(n114), .Y(n328) );
  OAI21X1 U142 ( .A(n115), .B(n116), .C(n112), .Y(n114) );
  OAI21X1 U143 ( .A(n117), .B(n46), .C(n380), .Y(n116) );
  NAND2X1 U145 ( .A(n120), .B(n111), .Y(n115) );
  OAI21X1 U146 ( .A(n112), .B(n395), .C(n122), .Y(n329) );
  OAI21X1 U147 ( .A(n123), .B(n124), .C(n112), .Y(n122) );
  NAND2X1 U148 ( .A(n45), .B(n367), .Y(n124) );
  NOR2X1 U149 ( .A(n389), .B(n126), .Y(n45) );
  OAI21X1 U150 ( .A(n127), .B(n128), .C(n129), .Y(n126) );
  NAND2X1 U152 ( .A(n130), .B(n391), .Y(n69) );
  NAND3X1 U153 ( .A(n132), .B(n133), .C(n134), .Y(n330) );
  NOR2X1 U154 ( .A(n123), .B(n135), .Y(n134) );
  OAI21X1 U155 ( .A(n112), .B(n393), .C(n120), .Y(n135) );
  NAND3X1 U157 ( .A(counter[2]), .B(counter[1]), .C(n388), .Y(n138) );
  NAND3X1 U159 ( .A(n404), .B(n390), .C(n140), .Y(n137) );
  NOR2X1 U160 ( .A(counter[0]), .B(n3), .Y(n140) );
  OAI21X1 U162 ( .A(err), .B(n141), .C(n142), .Y(n123) );
  AOI21X1 U164 ( .A(n144), .B(n376), .C(n365), .Y(n331) );
  NOR2X1 U166 ( .A(n146), .B(n147), .Y(n112) );
  OAI22X1 U167 ( .A(n367), .B(rast_strb), .C(n129), .D(n373), .Y(n147) );
  OAI22X1 U169 ( .A(n133), .B(n366), .C(n141), .D(math_done), .Y(n146) );
  OAI21X1 U171 ( .A(n49), .B(n151), .C(n51), .Y(n150) );
  OAI21X1 U172 ( .A(n377), .B(n378), .C(n154), .Y(n151) );
  NAND3X1 U173 ( .A(n405), .B(n404), .C(n155), .Y(n154) );
  OAI21X1 U174 ( .A(n156), .B(n157), .C(n158), .Y(n155) );
  NAND3X1 U175 ( .A(counter[2]), .B(counter[1]), .C(n159), .Y(n158) );
  NOR2X1 U176 ( .A(counter[4]), .B(n3), .Y(n159) );
  NAND2X1 U177 ( .A(counter[4]), .B(n378), .Y(n157) );
  NAND2X1 U178 ( .A(n406), .B(n407), .Y(n156) );
  NAND3X1 U184 ( .A(n160), .B(n397), .C(opp[0]), .Y(n1) );
  NAND3X1 U187 ( .A(n160), .B(n396), .C(opp[1]), .Y(n3) );
  NOR2X1 U190 ( .A(n163), .B(n398), .Y(n162) );
  NOR3X1 U192 ( .A(opp[4]), .B(opp[5]), .C(opp[3]), .Y(n165) );
  NAND3X1 U193 ( .A(n399), .B(n400), .C(n166), .Y(n163) );
  NOR2X1 U194 ( .A(opp[9]), .B(opp[8]), .Y(n166) );
  NOR2X1 U197 ( .A(n167), .B(n401), .Y(n161) );
  NOR3X1 U199 ( .A(opp[11]), .B(opp[12]), .C(opp[10]), .Y(n169) );
  NAND3X1 U200 ( .A(n402), .B(n403), .C(n170), .Y(n167) );
  NOR2X1 U201 ( .A(opp[2]), .B(opp[15]), .Y(n170) );
  NOR2X1 U204 ( .A(n274), .B(n149), .Y(n144) );
  NOR2X1 U205 ( .A(rast_done), .B(n53), .Y(n149) );
  AOI22X1 U207 ( .A(n337), .B(opp[15]), .C(databus[15]), .D(n336), .Y(n171) );
  NAND3X1 U209 ( .A(n382), .B(n46), .C(n132), .Y(n74) );
  NOR2X1 U210 ( .A(n274), .B(n379), .Y(n132) );
  NAND3X1 U212 ( .A(n391), .B(n395), .C(state[3]), .Y(n2) );
  NAND3X1 U214 ( .A(n53), .B(n49), .C(n173), .Y(n172) );
  NOR2X1 U215 ( .A(n48), .B(n119), .Y(n173) );
  NAND3X1 U216 ( .A(n52), .B(n51), .C(n129), .Y(n119) );
  NAND2X1 U217 ( .A(n174), .B(n392), .Y(n129) );
  NAND2X1 U218 ( .A(n392), .B(state[3]), .Y(n51) );
  NAND2X1 U219 ( .A(n174), .B(n391), .Y(n52) );
  NAND3X1 U221 ( .A(n141), .B(n143), .C(n133), .Y(n48) );
  NAND3X1 U222 ( .A(state[2]), .B(state[0]), .C(n174), .Y(n133) );
  NAND3X1 U223 ( .A(state[3]), .B(n177), .C(state[2]), .Y(n143) );
  XOR2X1 U224 ( .A(state[1]), .B(state[0]), .Y(n177) );
  NAND3X1 U225 ( .A(n130), .B(n394), .C(state[2]), .Y(n49) );
  NAND3X1 U226 ( .A(state[2]), .B(n394), .C(n174), .Y(n53) );
  NOR2X1 U227 ( .A(n395), .B(state[3]), .Y(n174) );
  OAI21X1 U229 ( .A(n176), .B(n128), .C(n111), .Y(n274) );
  NAND3X1 U230 ( .A(state[2]), .B(state[3]), .C(n178), .Y(n111) );
  NOR2X1 U231 ( .A(state[1]), .B(state[0]), .Y(n178) );
  NAND2X1 U232 ( .A(state[1]), .B(state[3]), .Y(n128) );
  NAND2X1 U233 ( .A(state[0]), .B(n393), .Y(n176) );
  NOR2X1 U235 ( .A(n372), .B(n180), .Y(init_rast) );
  NAND3X1 U237 ( .A(n130), .B(state[0]), .C(state[2]), .Y(n141) );
  NOR2X1 U239 ( .A(n373), .B(n46), .Y(gpu_done) );
  NAND2X1 U240 ( .A(n130), .B(n392), .Y(n46) );
  NAND2X1 U242 ( .A(n393), .B(n394), .Y(n127) );
  NOR2X1 U245 ( .A(state[3]), .B(state[1]), .Y(n130) );
  NAND2X1 U247 ( .A(tem), .B(n374), .Y(n117) );
  AOI21X1 U249 ( .A(n182), .B(n183), .C(data_reg[9]), .Y(n200) );
  AOI21X1 U250 ( .A(n184), .B(n182), .C(data_reg[8]), .Y(n202) );
  AOI21X1 U251 ( .A(n185), .B(n186), .C(data_reg[7]), .Y(n203) );
  AOI21X1 U252 ( .A(n187), .B(n186), .C(data_reg[6]), .Y(n204) );
  AOI21X1 U253 ( .A(n186), .B(n183), .C(data_reg[5]), .Y(n205) );
  AOI21X1 U254 ( .A(n186), .B(n184), .C(data_reg[4]), .Y(n206) );
  NOR2X1 U255 ( .A(n370), .B(rast_index[3]), .Y(n186) );
  AOI21X1 U256 ( .A(n189), .B(n185), .C(data_reg[3]), .Y(n207) );
  AOI21X1 U257 ( .A(n189), .B(n187), .C(data_reg[2]), .Y(n208) );
  AOI21X1 U258 ( .A(n189), .B(n183), .C(data_reg[1]), .Y(n209) );
  AOI21X1 U259 ( .A(n190), .B(n185), .C(data_reg[15]), .Y(n194) );
  AOI21X1 U260 ( .A(n190), .B(n187), .C(data_reg[14]), .Y(n195) );
  AOI21X1 U261 ( .A(n190), .B(n183), .C(data_reg[13]), .Y(n196) );
  NOR2X1 U262 ( .A(n371), .B(rast_index[1]), .Y(n183) );
  AOI21X1 U263 ( .A(n190), .B(n184), .C(data_reg[12]), .Y(n197) );
  NOR2X1 U264 ( .A(n370), .B(n369), .Y(n190) );
  AOI21X1 U266 ( .A(n185), .B(n182), .C(data_reg[11]), .Y(n198) );
  AOI21X1 U268 ( .A(n187), .B(n182), .C(data_reg[10]), .Y(n199) );
  NOR2X1 U269 ( .A(n369), .B(rast_index[2]), .Y(n182) );
  NAND3X1 U274 ( .A(n366), .B(n423), .C(we), .Y(n193) );
  AOI21X1 U276 ( .A(n189), .B(n184), .C(data_reg[0]), .Y(n210) );
  NOR2X1 U277 ( .A(rast_index[1]), .B(rast_index[0]), .Y(n184) );
  NOR2X1 U278 ( .A(rast_index[3]), .B(rast_index[2]), .Y(n189) );
  INVX2 U78 ( .A(databus[14]), .Y(n73) );
  INVX2 U82 ( .A(databus[13]), .Y(n77) );
  INVX2 U106 ( .A(databus[7]), .Y(n90) );
  INVX2 U110 ( .A(databus[6]), .Y(n93) );
  INVX2 U130 ( .A(databus[1]), .Y(n104) );
  INVX2 U134 ( .A(databus[0]), .Y(n107) );
  OR2X2 U156 ( .A(n137), .B(n138), .Y(n120) );
  AND2X2 U163 ( .A(n143), .B(n52), .Y(n142) );
  AND2X2 U189 ( .A(n161), .B(n162), .Y(n160) );
  OR2X2 U236 ( .A(n141), .B(err), .Y(n180) );
  AND2X2 U267 ( .A(rast_index[1]), .B(rast_index[0]), .Y(n185) );
  AND2X2 U271 ( .A(rast_index[1]), .B(n371), .Y(n187) );
  gpu_controller_DW01_inc_1 add_212 ( .A(addr), .SUM({N312, N311, N310, N309, 
        N308, N307, N306, N305, N304, N303, N302, N301, N300, N299, N298, N297}) );
  HAX1 \add_213/U1_1_1  ( .A(counter[1]), .B(counter[0]), .YC(
        \add_213/carry[2] ), .YS(N314) );
  HAX1 \add_213/U1_1_2  ( .A(counter[2]), .B(\add_213/carry[2] ), .YC(
        \add_213/carry[3] ), .YS(N315) );
  HAX1 \add_213/U1_1_3  ( .A(counter[3]), .B(\add_213/carry[3] ), .YC(
        \add_213/carry[4] ), .YS(N316) );
  TBUFX1 \databus_tri[2]  ( .A(n208), .EN(n335), .Y(databus[2]) );
  TBUFX1 \databus_tri[3]  ( .A(n207), .EN(n335), .Y(databus[3]) );
  TBUFX1 \databus_tri[15]  ( .A(n194), .EN(n335), .Y(databus[15]) );
  TBUFX1 \databus_tri[14]  ( .A(n195), .EN(n335), .Y(databus[14]) );
  TBUFX1 \databus_tri[4]  ( .A(n206), .EN(n335), .Y(databus[4]) );
  TBUFX1 \databus_tri[12]  ( .A(n197), .EN(n335), .Y(databus[12]) );
  TBUFX1 \databus_tri[8]  ( .A(n202), .EN(n335), .Y(databus[8]) );
  TBUFX1 \databus_tri[10]  ( .A(n199), .EN(n335), .Y(databus[10]) );
  TBUFX1 \databus_tri[11]  ( .A(n198), .EN(n335), .Y(databus[11]) );
  TBUFX1 \databus_tri[5]  ( .A(n205), .EN(n335), .Y(databus[5]) );
  TBUFX1 \databus_tri[9]  ( .A(n200), .EN(n335), .Y(databus[9]) );
  TBUFX1 \databus_tri[0]  ( .A(n210), .EN(n335), .Y(databus[0]) );
  TBUFX1 \databus_tri[6]  ( .A(n204), .EN(n335), .Y(databus[6]) );
  TBUFX1 \databus_tri[7]  ( .A(n203), .EN(n335), .Y(databus[7]) );
  TBUFX1 \databus_tri[1]  ( .A(n209), .EN(n335), .Y(databus[1]) );
  TBUFX1 \databus_tri[13]  ( .A(n196), .EN(n335), .Y(databus[13]) );
  TBUFX1 re_out_tri ( .A(n423), .EN(n366), .Y(re_out) );
  TBUFX1 we_out_tri ( .A(n375), .EN(n366), .Y(we_out) );
  TBUFX1 \addr_out_tri[1]  ( .A(n409), .EN(n366), .Y(addr_out[1]) );
  TBUFX1 \addr_out_tri[2]  ( .A(n410), .EN(n366), .Y(addr_out[2]) );
  TBUFX1 \addr_out_tri[3]  ( .A(n411), .EN(n366), .Y(addr_out[3]) );
  TBUFX1 \addr_out_tri[4]  ( .A(n412), .EN(n366), .Y(addr_out[4]) );
  TBUFX1 \addr_out_tri[5]  ( .A(n413), .EN(n366), .Y(addr_out[5]) );
  TBUFX1 \addr_out_tri[6]  ( .A(n414), .EN(n366), .Y(addr_out[6]) );
  TBUFX1 \addr_out_tri[7]  ( .A(n415), .EN(n366), .Y(addr_out[7]) );
  TBUFX1 \addr_out_tri[8]  ( .A(n416), .EN(n366), .Y(addr_out[8]) );
  TBUFX1 \addr_out_tri[9]  ( .A(n417), .EN(n366), .Y(addr_out[9]) );
  TBUFX1 \addr_out_tri[10]  ( .A(n418), .EN(n366), .Y(addr_out[10]) );
  TBUFX1 \addr_out_tri[11]  ( .A(n419), .EN(n366), .Y(addr_out[11]) );
  TBUFX1 \addr_out_tri[12]  ( .A(n420), .EN(n366), .Y(addr_out[12]) );
  TBUFX1 \addr_out_tri[13]  ( .A(n421), .EN(n366), .Y(addr_out[13]) );
  TBUFX1 \addr_out_tri[14]  ( .A(n422), .EN(n366), .Y(addr_out[14]) );
  TBUFX1 \addr_out_tri[0]  ( .A(n408), .EN(n366), .Y(addr_out[0]) );
  OR2X2 U340 ( .A(n43), .B(n44), .Y(n333) );
  INVX2 U341 ( .A(n336), .Y(n337) );
  INVX2 U342 ( .A(n74), .Y(n336) );
  INVX2 U343 ( .A(n52), .Y(n385) );
  INVX2 U344 ( .A(n2), .Y(n379) );
  INVX2 U345 ( .A(n334), .Y(n338) );
  INVX2 U346 ( .A(n53), .Y(n384) );
  INVX2 U347 ( .A(n193), .Y(n335) );
  OR2X2 U348 ( .A(n109), .B(n110), .Y(n334) );
  INVX2 U349 ( .A(ram_in_use), .Y(n366) );
  XOR2X1 U350 ( .A(\add_213/carry[4] ), .B(counter[4]), .Y(N317) );
  INVX2 U351 ( .A(n54), .Y(n339) );
  INVX2 U352 ( .A(n75), .Y(n340) );
  INVX2 U353 ( .A(n78), .Y(n341) );
  INVX2 U354 ( .A(n80), .Y(n342) );
  INVX2 U355 ( .A(n82), .Y(n343) );
  INVX2 U356 ( .A(n84), .Y(n344) );
  INVX2 U357 ( .A(n86), .Y(n345) );
  INVX2 U358 ( .A(n88), .Y(n346) );
  INVX2 U359 ( .A(n91), .Y(n347) );
  INVX2 U360 ( .A(n94), .Y(n348) );
  INVX2 U361 ( .A(n96), .Y(n349) );
  INVX2 U362 ( .A(n98), .Y(n350) );
  INVX2 U363 ( .A(n100), .Y(n351) );
  INVX2 U364 ( .A(n102), .Y(n352) );
  INVX2 U365 ( .A(n105), .Y(n353) );
  INVX2 U366 ( .A(n108), .Y(n354) );
  INVX2 U367 ( .A(n85), .Y(n355) );
  INVX2 U368 ( .A(n95), .Y(n356) );
  INVX2 U369 ( .A(n99), .Y(n357) );
  INVX2 U370 ( .A(n79), .Y(n358) );
  INVX2 U371 ( .A(n83), .Y(n359) );
  INVX2 U372 ( .A(n81), .Y(n360) );
  INVX2 U373 ( .A(n171), .Y(n361) );
  INVX2 U374 ( .A(n101), .Y(n362) );
  INVX2 U375 ( .A(n97), .Y(n363) );
  INVX2 U376 ( .A(n87), .Y(n364) );
  INVX2 U377 ( .A(n112), .Y(n365) );
  INVX2 U378 ( .A(n149), .Y(n367) );
  INVX2 U379 ( .A(rast_strb), .Y(n368) );
  INVX2 U380 ( .A(rast_index[3]), .Y(n369) );
  INVX2 U381 ( .A(rast_index[2]), .Y(n370) );
  INVX2 U382 ( .A(rast_index[0]), .Y(n371) );
  INVX2 U383 ( .A(math_done), .Y(n372) );
  INVX2 U384 ( .A(n117), .Y(n373) );
  INVX2 U385 ( .A(tem2), .Y(n374) );
  INVX2 U386 ( .A(we), .Y(n375) );
  INVX2 U387 ( .A(n150), .Y(n376) );
  INVX2 U388 ( .A(n3), .Y(n377) );
  INVX2 U389 ( .A(n1), .Y(n378) );
  INVX2 U390 ( .A(n119), .Y(n380) );
  INVX2 U391 ( .A(n68), .Y(n381) );
  INVX2 U392 ( .A(n172), .Y(n382) );
  INVX2 U393 ( .A(n48), .Y(n383) );
  INVX2 U394 ( .A(n274), .Y(n386) );
  INVX2 U395 ( .A(n141), .Y(init_math) );
  INVX2 U396 ( .A(n49), .Y(n388) );
  INVX2 U397 ( .A(n69), .Y(n389) );
  INVX2 U398 ( .A(counter[4]), .Y(n390) );
  INVX2 U399 ( .A(n176), .Y(n391) );
  INVX2 U400 ( .A(n127), .Y(n392) );
  INVX2 U401 ( .A(state[2]), .Y(n393) );
  INVX2 U402 ( .A(state[0]), .Y(n394) );
  INVX2 U403 ( .A(state[1]), .Y(n395) );
  INVX2 U404 ( .A(opp[0]), .Y(n396) );
  INVX2 U405 ( .A(opp[1]), .Y(n397) );
  INVX2 U406 ( .A(n165), .Y(n398) );
  INVX2 U407 ( .A(opp[6]), .Y(n399) );
  INVX2 U408 ( .A(opp[7]), .Y(n400) );
  INVX2 U409 ( .A(n169), .Y(n401) );
  INVX2 U410 ( .A(opp[13]), .Y(n402) );
  INVX2 U411 ( .A(opp[14]), .Y(n403) );
  INVX2 U412 ( .A(counter[3]), .Y(n404) );
  INVX2 U413 ( .A(counter[0]), .Y(n405) );
  INVX2 U414 ( .A(counter[1]), .Y(n406) );
  INVX2 U415 ( .A(counter[2]), .Y(n407) );
  INVX2 U416 ( .A(addr[0]), .Y(n408) );
  INVX2 U417 ( .A(addr[1]), .Y(n409) );
  INVX2 U418 ( .A(addr[2]), .Y(n410) );
  INVX2 U419 ( .A(addr[3]), .Y(n411) );
  INVX2 U420 ( .A(addr[4]), .Y(n412) );
  INVX2 U421 ( .A(addr[5]), .Y(n413) );
  INVX2 U422 ( .A(addr[6]), .Y(n414) );
  INVX2 U423 ( .A(addr[7]), .Y(n415) );
  INVX2 U424 ( .A(addr[8]), .Y(n416) );
  INVX2 U425 ( .A(addr[9]), .Y(n417) );
  INVX2 U426 ( .A(addr[10]), .Y(n418) );
  INVX2 U427 ( .A(addr[11]), .Y(n419) );
  INVX2 U428 ( .A(addr[12]), .Y(n420) );
  INVX2 U429 ( .A(addr[13]), .Y(n421) );
  INVX2 U430 ( .A(addr[14]), .Y(n422) );
  INVX2 U431 ( .A(re), .Y(n423) );
endmodule

