
`timescale 1 ns / 1 ps

module Input_Register (
	input             clk,
	input             reset,
	input      [31:0] input_a,
	input      [31:0] input_b,
	output reg        Areg_sign,
	output reg  [7:0] Areg_exponent,
	output reg  [6:0] Areg_mantissa,
	output reg  [5:0] mAh,
	output reg        Breg_sign,
	output reg  [7:0] Breg_exponent,
	output reg  [6:0] Breg_mantissa,
        output reg  [5:0] mBh
);	

always @ (posedge clk or negedge reset)
begin
	if (reset == 1'b0) begin
		Areg_sign       <= 'b0;
		Areg_exponent   <= 'b0;
		Areg_mantissa   <= 'b0;
		mAh             <= 'b0;
		Breg_sign       <= 'b0; 
		Breg_exponent   <= 'b0;
		Breg_mantissa   <= 'b0;
		mBh             <= 'b0;
	end
	else begin

		Areg_sign       <= input_a[31];
		Areg_exponent   <= input_a[30:23];
		Areg_mantissa   <= input_a[22:16];
		mAh             <= input_a[15:10];   

		Breg_sign       <= input_b[31]; 
		Breg_exponent   <= input_b[30:23];
		Breg_mantissa   <= input_b[22:16];
		mBh             <= input_b[15:10];

	end
end

endmodule
