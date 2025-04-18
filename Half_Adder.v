
`timescale 1 ns / 1 ps

module Half_Adder (
	input         a,
	input         b,
	output wire   sum,
	output wire   carry
);

assign sum   = a ^ b;
assign carry = a & b;

endmodule

