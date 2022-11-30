`timescale 1ns / 1ps

module cpu(
	 input clk, reset,
	 output [7:0] PC,
	 input [15:0] Instr,
	 output [7:0] DataAdr,
	 output [7:0] ALUResult, WriteData,
	 input [7:0] ReadData,
	 output [3:0] FLAGS,
	 output [7:0]  SrcA, SrcB,
	 output PCSrc
	 );
	wire [7:0] ALUResult2;
	wire RegWrite, RegWrite2;
	wire [4:0] ALUControl; 
	wire ALUSrc; 
	wire LM, LI; 
	wire ImmSrc; 
	wire [3:0] ALUFlags;

	controller c(clk, reset, Instr, ALUFlags, RegWrite, RegWrite2, ALUSrc, ALUControl, PCSrc, LM,ImmSrc, LI); 

	datapath dp(clk, reset, RegWrite, RegWrite2, ALUSrc, ALUControl,
				 PCSrc, ALUFlags, PC, Instr, ALUResult, ALUResult2, WriteData,
				 LM, DataAdr, ReadData, ImmSrc, SrcA , SrcB, LI);
	
	assign FLAGS = ALUFlags;

endmodule

