
`timescale 1 ns / 1 ps

module Sum_Logic_3bit (
	input             cin,
	input       [2:0] gx,
	input       [2:0] px,
	output wire [2:0] sum_output,
	output wire       cout
);

assign cout             = gx[2];
assign sum_output[0]    = cin ^ px[0];
assign sum_output[2:1]  = gx[1:0] ^ px[2:1];

endmodule



