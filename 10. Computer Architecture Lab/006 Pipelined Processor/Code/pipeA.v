`timescale 1ns / 1ps

module pipeA(
	 input clk, StallD, FlushD,
	 input [15:0] InstrF,
	 output reg [15:0] InstrD
	 );
	 
	always @(posedge clk)
		if (FlushD) InstrD <= 16'b0;	
		else if (~StallD)	InstrD <= InstrF;
endmodule 
