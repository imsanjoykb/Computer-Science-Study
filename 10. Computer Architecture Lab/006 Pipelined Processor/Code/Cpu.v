`timescale 1ns / 1ps

module Cpu(
	 input clk, reset,
	 output [7:0] PC,
	 input [15:0] InstrF,
	 output [7:0] DataAdrM,
	 output [7:0] ALUResultE, 
	 output [7:0] ALUResult2E, 
	 output [7:0] WriteData,
	 input [7:0] ReadDataM,
	 output [3:0] Flags,
	 output [7:0] SrcA,
	 output [7:0] SrcB,
	 output PCSrcE
	 ); 

	wire RegWrite1W, RegWrite1M, RegWrite2W, RegWrite2M;
	wire [4:0] ALUControlE; 
	wire ALUSrcE; 
	wire LME, LIE; 
	wire ImmSrcD; 
	wire [3:0] ALUFlags;
	wire [7:0] Match;
	wire [2:0] ForwardAE, ForwardBE;
	wire FlushE, FlushD, StallD, StallF;
	wire [15:0] InstrD;

	controller c(clk, reset, FlushE, InstrD, ALUFlags, RegWrite1W, RegWrite2W, ALUSrcE, ALUControlE, PCSrcE, LMD, ImmSrcD, LID,
					RegWrite1M, RegWrite2M, LME); 

	datapath dp(clk, reset, RegWrite1W, RegWrite2W, ALUSrcE, ALUControlE,
				 PCSrcE, ALUFlags, PC, InstrF, InstrD, ALUResultE, ALUResult2E,
				 LMD, DataAdrM, ReadDataM, ImmSrcD, SrcA , SrcB, LID, 
				 Match, ForwardAE, ForwardBE, FlushE, FlushD, StallD, StallF);
	
	hazardunit hu(clk, reset, LME, PCSrcE, RegWrite1W, RegWrite1M, RegWrite2W, RegWrite2M,
					  Match, ForwardAE, ForwardBE, FlushE, FlushD, StallD, StallF);
	
	assign Flags = ALUFlags;

endmodule

