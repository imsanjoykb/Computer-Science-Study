`timescale 1ns / 1ps
module modulefinal2(
    input [3:0] gb,
    input [3:0] pb,
    input [3:0] C,
    input M,
    output [3:0] F,
    output AeqB
    );
	 wire [3:0] gxp, candm;
  xor EXD0gate(gxp[0], gb[0], pb[0]);
  xor EXD1gate(gxp[1], gb[1], pb[1]);
  xor EXD2gate(gxp[2], gb[2], pb[2]);
  xor EXD3gate(gxp[3], gb[3], pb[3]);

  or CM0gate(candm[0], C[0], M);
  or CM1gate(candm[1], C[1], M);
  or CM2gate(candm[2], C[2], M);
  or CM3gate(candm[3], C[3], M);

  xor xorf1(F[0], gxp[0], candm[0]);
  xor xorf2(F[1], gxp[1], candm[1]);
  xor xorf3(F[2], gxp[2], candm[2]);
  xor xorf4(F[3], gxp[3], candm[3]);

  and andAeqB(AeqB, F[0], F[1], F[2], F[3]);


endmodule
