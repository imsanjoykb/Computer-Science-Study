`timescale 1ns / 1ps

module datapath(
	 input clk, reset,
	 input RegWrite1W, RegWrite2W,
	 input ALUSrcE,
	 input [4:0] ALUControlE,
	 input PCSrcE,
	 output [3:0] ALUFlags,
	 output [7:0] PC,
	 input [15:0] InstrF,
	 output [15:0] InstrD,
	 output [7:0] ALUResultE,
	 output [7:0] ALUResult2E,
	 input LMD,
	 output [7:0] DataAdrM,
	 input [7:0] ReadDataM,
	 input ImmSrcD,
	 output [7:0] SrcA,
	 output [7:0] SrcB,
	 input LID,
	 output [7:0] Match,
	 input [2:0] ForwardAE, 
	 input [2:0] ForwardBE,
	 input FlushE, FlushD, StallD, StallF
	 );

	wire [7:0] PCNext;
	wire [7:0] PCPlus4;
	wire [7:0] ALUResultM;
	wire [7:0] ALUResultW;
	wire [7:0] ALUResult2M;
	wire [7:0] ALUResult2W;
	wire [7:0] ResultW;
	wire [7:0] ExtImmD;
	wire [7:0] ExtImmE;
	
	wire [7:0] RD1D;
	wire [7:0] RD2D;
	wire [7:0] RD1E;
	wire [7:0] RD2E;
	
	wire [2:0] RA1D;
	wire [2:0] RA2D;
	wire [2:0] RA1E;
	wire [2:0] RA2E;
	wire [2:0] RA1M;
	wire [2:0] RA2M;
	wire [2:0] RA2W;
	wire [2:0] RA1W;
	
	wire [7:0] ReadDataW;
	wire [7:0] midSrcB;
	wire [7:0] InstrE;
	wire [7:0] InstrM;
	wire LME, LMM, LMW;

	// next PC logic
	mux2 #(8) pcmux(PCPlus4, InstrE[7:0], PCSrcE, PCNext);
	flopenr #(8) pcreg(clk, reset, ~StallF, PCNext, PC);
	adder #(8) pcadd1(PC, 8'b100, PCPlus4);
	
	////*******//////
	pipeA pipe1(clk, StallD, FlushD, InstrF, InstrD);

	// register file logic
	mux2 #(3) destinationMux(InstrD[5:3], InstrD[10:8], LID, RA1D);
	assign RA2D = InstrD[2:0];
	regfile rf(clk, RegWrite1W, RegWrite2W, RA1D, RA2D, RA1W, RA2W, ResultW, ALUResult2W, RD1D, RD2D);
	extend ext(InstrD[2:0], InstrD[7:0], ImmSrcD, ExtImmD);
	mux2 #(8) resmux(ALUResultW, ReadDataW, LMW, ResultW);
	
	////*******/////
	pipeB #(39) pipe2(clk, FlushE, {RA1D, RA2D, RD1D, RD2D, ExtImmD, LMD, InstrD[7:0]},
											 {RA1E, RA2E, RD1E, RD2E, ExtImmE, LME, InstrE[7:0]});

	// ALU logic
	mux5 #(8) srcamux (RD1E, ALUResultM, ResultW, ALUResult2M, ALUResult2W, ForwardAE, SrcA);
	mux5 #(8) srcbmux1(RD2E, ALUResultM, ResultW, ALUResult2M, ALUResult2W, ForwardBE, midSrcB);
	mux2 #(8) srcbmux2(midSrcB, ExtImmE, ALUSrcE, SrcB);
	alu alu(ALUControlE, SrcA, SrcB, ALUResultE, ALUResult2E, ALUFlags);
	
	/////******//////
	flopr #(31) pipe3(clk, 1'b0, {ALUResultE, ALUResult2E, RA1E, RA2E, LME, InstrE[7:0]},
										  {ALUResultM, ALUResult2M, RA1M, RA2M, LMM, InstrM[7:0]});
	
	//For LM instruction
	mux2 #(8) DataAdrMux(8'b00000000, InstrM[7:0], LMM, DataAdrM);
	
	/////*******//////
	flopr #(31) pipe4(clk, 1'b0, {ALUResultM, ALUResult2M, RA1M, RA2M, LMM, ReadDataM},
										  {ALUResultW, ALUResult2W, RA1W, RA2W, LMW, ReadDataW});
	
	
	// Match Logic
	wire Match_1E_M_1, Match_2E_M_1, Match_2E_W_1, Match_1E_W_1,
		  Match_1E_M_2, Match_2E_M_2, Match_2E_W_2, Match_1E_W_2;

	assign Match_1E_M_1 = (RA1E == RA1M);
	assign Match_2E_M_1 = (RA2E == RA1M);
	assign Match_1E_W_1 = (RA1E == RA1W);
	assign Match_2E_W_1 = (RA2E == RA1W);
	assign Match_1E_M_2 = (RA1E == RA2M);
	assign Match_2E_M_2 = (RA2E == RA2M);
	assign Match_1E_W_2 = (RA1E == RA2W);
	assign Match_2E_W_2 = (RA2E == RA2W);
	
	assign Match = {Match_1E_M_1, Match_2E_M_1, Match_1E_W_1, Match_2E_W_1,
						 Match_1E_M_2, Match_2E_M_2, Match_2E_W_2, Match_1E_W_2};
	 
endmodule 
