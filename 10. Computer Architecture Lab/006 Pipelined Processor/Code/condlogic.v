`timescale 1ns / 1ps

module condlogic(
	 input clk, reset,
	 input [3:0] AluFlags,
	 input [1:0] FlagW,
	 input pcS,
	 input [2:0] branchType,
	 output pcSrc
	 );

    wire [3:0] Flags;
    wire CondEx;

    flopenr #(2) flagreg1(clk, reset, FlagW[1],
                          AluFlags[3:2], Flags[3:2]);
    flopenr #(2) flagreg0(clk, reset, FlagW[0],
                          AluFlags[1:0], Flags[1:0]);

    condcheck cc(branchType , Flags , CondEx);

    assign pcSrc = pcS & CondEx ; 

endmodule


module condcheck(
	 input [2:0] branchType,
	 input [3:0] AluFlags,
	 output reg CondEx
	 );

	always @(*)
	case(branchType)
		 // JE 
		 3'b001: CondEx = AluFlags[2];
		 
		 // JB
		 3'b010: CondEx = AluFlags[1];
		 
		 // JA
		 3'b011: CondEx= ( (~AluFlags[1]) & (~AluFlags[2]) );
		 
		 //JL
		 3'b100: CondEx = (AluFlags[1] == ~AluFlags[2]) ? 1'b1 : 1'b0 ;
		 
		 //JG
		 3'b101: CondEx =( (AluFlags[3] == AluFlags[0]) &  (~AluFlags[2]) );
		 
		 //JMP
		 3'b110: CondEx = 1'b1 ; 
					
		 default: CondEx = 1'b0 ; 
	endcase
endmodule
