`timescale 1ns / 1ps

module pipeB #(parameter WIDTH = 20) (
	input clk,
	input flush,
	input [WIDTH - 1:0] inputs,
	output reg [WIDTH - 1:0] outputs
   );
	
	always @(posedge clk)
	begin 
		if(flush) outputs <= (1 << (WIDTH));
		else outputs <= inputs;
	end
	
endmodule
