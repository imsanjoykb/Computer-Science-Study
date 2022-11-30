`timescale 1ns / 1ps

module flopenr #(parameter WIDTH = 8)(
	 input clk, reset, en,
	 input [WIDTH-1:0] d,
	 output reg [WIDTH-1:0] q
	 );

	always @(posedge clk , posedge reset)
		if(reset) q <= 0;
		else if(en) q <= d;
		else q <= q;

endmodule
