`timescale 1ns / 1ps
module module2(
    input [3:0] A,
    input [3:0] B,
    input [3:0] bnot,
    input [3:0] S,
    output [3:0] pb
    );
	 wire [3:0]  Sbnot, BS;
	//  ~B & S[1]
  and andsbnot1(Sbnot[0], bnot[0], S[1]);
  and andsbnot2(Sbnot[1], bnot[1], S[1]);
  and andsbnot3(Sbnot[2], bnot[2], S[1]);
  and andsbnot4(Sbnot[3], bnot[3], S[1]);
	// B & S[0]
  and andBS1(BS[0], B[0], S[0]);
  and andBS2(BS[1], B[1], S[0]);
  and andBS3(BS[2], B[2], S[0]);
  and andBS4(BS[3], B[3], S[0]);
	// ~(BbS1 | BS0 | A)
  nor norfinal1(pb[0], Sbnot[0], BS[0], A[0]);
  nor norfinal2(pb[1], Sbnot[1], BS[1], A[1]);
  nor norfinal3(pb[2], Sbnot[2], BS[2], A[2]);
  nor norfinal4(pb[3], Sbnot[3], BS[3], A[3]);
endmodule
