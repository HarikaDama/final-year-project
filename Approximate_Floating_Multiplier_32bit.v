
`timescale 1 ns / 1 ps

module Approximate_Floating_Multiplier_32bit (
	input              clk1,
	input              clk2,
	input              clk3,
	input              reset,
	input       [31:0] A,
	input       [31:0] B,
	input       [1:0]  Mode,
	output wire [31:0] App_FP,
	output wire        clk_out
);

wire        clk_outx;
wire        select_1;
wire        select_2;
wire        select_3;
wire  [2:0] SEL;
wire        Areg_sign;
wire  [7:0] Areg_exponent;
wire  [6:0] Areg_mantissa;
wire  [5:0] mAh;
wire        Breg_sign;
wire  [7:0] Breg_exponent;
wire  [6:0] Breg_mantissa;
wire  [5:0] mBh;
wire        sign_bit;
wire  [8:0] E_sum;
wire  [8:0] EA_EB;
wire  [6:0] Manti_C;
wire  [7:0] Exponent_out;
wire  [7:0] Mantissa_out;
wire  [7:0] M_sum;
wire  [7:0] MC_sum;
wire  [2:0] Mode_ctl;

assign clk_out = clk_outx;
assign SEL     = {select_3,select_2,select_1};

Frequency_Precision_Controller fpcx1 (
	.clk1              (clk1),
	.clk2              (clk2),
	.clk3              (clk3),
	.reset             (reset),
	.Mode              (Mode),
	.clk_out           (clk_outx),
	.select_1          (select_1),
	.select_2          (select_2),
	.select_3          (select_3)
);

Mode_Register Modex1 (
	.clk               (clk_outx),
	.reset             (reset),
	.SEL               ({select_3,select_2,select_1}),
	.Mode_ctl          (Mode_ctl)
);

Input_Register Input_inst (
	.clk               (clk_outx),
	.reset             (reset),
	.input_a           (A),
	.input_b           (B),
	.Areg_sign         (Areg_sign),
	.Areg_exponent     (Areg_exponent),
	.Areg_mantissa     (Areg_mantissa),
	.mAh               (mAh),
	.Breg_sign         (Breg_sign),
	.Breg_exponent     (Breg_exponent),
	.Breg_mantissa     (Breg_mantissa),
        .mBh               (mBh)
);

Error_Correction_Module ECMx1 (
	.mA                (mAh),
	.mB                (mBh),
	.SEL               (Mode_ctl),
	.Manti_C           (Manti_C)
);

assign sign_bit = Areg_sign ^ Breg_sign;

Brent_Kung_Adder_8Bit bkax1 (
	.A             (Areg_exponent),    
	.B             (Breg_exponent),     
    	.Cin           (1'b1),   
    	.Sum           (EA_EB[7:0]),  
    	.Cout          (EA_EB[8])
);

assign Exponent_out = EA_EB[7:0] - 8'd127; //  Bias Removal 

Brent_Kung_Adder_8Bit bkax2 (
	.A             ({1'b0,Areg_mantissa}),    
	.B             ({1'b0,Breg_mantissa}),     
    	.Cin           (1'b0),   
    	.Sum           (M_sum),  
    	.Cout          ( )
);

Brent_Kung_Adder_8Bit bkax3 (
	.A             (M_sum),    
	.B             ({1'b0,Manti_C}),     
    	.Cin           (1'b0),   
    	.Sum           (MC_sum),  
    	.Cout          ( )
);

assign Mantissa_out = (EA_EB[8] == 1'b0)? M_sum : MC_sum; // Mantissa processing

Exception_Processing expx1 (
	.sign_bit               (sign_bit),
	.Exponent_out           (Exponent_out),
	.Mantissa_out           (Mantissa_out),
	.App_FP                 (App_FP)
);

endmodule

