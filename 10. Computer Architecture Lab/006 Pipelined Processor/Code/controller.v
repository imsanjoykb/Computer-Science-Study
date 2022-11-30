`timescale 1ns / 1ps

module controller(
	 input clk, reset,
	 input FlushE,
	 input [15:0] InstrD,
	 input [3:0] ALUFlags,
	 output RegWrite1W, RegWrite2W,
	 output ALUSrcE,
	 output [4:0] ALUControlE,
	 output PCSrcE,
	 output LMD,
	 output ImmSrcD,
	 output LID,
	 output RegWrite1M, RegWrite2M,
	 output LME
	 );
	
	wire PCSD, PCSE;
	wire [1:0] FlagWD, FlagWE;
	wire [2:0] branchTypeD, branchTypeE;
	wire RegWrite1D, RegWrite2D, RegWrite1E, RegWrite2E;
	wire ALUSrcD;
	wire [4:0] ALUControlD;
	wire LIE;

	decoder dec(InstrD[15], InstrD[14:6], FlagWD, PCSD, RegWrite1D, RegWrite2D, ALUSrcD, ALUControlD, branchTypeD, LMD, ImmSrcD, LID);
	
	pipeE pipe1(clk, FlushE, FlagWD, PCSD, RegWrite1D, RegWrite2D, ALUSrcD,  ALUControlD, branchTypeD, LMD,
									 FlagWE, PCSE, RegWrite1E, RegWrite2E, ALUSrcE,  ALUControlE, branchTypeE, LME);
	
	condlogic cl(clk, reset, ALUFlags, FlagWE, PCSE, branchTypeE, PCSrcE);
	
	flopr #(2) pipe2(clk, 1'b0, {RegWrite1E, RegWrite2E}, {RegWrite1M, RegWrite2M});
	flopr #(2) pipe3(clk, 1'b0, {RegWrite1M, RegWrite2M}, {RegWrite1W, RegWrite2W});
	
endmodule
