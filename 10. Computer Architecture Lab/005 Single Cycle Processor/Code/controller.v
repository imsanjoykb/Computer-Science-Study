`timescale 1ns / 1ps

module controller(
	 input clk, reset,
	 input [15:0] Instr,
	 input [3:0] ALUFlags,
	 output RegWrite, RegWrite2,
	 output ALUSrc,
	 output [4:0] ALUControl,
	 output PCSrc,
	 output LM,
	 output ImmSrc,
	 output LI); 
 
	wire pcS;
	wire [1:0] FlagW;
	wire [2:0] branchType;

	decoder dec(Instr[15], Instr[14:6], FlagW, pcS, RegWrite, RegWrite2, ALUSrc,  ALUControl, branchType, LM, ImmSrc, LI);

	condlogic cl(clk, reset, ALUFlags, FlagW, pcS, branchType, PCSrc);

endmodule
