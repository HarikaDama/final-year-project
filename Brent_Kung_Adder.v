
`timescale 1 ns / 1 ps

module Brent_Kung_Adder_3Bit (
	input wire  [2:0]  A,
	input wire  [2:0]  B,
	input              Cin,
	output wire [2:0]  Sum,
	output wire        Cout
);

wire [2:0] gka;
wire [2:0] pka;
wire [1:0] o_gk1;
wire       o_pk1;
wire       o_gk4;
wire [2:0] gx;

wire [2:0] p;
wire [2:0] g;

assign p           = A ^ B;
assign g           = A & B;

assign gka[0]      = Cin;
assign gka[2:1]    = g[1:0];
assign pka         = p[1:0];

grey  gc_0  (                   .i_gj (gka[0 ]),  .i_pk (p[0 ]    ), .i_gk (g[0 ]    ), .o_g (o_gk1[0]));
black bc_0  ( .i_pj (pka[1 ]),  .i_gj (gka[2 ]),  .i_pk (p[2 ]    ), .i_gk (g[2 ]    ), .o_g (o_gk1[1]), .o_p (o_pk1) );

grey  gc_1  (                   .i_gj (o_gk1[0]), .i_pk (o_pk1    ), .i_gk (o_gk1[1 ]), .o_g (o_gk2));

grey  gc_2  (                   .i_gj (o_gk1[0]), .i_pk (p[1 ]    ), .i_gk (g[1 ]    ), .o_g (o_gk4));

assign gx[2 ] = o_gk2;
assign gx[1 ] = o_gk4;
assign gx[0 ] = o_gk1[0];

Sum_Logic_3bit SLG (
	.cin              (Cin),
	.gx               (gx),
	.px               (p),
	.sum_output       (Sum),
	.cout             (Cout)
);

endmodule


`timescale 1 ns / 1 ps

module Brent_Kung_Adder_12Bit (
    	input  [11:0] A,     
    	input  [11:0] B,     
    	input         Cin,   
    	output [11:0] Sum,  
    	output        Cout  
);

wire [3:0] carry;

Brent_Kung_Adder_3Bit BKA_0 (
    	.A           (A[2:0]),   
    	.B           (B[2:0]),   
    	.Cin         (Cin), 
    	.Sum         (Sum[2:0]), 
    	.Cout        (carry[0])
);

Brent_Kung_Adder_3Bit BKA_1 (
    	.A           (A[5:3]),   
    	.B           (B[5:3]),   
    	.Cin         (carry[0]), 
    	.Sum         (Sum[5:3]), 
    	.Cout        (carry[1])
);

Brent_Kung_Adder_3Bit BKA_2 (
    	.A           (A[8:6]),   
    	.B           (B[8:6]),   
    	.Cin         (carry[1]), 
    	.Sum         (Sum[8:6]), 
    	.Cout        (carry[2])
);

Brent_Kung_Adder_3Bit BKA_3 (
    	.A           (A[11:9]),   
    	.B           (B[11:9]),   
    	.Cin         (carry[2]), 
    	.Sum         (Sum[11:9]), 
    	.Cout        (Cout)
);

endmodule



`timescale 1 ns / 1 ps

module Brent_Kung_Adder_8Bit (
    	input  [7:0] A,     
    	input  [7:0] B,     
    	input        Cin,   
    	output [7:0] Sum,  
    	output       Cout  
);

wire [1:0] carry;
wire [8:0] Sumx;

assign Sum = Sumx[7:0];

Brent_Kung_Adder_3Bit BKA_0 (
    	.A           (A[2:0]),   
    	.B           (B[2:0]),   
    	.Cin         (Cin), 
    	.Sum         (Sumx[2:0]), 
    	.Cout        (carry[0])
);

Brent_Kung_Adder_3Bit BKA_1 (
    	.A           (A[5:3]),   
    	.B           (B[5:3]),   
    	.Cin         (carry[0]), 
    	.Sum         (Sumx[5:3]), 
    	.Cout        (carry[1])
);

Brent_Kung_Adder_3Bit BKA_2 (
    	.A           ({1'b0,A[7:6]}),   
    	.B           ({1'b0,B[7:6]}),   
    	.Cin         (carry[1]), 
    	.Sum         (Sumx[8:6]), 
    	.Cout        (Cout)
);

endmodule



