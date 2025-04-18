
`timescale 1 ns / 1 ps

module Frequency_Precision_Controller (
	input             clk1,
	input             clk2,
	input             clk3,
	input             reset,
	input       [1:0] Mode,
	output wire       clk_out,
	output wire       select_1,
	output wire       select_2,
	output wire       select_3
);

wire sel_x1;
wire sel_x2;
wire sel_x3;
wire x1;
wire x2;
wire x3; 
wire x1_samp;
wire x2_samp;
wire x3_samp;
wire qb1;
wire qb2;
wire qb3;
wire y1;
wire y2;
wire y3;
wire q1;
wire q2;
wire q3;

assign select_1 = sel_x1;
assign select_2 = sel_x2;
assign select_3 = sel_x3;

One_Hot_Encoder OHEx1 (
	.Mode_input      (Mode),
	.select_1        (sel_x1),
	.select_2        (sel_x2),
	.select_3        (sel_x3)
);

//--------------------------------------------------
assign x1 = sel_x1 & qb3 & qb2;

D_Flip_Flop dx1 ( .clk (clk1), .reset (reset), .din (x1),      .q (x1_samp), .qb(   ) );
D_Flip_Flop dx2 ( .clk (clk1), .reset (reset), .din (x1_samp), .q (q1     ), .qb(qb1) );

assign y1 = q1 & clk1;
//--------------------------------------------------
//--------------------------------------------------
assign x2 = sel_x2 & qb1 & qb3;

D_Flip_Flop dx3 ( .clk (clk2), .reset (reset), .din (x2),      .q (x2_samp), .qb(   ) );
D_Flip_Flop dx4 ( .clk (clk2), .reset (reset), .din (x2_samp), .q (q2     ), .qb(qb2) );

assign y2 = q2 & clk2;
//--------------------------------------------------
//--------------------------------------------------
assign x3 = sel_x3 & qb1 & qb2;

D_Flip_Flop dx5 ( .clk (clk3), .reset (reset), .din (x3),      .q (x3_samp), .qb(   ) );
D_Flip_Flop dx6 ( .clk (clk3), .reset (reset), .din (x3_samp), .q (q3     ), .qb(qb3) );

assign y3 = q3 & clk3;
//--------------------------------------------------
//--------------------------------------------------
assign clk_out = y1 | y2 | y3;

endmodule


