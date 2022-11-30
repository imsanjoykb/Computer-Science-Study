module ALU(input[3:0] A,B,S,
		input M,Cn_,
		output[3:0] F,
		output Eq,G,P,Cnplus);

	wire[3:0] Pnot, Gnot;
	wire[3:0] Bnot;
	wire[4:0] temp_0;
	wire[4:0] temp_1;
	wire[4:0] temp_2;
	wire[4:0] temp_3;
	wire Mnot;

	myinv not_M(M, Mnot);

	myinv inv_00(B[0], Bnot[0]);
	myand1 and_00(A[0], temp_0[0]);
	myand2 and_01(B[0], S[0], temp_0[1]);
	myand2 and_02(S[1], Bnot[0], temp_0[2]);
	myand3 and_03(Bnot[0], S[2], A[0], temp_0[3]);
	myand3 and_04(A[0], B[0], S[3], temp_0[4]);
	mynor3 nor_00(temp_0[0], temp_0[1], temp_0[2], Pnot[0]);
	mynor2 nor_01(temp_0[3], temp_0[4], Gnot[0]);

	myinv inv_10(B[1], Bnot[1]);
	myand1 and_10(A[1], temp_1[0]);
	myand2 and_11(B[1], S[0], temp_1[1]);
	myand2 and_12(S[1], Bnot[1], temp_1[2]);
	myand3 and_13(Bnot[1], S[2], A[1], temp_1[3]);
	myand3 and_14(A[0], B[0], S[3], temp_1[4]);
	mynor3 nor_10(temp_1[0], temp_1[1], temp_1[2], Pnot[1]);
	mynor2 nor_11(temp_1[3], temp_1[4], Gnot[1]);

	myinv inv_20(B[2], Bnot[2]);
	myand1 and_20(A[2], temp_2[0]);
	myand2 and_21(B[2], S[0], temp_2[1]);
	myand2 and_22(S[1], Bnot[2], temp_2[2]);
	myand3 and_23(Bnot[2], S[2], A[2], temp_2[3]);
	myand3 and_24(A[2], B[2], S[3], temp_2[4]);
	mynor3 nor_20(temp_2[0], temp_2[1], temp_2[2], Pnot[2]);
	mynor2 nor_21(temp_2[3], temp_2[4], Gnot[2]);

	myinv inv_30(B[3], Bnot[3]);
	myand1 and_30(A[3], temp_3[0]);
	myand2 and_31(B[3], S[0], temp_3[1]);
	myand2 and_32(S[1], Bnot[3], temp_3[2]);
	myand3 and_33(Bnot[3], S[2], A[3], temp_3[3]);
	myand3 and_34(A[3], B[3], S[3], temp_3[4]);
	mynor3 nor_30(temp_3[0], temp_3[1], temp_3[2], Pnot[3]);
	mynor2 nor_31(temp_3[3], temp_3[4], Gnot[3]);


	wire[15:0] temp_lvl3;

	mynand2 nand_lvl3_0(Cn_, Mnot, temp_lvl3[0]);
	myand2 and_lvl3_0(Mnot, Pnot[0], temp_lvl3[1]);
	myand3 and_lvl3_1(Mnot, Gnot[0], Cn_, temp_lvl3[2]);
	myand2 and_lvl3_2(Mnot, Pnot[1], temp_lvl3[3]);
	myand3 and_lvl3_3(Mnot, Pnot[0], Gnot[1], temp_lvl3[4]);
	myand4 and_lvl3_4(Mnot, Cn_, Gnot[0], Gnot[1], temp_lvl3[5]);
	myand2 and_lvl3_5(Mnot, Pnot[2], temp_lvl3[6]);
	myand3 and_lvl3_6(Mnot, Pnot[1], Gnot[2], temp_lvl3[7]);
	myand4 and_lvl3_7(Mnot, Pnot[0], Gnot[1], Gnot[2], temp_lvl3[8]);
	myand5 and_lvl3_8(Mnot, Cn_, Gnot[0], Gnot[1], Gnot[2], temp_lvl3[9]);
	mynand4 nand_lvl3_1(Gnot[0], Gnot[1], Gnot[2], Gnot[3], temp_lvl3[10]);
	mynand5 nand_lvl3_2(Cn_, Gnot[0], Gnot[1], Gnot[2], Gnot[3], temp_lvl3[11]);
	myand4 and_lvl3_9(Pnot[0], Gnot[0], Gnot[2], Gnot[3], temp_lvl3[12]);
	myand3 and_lvl3_10(Pnot[1], Gnot[2], Gnot[3], temp_lvl3[13]);
	myand2 and_lvl3_11(Pnot[2], Gnot[3], temp_lvl3[14]);
	myand1 and_lvl3_12(Pnot[3], temp_lvl3[15]);


	wire[7:0] temp_lvl4;

	myxor2 xor_lvl4_0(Pnot[0], Gnot[0], temp_lvl4[0]);						//sigma0
	mynor2 nor_lvl4_0(temp_lvl3[1], temp_lvl3[2], temp_lvl4[1]);					//C1
	myxor2 xor_lvl4_1(Pnot[1], Gnot[0], temp_lvl4[2]);						//sigma1
	mynor3 nor_lvl4_1(temp_lvl3[3], temp_lvl3[4], temp_lvl3[5], temp_lvl4[3]);			//c2
	myxor2 xor_lvl4_2(Pnot[2], Gnot[1], temp_lvl4[4]);						//sigma2
	mynor4 nor_lvl4_2(temp_lvl3[6], temp_lvl3[7], temp_lvl3[8], temp_lvl3[9], temp_lvl4[5]);	//c3
	myxor2 xor_lvl4_3(Pnot[3], Gnot[3], temp_lvl4[6]);						//sigma3
	mynor4 nor_lvl4_3(temp_lvl3[12], temp_lvl3[13], temp_lvl3[14], temp_lvl3[15], temp_lvl4[7]);	//c4


	wire[4:0] temp_lvl5;

	myxor2 xor_lvl5_0(temp_lvl3[0], temp_lvl4[0], temp_lvl5[0]);
	myxor2 xor_lvl5_1(temp_lvl4[1], temp_lvl4[2], temp_lvl5[1]);
	myxor2 xor_lvl5_2(temp_lvl4[3], temp_lvl4[4], temp_lvl5[2]);
	myxor2 xor_lvl5_3(temp_lvl4[5], temp_lvl4[6], temp_lvl5[3]);
	mymor2 mor_lvl5_4(temp_lvl3[11], temp_lvl4[7], temp_lvl5[4]);


	myand4 and_lvl6_0(temp_lvl5[0], temp_lvl5[1], temp_lvl5[2], temp_lvl5[3], Eq);

	assign F[0] = temp_lvl5[0];
	assign F[1] = temp_lvl5[1];
	assign F[2] = temp_lvl5[2];
	assign F[3] = temp_lvl5[3];
	assign G = temp_lvl3[10];
	assign Cnplus = temp_lvl5[4];
	assign P = temp_lvl4[7];
endmodule
