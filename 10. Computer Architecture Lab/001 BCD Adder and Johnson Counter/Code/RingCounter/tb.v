`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:43:28 03/02/2021
// Design Name:   RingCounter
// Module Name:   E:/RingCounter/tb.v
// Project Name:  RingCounter
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: RingCounter
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
	wire [7:0] out;

	// Instantiate the Unit Under Test (UUT)
	RingCounter ringcounter (
		.clk(clk), 
		.reset(reset), 
		.out(out)
	);
	always 
	#5 clk=~clk;
	initial begin
		// Initialize Inputs
		clk = 0;
		reset = 0;
		#5 reset=1;
		#100 reset=0;

	end
      
endmodule

