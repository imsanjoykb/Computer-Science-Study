`timescale 1ns / 1ps

module decoder(
	 input Op,
	 input [8:0] Funct,
	 output reg [1:0] FlagW,
	 output PCS, 
	 output RegWrite, 
	 output RegWrite2,
	 output ALUSrc,
	 output reg [4:0] ALUControl,
	 output [2:0] branchType,
	 output LM,
	 output ImmSrc,
	 output LI
	 );

	reg [9:0] controls;
	wire ALUOp;

	// Main Decoder
	always @(Op, Funct)
	case(Op)
		1'b0: 
		begin
			// CMP NOP ShowR ShowRSegment
			if(Funct[4:0] == 5'b10100 | Funct[4:0] == 5'b00000 | 
				Funct[4:0] == 5'b10010 | Funct[4:0] == 5'b10011) 
				controls <= 10'b1000000000 ; 

			// Immidiate instructions INC DEC
			else if (Funct[3]) controls <= 10'b1110000000;
			
			//XCHG
			else if(Funct[4:0] == 5'b00111) controls <= 10'b1011000000;
			
			// Register Instructions
			else controls <= 10'b1010000000;
		end
		
		2'b1:
		begin
			if(Funct[8:5] == 4'b0000) controls <= 10'b0000001010; 	  // JE 
			else if(Funct[8:5] == 4'b0001) controls <= 10'b0000010010; // JB 
			else if(Funct[8:5] == 4'b0010) controls <= 10'b0000011010; // JA 
			else if(Funct[8:5] == 4'b0011) controls <= 10'b0000100010; // JL 
			else if(Funct[8:5] == 4'b0100) controls <= 10'b0000101010; // JG 
			else if(Funct[8:5] == 4'b0101) controls <= 10'b0000110010; // JMP 
			else if(Funct[8:5] == 4'b0110) controls <= 10'b1110000011; // LI
			else if(Funct[8:5] == 4'b0111) controls <= 10'b1010000110; // LM
			else controls <= 10'bx;
		end
		// Unimplemented
		default: controls <= 10'bx;
	endcase

	assign {ALUOp, ALUSrc, RegWrite, RegWrite2, branchType, LM, ImmSrc, LI} = controls;

   // ALU Decoder
   always @(*)
		if(ALUOp & Op & Funct[8:5] == 4'b0110) //LI
		begin
			ALUControl = 5'b10101;
			FlagW = 2'b00; 
		end
		else if(ALUOp & Op & Funct[8:5] == 4'b0111) //LM
		begin
			ALUControl = 5'b10110 ;
			FlagW = 2'b00; 
		end
		else if (ALUOp) 
		begin
			case(Funct[4:0])
				5'b00001: ALUControl = 5'b00001;	//ADD
				5'b00010: ALUControl = 5'b00010;	//AND
				5'b00011: ALUControl = 5'b00011;	//SUB
				5'b00100: ALUControl = 5'b00100;	//OR 
				5'b00101: ALUControl = 5'b00101;	//XOR
				5'b00110: ALUControl = 5'b00110;	//MOV
				5'b00111: ALUControl = 5'b00111;	//XCHG
				5'b01000: ALUControl = 5'b01000;	//NOT
				5'b01001: ALUControl = 5'b01001;	//SAR
				5'b01010: ALUControl = 5'b01010;	//SLR
				5'b01011: ALUControl = 5'b01011;	//SAL 
				5'b01100: ALUControl = 5'b01100;	//SLL  
				5'b01101: ALUControl = 5'b01101;	//ROL 
				5'b01110: ALUControl = 5'b01110;	//ROR 
				5'b01111: ALUControl = 5'b01111;	//INC 
				5'b10000: ALUControl = 5'b10000;	//DEC 
				5'b00000: ALUControl = 5'b00000;	//NOP 
				5'b10010: ALUControl = 5'b10010;	//ShowR
				5'b10011: ALUControl = 5'b10011;	//ShowRSeg
				5'b10100: ALUControl = 5'b10100;	//CMP
				default:  ALUControl = 5'b00000;	//unimplemented
			endcase
		 
		 // Flag[1] is SF and ZF
		 // Flag[0] is CF and OF

		 //SF = negative
		 //ZF = zero
		 //CF = carry
		 //OF = overflow
		 FlagW[1]= ALUControl == 5'b00001 |
					  ALUControl == 5'b00011 |
					  ALUControl == 5'b00010 |
					  ALUControl == 5'b00100 |
					  ALUControl == 5'b00101 |
					  ALUControl == 5'b01001 |
					  ALUControl == 5'b01010 |
					  ALUControl == 5'b01011 |
					  ALUControl == 5'b01100 |
					  ALUControl == 5'b01101 |
					  ALUControl == 5'b01110 |
					  ALUControl == 5'b01111 |
					  ALUControl == 5'b10000 |
					  ALUControl == 5'b10100 ;

		 FlagW[0]= ALUControl == 5'b00001 |
					  ALUControl == 5'b00011 |
					  ALUControl == 5'b00010 |
					  ALUControl == 5'b00100 |
					  ALUControl == 5'b00101 |
					  ALUControl == 5'b01001 |
					  ALUControl == 5'b01010 |
					  ALUControl == 5'b01011 |
					  ALUControl == 5'b01100 |
					  ALUControl == 5'b01101 |
					  ALUControl == 5'b01110 |
					  ALUControl == 5'b01111 |
					  ALUControl == 5'b10000 |
					  ALUControl == 5'b10100 ;
		 end 
		 else 
		 begin
			 ALUControl = 5'b0001;// add for non-DP instructions
			 FlagW = 2'b00;// don't update Flags
		 end

    assign PCS = (Op & Funct[8:5] != 4'b0110 & Funct[8:5] != 4'b0111);

endmodule

