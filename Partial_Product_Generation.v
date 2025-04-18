
`timescale 1 ns / 1 ps

module Partial_Product_Generation (
	input          [2:0] a,
	input          [2:0] b,
	output wire          a0b0,
	output wire          a0b1,
	output wire          a0b2,
	output wire          a1b0,
	output wire          a1b1,
	output wire          a1b2,
	output wire          a2b0,
	output wire          a2b1,
	output wire          a2b2
);

assign a0b0 = a[0] & b[0];
assign a0b1 = a[0] & b[1];
assign a0b2 = a[0] & b[2];

assign a1b0 = a[1] & b[0];
assign a1b1 = a[1] & b[1];
assign a1b2 = a[1] & b[2];

assign a2b0 = a[2] & b[0];
assign a2b1 = a[2] & b[1];
assign a2b2 = a[2] & b[2];

endmodule
