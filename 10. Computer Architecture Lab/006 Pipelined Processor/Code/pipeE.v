`timescale 1ns / 1ps

module pipeE(
	 input clk,
	 input FlushE,
	 input [1:0] FlagWD,
	 input PCSD, 
	 input RegWrite1D, 
	 input RegWrite2D, 
	 input ALUSrcD, 
	 input [4:0] ALUControlD,
	 input [2:0] branchTypeD,
	 input LMD,
	 output [1:0] FlagWE,
	 output PCSE, 
	 output RegWrite1E, 
	 output RegWrite2E, 
	 output ALUSrcE, 
	 output [4:0] ALUControlE,
	 output [2:0] branchTypeE,
	 output LME
    );
	
	reg [13:0] inp, outp;
	
	assign {FlagWE, PCSE, RegWrite1E, RegWrite2E, ALUSrcE,  ALUControlE, branchTypeE, LME} = outp;
	
	always @(posedge clk) 
	begin
		if (FlushE) outp <= 0;
		else outp <= {FlagWD, PCSD, RegWrite1D, RegWrite2D, ALUSrcD,  ALUControlD, branchTypeD, LMD};
	end
	
endmodule
