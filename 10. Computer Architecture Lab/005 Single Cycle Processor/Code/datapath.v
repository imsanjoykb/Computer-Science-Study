`timescale 1ns / 1ps

module datapath(
	 input clk, reset,
	 input RegWrite, RegWrite2,
	 input ALUSrc,
	 input [4:0] ALUControl,
	 input PCSrc,
	 output [3:0] ALUFlags,
	 output [7:0] PC,
	 input [15:0] Instr,
	 output [7:0] ALUResult, ALUResult2, WriteData,
	 input LM,
	 output [7:0] DataAdr,
	 input [7:0] ReadData,
	 input ImmSrc,
	 output [7:0]  SrcA, SrcB,
	 input LI
	 );

	wire [7:0] PCNext, PCPlus4;
	wire [7:0] Result;
	wire [7:0] ExtImm;
	wire [2:0] destinationReg;

	// next PC logic
	mux2 #(8) pcmux(PCPlus4, Instr[7:0], PCSrc, PCNext);
	flopr #(8) pcreg(clk, reset, PCNext, PC);
	adder #(8) pcadd1(PC, 8'b100, PCPlus4);

	// register file logic
	mux2 #(3) destinationMux(Instr[5:3], Instr[10:8], LI, destinationReg);
	regfile rf(clk, RegWrite, RegWrite2, destinationReg, Instr[2:0], Result, ALUResult2, SrcA, WriteData);
	extend ext(Instr[2:0], Instr[7:0], ImmSrc, ExtImm);
	mux2 #(8) resmux(ALUResult, ReadData, LM, Result);

	// ALU logic
	mux2 #(8) srcbmux(WriteData, ExtImm, ALUSrc, SrcB);
	alu alu(ALUControl, SrcA, SrcB, ALUResult, ALUResult2, ALUFlags);

	//For LM instruction
	mux2 #(8) DataAdrMux(8'b00000000 , Instr[7:0], LM , DataAdr);
	 
endmodule

