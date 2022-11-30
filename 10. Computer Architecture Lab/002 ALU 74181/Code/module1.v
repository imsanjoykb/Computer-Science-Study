`timescale 1ns / 1ps
module module1(
    input [3:0] A,
    input [3:0] B,
    input [3:0] S,
    output [3:0] gb,
    output [3:0] bnot
    );


wire [3:0]  ABS, ASBnot;
	//E is ~G
	//bnot = ~B
  not not1(bnot[0], B[0]);
  not not2(bnot[1], B[1]);
  not not3(bnot[2], B[2]);
  not not4(bnot[3], B[3]);

	//ABS=A & B & S[3]
  and andabs1(ABS[0], A[0], B[0], S[3]);
  and andabs2(ABS[1], A[1], B[1], S[3]);
  and andabs3(ABS[2], A[2], B[2], S[3]);
  and andabs4(ABS[3], A[3], B[3], S[3]);

	// ASBnot = A & ~B & S[2]
  and andasbnot1(ASBnot[0], A[0], bnot[0], S[2]);
  and andasbnot2(ASBnot[1], A[1], bnot[1], S[2]);
  and andasbnot3(ASBnot[2], A[2], bnot[2], S[2]);
  and andasbnot4(ASBnot[3], A[3], bnot[3], S[2]);

	// E = ~(ABS|ASBnot)
  nor norgb1(gb[0], ABS[0], ASBnot[0]);
  nor norgb2(gb[1], ABS[1], ASBnot[1]);
  nor norgb3(gb[2], ABS[2], ASBnot[2]);
  nor norgb4(gb[3], ABS[3], ASBnot[3]);

endmodule
