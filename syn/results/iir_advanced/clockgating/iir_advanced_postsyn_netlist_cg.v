/////////////////////////////////////////////////////////////
// Created by: Synopsys Design Compiler(R)
// Version   : S-2021.06-SP4
// Date      : Mon Nov 13 16:53:48 2023
/////////////////////////////////////////////////////////////


module iir_advanced ( CLK, RST_n, VIN, DIN, a1, b0, b1, DOUT, VOUT );
  input [12:0] DIN;
  input [12:0] a1;
  input [12:0] b0;
  input [12:0] b1;
  output [12:0] DOUT;
  input CLK, RST_n, VIN;
  output VOUT;
  wire   N0, N1, vin_i, N2, N3, N4, N5, N6, N7, N8, N9, N10, N11, N12, N13,
         N14, N15, N16, N17, net8, net9, net10, net11, net12, net13, net14,
         net15, net16, net17, net18, net19, net20, net21, net22, net23, net24,
         net25, net26, net27, net28, net29, net30, net31, net32, net33, net34,
         net35, net36, net37, net38, net39, net40, net41, net42, net43, net44,
         net45, net46, net47, net48, net49, net50, net51, net52, net53, net54,
         net55, net56, net57, net58, net59, net60, net61, net62, net63, net64,
         net65, net66, net67, net68, net69, net70, net71, net72, net73, net74,
         net75, net76, net77, net78, net79, net80, net81, net82, net83, net84,
         net85, net86, net87, net88, net89, net90, net91, net92, net93, net94,
         net95, net96, net97, net98, net99, net100, net101, net102, net103,
         net104, net105, net106, net107;
  wire   [13:0] x;
  wire   [13:0] a1_i;
  wire   [13:0] b0_i;
  wire   [13:0] b1_i;
  wire   [13:0] w_1;
  wire   [13:0] w;
  wire   [13:0] w_2;
  wire   [13:0] x_1;
  wire   [13:0] c_1;
  wire   [13:0] d_1;
  wire   [13:0] d;
  wire   [13:0] e_1;
  wire   [13:0] e_2;
  wire   [12:0] f_1;
  wire   [12:0] f_2;
  wire   [12:0] g_1;
  wire   [24:20] a2_ext;
  wire   [24:20] c_ext;
  wire   [24:20] e_ext;
  wire   [24:20] f_ext;
  wire   [24:20] g_ext;
  wire   [12:0] y_tmp;

  \**SEQGEN**  b0_i_reg_13_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_12_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_11_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_10_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_9_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_8_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_7_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_6_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_5_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_4_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_3_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_2_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_1_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b0_i_reg_0_ ( .clear(1'b0), .preset(1'b0), .next_state(b0[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b0_i[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  x_reg_13_ ( .clear(N17), .preset(1'b0), .next_state(N15), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(N15), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(N14), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(N13), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(N12), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(N11), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(N10), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(N9), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(N8), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(N7), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(N6), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(N5), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(N4), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  x_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(N3), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  vin_i_reg ( .clear(N17), .preset(1'b0), .next_state(VIN), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(vin_i), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  b1_i_reg_13_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_12_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_11_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_10_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_9_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_8_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_7_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_6_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_5_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_4_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_3_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_2_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_1_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  b1_i_reg_0_ ( .clear(1'b0), .preset(1'b0), .next_state(b1[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(b1_i[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_13_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_12_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_11_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_10_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_9_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_8_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_7_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_6_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_5_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_4_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_3_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_2_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_1_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  a1_i_reg_0_ ( .clear(1'b0), .preset(1'b0), .next_state(a1[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(a1_i[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(N16) );
  \**SEQGEN**  VOUT_reg ( .clear(N17), .preset(1'b0), .next_state(vin_i), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(VOUT), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(
        y_tmp[12]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(
        DOUT[12]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(
        y_tmp[11]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(
        DOUT[11]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(
        y_tmp[10]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(
        DOUT[10]), .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  DOUT_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(y_tmp[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(DOUT[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(1'b1) );
  \**SEQGEN**  w_1_reg_13_ ( .clear(N17), .preset(1'b0), .next_state(w[13]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(w[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(w[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(w[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(w[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(w[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(w[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(w[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(w[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(w[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(w[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(w[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(w[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_1_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(w[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_13_ ( .clear(N17), .preset(1'b0), .next_state(w_1[13]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(w_1[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(w_1[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(w_1[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(w_1[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(w_1[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(w_1[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(w_1[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(w_1[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(w_1[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(w_1[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(w_1[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(w_1[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  w_2_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(w_1[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(w_2[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_13_ ( .clear(N17), .preset(1'b0), .next_state(x[13]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(x[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(x[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(x[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(x[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(x[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(x[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(x[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(x[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(x[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(x[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(x[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(x[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  x_1_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(x[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(x_1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_13_ ( .clear(N17), .preset(1'b0), .next_state(c_ext[24]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[13]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  c_1_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(c_ext[24]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[12]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  c_1_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(c_ext[23]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[11]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  c_1_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(c_ext[22]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[10]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  c_1_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(c_ext[21]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(c_ext[20]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  c_1_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(c_1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_13_ ( .clear(N17), .preset(1'b0), .next_state(d[13]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(d[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(d[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(d[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(d[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(d[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(d[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(d[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(d[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(d[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(d[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(d[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(d[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  d_1_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(d[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(d_1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_13_ ( .clear(N17), .preset(1'b0), .next_state(e_ext[24]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[13]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  e_1_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(e_ext[24]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[12]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  e_1_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(e_ext[23]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[11]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  e_1_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(e_ext[22]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[10]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  e_1_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(e_ext[21]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(e_ext[20]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_1_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_13_ ( .clear(N17), .preset(1'b0), .next_state(e_1[13]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[13]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(e_1[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(e_1[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(e_1[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(e_1[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(e_1[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(e_1[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(e_1[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(e_1[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(e_1[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(e_1[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(e_1[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(e_1[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  e_2_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(e_1[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(e_2[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(f_ext[24]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[12]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  f_1_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(f_ext[23]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[11]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  f_1_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(f_ext[22]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[10]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  f_1_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(f_ext[21]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(f_ext[20]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_1_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(f_1[12]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[12]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(f_1[11]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[11]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(f_1[10]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[10]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(f_1[9]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(f_1[8]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(f_1[7]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(f_1[6]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(f_1[5]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(f_1[4]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(f_1[3]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(f_1[2]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(f_1[1]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  f_2_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(f_1[0]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(f_2[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_12_ ( .clear(N17), .preset(1'b0), .next_state(g_ext[24]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[12]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  g_1_reg_11_ ( .clear(N17), .preset(1'b0), .next_state(g_ext[23]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[11]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  g_1_reg_10_ ( .clear(N17), .preset(1'b0), .next_state(g_ext[22]), .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[10]), .synch_clear(
        1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), .synch_enable(vin_i)
         );
  \**SEQGEN**  g_1_reg_9_ ( .clear(N17), .preset(1'b0), .next_state(g_ext[21]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[9]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_8_ ( .clear(N17), .preset(1'b0), .next_state(g_ext[20]), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[8]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_7_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[7]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_6_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[6]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_5_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[5]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_4_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[4]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_3_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[3]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_2_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[2]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_1_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[1]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  \**SEQGEN**  g_1_reg_0_ ( .clear(N17), .preset(1'b0), .next_state(1'b0), 
        .clocked_on(CLK), .data_in(1'b0), .enable(1'b0), .Q(g_1[0]), 
        .synch_clear(1'b0), .synch_preset(1'b0), .synch_toggle(1'b0), 
        .synch_enable(vin_i) );
  GTECH_NOT I_0 ( .A(RST_n), .Z(N17) );
  ADD_TC_OP add_243 ( .A(g_1), .B(f_2), .Z(y_tmp) );
  ADD_TC_OP add_242 ( .A(d_1), .B(e_2), .Z(w) );
  MULT_TC_OP mult_225 ( .A(x_1), .B(a1_i), .Z({c_ext, net8, net9, net10, net11, 
        net12, net13, net14, net15, net16, net17, net18, net19, net20, net21, 
        net22, net23, net24, net25, net26, net27}) );
  SUB_TC_OP sub_241 ( .A(x_1), .B(c_1), .Z(d) );
  MULT_TC_OP mult_227 ( .A(w_1), .B(b1_i), .Z({f_ext, net48, net49, net50, 
        net51, net52, net53, net54, net55, net56, net57, net58, net59, net60, 
        net61, net62, net63, net64, net65, net66, net67}) );
  MULT_TC_OP mult_228 ( .A(w_1), .B(b0_i), .Z({g_ext, net28, net29, net30, 
        net31, net32, net33, net34, net35, net36, net37, net38, net39, net40, 
        net41, net42, net43, net44, net45, net46, net47}) );
  MULT_TC_OP mult_223 ( .A(a1_i), .B(a1_i), .Z({a2_ext, net68, net69, net70, 
        net71, net72, net73, net74, net75, net76, net77, net78, net79, net80, 
        net81, net82, net83, net84, net85, net86, net87}) );
  MULT_TC_OP mult_226 ( .A(w_2), .B({a2_ext, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0}), .Z({e_ext, net88, net89, net90, net91, net92, 
        net93, net94, net95, net96, net97, net98, net99, net100, net101, 
        net102, net103, net104, net105, net106, net107}) );
  SELECT_OP C951 ( .DATA1(DIN), .DATA2({1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CONTROL1(N0), .CONTROL2(
        N1), .Z({N15, N14, N13, N12, N11, N10, N9, N8, N7, N6, N5, N4, N3}) );
  GTECH_BUF B_0 ( .A(VIN), .Z(N0) );
  GTECH_BUF B_1 ( .A(N2), .Z(N1) );
  GTECH_NOT I_1 ( .A(VIN), .Z(N2) );
  GTECH_AND2 C959 ( .A(VIN), .B(RST_n), .Z(N16) );
endmodule

