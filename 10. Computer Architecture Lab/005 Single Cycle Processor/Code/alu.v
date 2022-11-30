`timescale 1ns / 1ps

module alu (
	 input [4:0] ALUControl,
	 input [7:0] srcA, srcB,
	 output reg [7:0] ALUResult,
	 output reg [7:0] ALUResult2,
	 output reg [3:0] ALUFlags
	 );
	
	reg xn; 
	
	always @(ALUControl, srcA, srcB)
	case(ALUControl)
		//7-XCHG
		5'b00111: ALUResult2 <= srcA;
		default: ALUResult2 <= 8'b0;
	endcase
	
	always @(*)
	case(ALUControl)
		
		//1-ADD
		5'b00001:
		begin
			{ALUFlags[1], ALUResult} <= srcA + srcB;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
			xn <= ~(1'b0 ^ srcA[7] ^ srcB[7]);
			ALUFlags[0] <= ((ALUResult[7] ^ srcA[7]) & xn);
		end

		5'b00010: //AND
		begin
			ALUResult <= srcA & srcB ;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
			ALUFlags[1] <= 1'b0;
			ALUFlags[0] <= 1'b0;
		end

		5'b00011: //SUB
		begin
			{ALUFlags[1], ALUResult} <= srcA - srcB;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
			xn <= ~(1'b1 ^ srcA[7] ^ srcB[7]);
			ALUFlags[0] <= ((ALUResult[7] ^ srcA[7] ) & xn);
		end

		5'b00100: //OR
		begin
			ALUResult <= srcA | srcB;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
			ALUFlags[1] <= 1'b0;
			ALUFlags[0] <= 1'b0;
		end

		5'b00101: //XOR
		begin
			ALUResult <= srcA ^ srcB;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
			ALUFlags[1] <= 1'b0;
			ALUFlags[0] <= 1'b0;
		end

		5'b00110: ALUResult <= srcB; // MOV
		
		//7-XCHG
		5'b00111:
		begin
			ALUResult <= srcB;
		end

		5'b01000: ALUResult <= ~srcA; // NOT

		5'b01001: //SAR
		begin
			{ALUResult[6:0], ALUFlags[1]} <= srcA >> srcB;
			ALUResult[7] <= srcA[7];
			ALUFlags[0] <= 0;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
		end
		
		//10-SLR
		5'b01010:
		begin
			{ALUResult, ALUFlags[1]} <= srcA >> srcB;
			ALUFlags[0] <= ALUResult[7] != srcA[7];
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
		end
		
		//11-SAL
		5'b01011:
		begin
			{ALUFlags[1], ALUResult} <= srcA << srcB;
			ALUFlags[0] <= ALUResult[7] != srcA[7];
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
		end
		
		//12-SLL
		5'b01100:
		begin
			{ALUFlags[1], ALUResult} <= srcA << srcB;
			ALUFlags[0] <= ALUResult[7] != srcA[7];
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
		end
		
		//13-ROL
		5'b01101:
		begin
			ALUResult <= {srcA, srcA} >> srcB[2:0];
			ALUFlags[0] <= ALUResult[7] != srcA[7];
			ALUFlags[1] <= ALUResult[7];
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
		end
		
		//14-ROR
		5'b01110:
		begin
			ALUResult <= {srcA, srcA} >> 8 - srcB[2:0];
			ALUFlags[0] <= ALUResult[7] != srcA[7];
			ALUFlags[1] <= ALUResult[0];
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
		end
		
		//15-INC
		5'b01111:
		begin
			{ALUFlags[1], ALUResult} <= srcA - 1;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
			xn <= ~(1'b0 ^ srcA[7] ^ srcB[7]);
			ALUFlags[0] <= ((ALUResult[7] ^ srcA[7]) & xn);
		end
	
		//16-DEC
		5'b10000:
		begin
			{ALUFlags[1], ALUResult} <= srcA - 1;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
			xn <= ~(1'b1 ^ srcA[7] ^ srcB[7]);
			ALUFlags[0] <= ((ALUResult[7] ^ srcA[7] ) & xn);
		end
		
		//17_NOP
		5'b00000: 
			begin
				ALUResult <= 8'b0;
				ALUFlags <= 4'b0;
			end
		//18-ShowR
		//5'b10010: Alu_temp = {8'b0 , AluFlags}; // ShowR

		//5'b10011: Alu_temp = {8'b0 , AluFlags}; // ShowRSegment
		
		//20-CMP
		5'b10100:
		begin
			{ALUFlags[1], ALUResult} <= srcA - srcB;
			ALUFlags[3] <= ALUResult[7];
			ALUFlags[2] <= ~(|ALUResult);
			xn <= ~(1'b1 ^ srcA[7] ^ srcB[7]);
			ALUFlags[0] <= ((ALUResult[7] ^ srcA[7] ) & xn);
		end
		
		//27-LI
		5'b10101: 
			begin
				ALUResult <= srcB; 
				ALUFlags <= 4'b0;
			end
		//28-LM
		5'b10110: 
			begin
				ALUResult <= srcB; 
				ALUFlags <= 4'b0;
			end
		5'b11111: // branch
			begin
				ALUResult <= srcB; 
				ALUFlags <= 4'b0;
			end

		default: 
			begin
				ALUResult <= srcB; 
				ALUFlags <= 4'b0;
			end
	endcase
	 
endmodule
