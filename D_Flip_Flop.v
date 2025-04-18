
`timescale 1 ns / 1 ps

module D_Flip_Flop (
	input           clk,
	input           reset,
	input           din,
	output reg      q,
	output reg      qb
);


always @ (posedge clk or negedge reset)
begin
	if (reset == 1'b0) begin
		q    <= 1'b0;
		qb   <= 1'b1;
	end
	else begin
		q    <= din;
		qb   <= ~din;
	end
end

endmodule
