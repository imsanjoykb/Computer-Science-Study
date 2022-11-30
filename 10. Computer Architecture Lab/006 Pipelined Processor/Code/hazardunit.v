`timescale 1ns / 1ps

module hazardunit(
	 input clk, reset,
	 input LME, JumpTaken,
	 input RegWrite1W, RegWrite1M, RegWrite2W, RegWrite2M,
	 input [7:0] Match,
	 output reg [2:0] ForwardAE, 
	 output reg [2:0] ForwardBE,
	 output FlushE, FlushD, StallD, StallF
	 );
	 
	wire LDRstall;
	assign LDRstall = (|Match) & LME;
	assign StallF = (LDRstall === 1) ? 1 : 0;
	assign StallD = (LDRstall === 1) ? 1 : 0;
	assign FlushE = ((LDRstall | JumpTaken) === 1 ? 1 : 0);
	assign FlushD = (JumpTaken === 1) ? 1 : 0;
	
	wire Match_1E_M_1, Match_2E_M_1, Match_2E_W_1, Match_1E_W_1,
		  Match_1E_M_2, Match_2E_M_2, Match_2E_W_2, Match_1E_W_2;
	assign {Match_1E_M_1, Match_2E_M_1, Match_1E_W_1, Match_2E_W_1,
			  Match_1E_M_2, Match_2E_M_2, Match_2E_W_2, Match_1E_W_2} = Match;
	
	always @(*)
	begin
		if(Match_1E_M_1 & RegWrite1M) begin
			ForwardAE = 3'b001;	
		end else if(Match_1E_W_1 & RegWrite1W) begin
			ForwardAE = 3'b010;
		end else if(Match_1E_M_2 & RegWrite2M) begin
			ForwardAE = 3'b011;	
		end else if(Match_1E_W_2 & RegWrite2W) begin
			ForwardAE = 3'b100;			
		end else begin
			ForwardAE =	3'b000;
		end

		if(Match_2E_M_1 & RegWrite1M) begin
			ForwardBE = 3'b001;	
		end else if(Match_2E_W_1 & RegWrite1W) begin
			ForwardBE = 3'b010;	
		end else if(Match_2E_M_2 & RegWrite2M) begin
			ForwardBE = 3'b011;	
		end else if(Match_2E_W_2 & RegWrite2W) begin
			ForwardBE = 3'b100;				
		end else begin
			ForwardBE = 3'b000;	
		end
	end
endmodule 