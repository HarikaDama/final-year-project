
`timescale 1 ns / 1 ps

module Exception_Processing (
	input              sign_bit,
	input        [7:0] Exponent_out,
	input        [7:0] Mantissa_out,
	output reg  [31:0] App_FP
);

always @(*)
begin
	if (Exponent_out == 'b0) begin
	       App_FP           = 'b0;
        end
	else if (Exponent_out == 8'b1111_1111) begin
		App_FP          = {sign_bit,31'b111_1111_1111_1111_1111_1111_1111_1111};
	end
	else begin
		App_FP          = {sign_bit,Exponent_out,Mantissa_out,15'b0};
	end
end

endmodule
