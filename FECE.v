
`timescale 1 ns / 1 ps

module FECE (
	input       [2:0] x,
	input       [2:0] y,
	output wire [5:0] Sout
);

wire   a0b0;
wire   a0b1;
wire   a0b2;
wire   a1b0;
wire   a1b1;
wire   a1b2;
wire   a2b0;
wire   a2b1;
wire   a2b2;
wire   sx1;
wire   sx2;
wire   cx1;
wire   cx2;
wire   cx3;

Partial_Product_Generation ppgx1 (
	.a            (x),
	.b            (y),
	.a0b0         (a0b0),
	.a0b1         (a0b1),
	.a0b2         (a0b2),
	.a1b0         (a1b0),
	.a1b1         (a1b1),
	.a1b2         (a1b2),
	.a2b0         (a2b0),
	.a2b1         (a2b1),
	.a2b2         (a2b2)
);

assign Sout[0] = a0b0;

Half_Adder hx1 ( .a (a0b1), .b (a1b0),            .sum (Sout[1]), .carry (cx1) );
Full_Adder fx1 ( .a (a0b2), .b (a1b1), .c (a2b0), .sum (sx1    ), .carry (cx2) );
Half_Adder hx2 ( .a (a1b2), .b (a2b1),            .sum (sx2    ), .carry (cx3) );

Brent_Kung_Adder_8Bit bkax1 (
    	.A          ({a2b2,sx2,sx1}),
    	.B          ({cx3,cx2,cx1}),
    	.Cin        (1'b0),
    	.Sum        (Sout[4:2]),
    	.Cout       (Sout[5])
);

endmodule

