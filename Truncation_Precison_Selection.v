
`timescale 1 ns / 1 ps

module Truncation_Precison_Selection (
	input       [11:0] CLA_result,
	input        [2:0] SEL,
	output reg   [6:0] Truncated_result
);

always @(*) begin
	case (SEL)
		3'b000  : begin Truncated_result = CLA_result[11:5]; end // High Precision
		3'b001  : begin Truncated_result = CLA_result[10:4]; end // Medium Precision
		3'b010  : begin Truncated_result = CLA_result[9:3];  end // Low Precision
		3'b011  : begin Truncated_result = CLA_result[8:2];  end // very low precision
		3'b100  : begin Truncated_result = CLA_result[7:1];  end // Extra low precision
		3'b101  : begin Truncated_result = CLA_result[6:0];  end // Minimal Precision
		default : begin Truncated_result = CLA_result[6:0];  end
	endcase
end

endmodule

