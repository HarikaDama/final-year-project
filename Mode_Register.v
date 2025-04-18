
`timescale 1 ns / 1 ps

module Mode_Register (
	input            clk,
	input            reset,
	input      [2:0] SEL,
	output reg [2:0] Mode_ctl
);

always @ (posedge clk or negedge reset)
begin
	if (reset == 1'b0) begin
		Mode_ctl <= 'b0;
	end
	else begin
		Mode_ctl <= SEL;
	end
end

endmodule

