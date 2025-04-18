
`timescale 1 ns / 1 ps

module Error_Correction_Module (
	input       [5:0] mA,
	input       [5:0] mB,
	input       [2:0] SEL,
	output wire [6:0] Manti_C
);

wire [5:0]  result1;
wire [5:0]  result2;
wire [5:0]  result3;
wire [5:0]  result4;
wire [11:0] CLA_result;
wire [11:0] truncated_result;
wire [11:0] result_x;
wire [11:0] result_y;

FECE fecex1 ( .x (mA[5:3]), .y (mB[5:3]), .Sout (result1) );
FECE fecex2 ( .x (mA[5:3]), .y (mB[2:0]), .Sout (result2) );
FECE fecex3 ( .x (mA[2:0]), .y (mB[5:3]), .Sout (result3) );
FECE fecex4 ( .x (mA[2:0]), .y (mB[2:0]), .Sout (result4) );

assign result_x = {result1,result2};
assign result_y = {result3,result4};

Brent_Kung_Adder_12Bit BKAx1 (
	.A                  (result_x),     
    	.B                  (result_y),     
    	.Cin                (1'b0),   
    	.Sum                (CLA_result),  
    	.Cout               ( )  
);

Truncation_Precison_Selection Tpsx1 (
       .CLA_result          (CLA_result),
       .SEL                 (SEL),
       .Truncated_result    (Manti_C)
);

endmodule
