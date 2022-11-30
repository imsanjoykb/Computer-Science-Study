`timescale 1ns / 1ps

module regfile(
	 input clk,
	 input we3,
	 input [2:0] ra1, ra2,
	 input [7:0] wd3, wd4,
	 output [7:0] rd1 , rd2
	 );

	reg [7:0] rf[7:0];

	always @(posedge clk)
	begin
		if (we3) rf[ra1] <= wd3;
		if (we4)	rf[ra2] <= wd4;
	end

	assign rd1 =  rf[ra1] ; 
	assign rd2 =  rf[ra2] ; 


endmodule
