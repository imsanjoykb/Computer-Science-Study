`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:21:50 03/01/2021
// Design Name:   JohnsonCounter
// Module Name:   C:/Users/Mohammad/Desktop/q2/tb.v
// Project Name:  q2
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: JohnsonCounter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////
module tb;
	// Inputs
	reg clk;
	reg reset;
	// Outputs
  	wire [3:0] out;
  	JohnsonCounter john(clk,reset,out);
  	always #5 clk = ~clk;

    initial
	begin
		clk = 0;
		#5 reset = 1;
		#100 reset = 0;
	end
endmodule