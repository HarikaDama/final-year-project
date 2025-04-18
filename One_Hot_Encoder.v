
`timescale 1 ns / 1 ps

module One_Hot_Encoder (
	input       [1:0] Mode_input,
	output reg        select_1,
	output reg        select_2,
	output reg        select_3
);

always @(*)
begin
	case (Mode_input)
		2'b00 : begin
			select_1  = 1'b1;
			select_2  = 1'b0;
			select_3  = 1'b0;
		end
		2'b01 : begin
			select_1  = 1'b1;
			select_2  = 1'b0;
			select_3  = 1'b0;
		end
		2'b10 : begin
			select_1  = 1'b0;
			select_2  = 1'b1;
			select_3  = 1'b0;
		end
		3'b11 : begin
			select_1  = 1'b0;
			select_2  = 1'b0;
			select_3  = 1'b1;
		end
		default: begin
		end
	endcase
end

endmodule
