`timescale 1ns / 1ps
module modulefinal1(
    input [3:0] gb,
    input [3:0] pb,
    input Cn,
    output [3:0] C,
    output G,
    output P,
    output Cn4
    );
  not C0(C[0], Cn);
  buf bufferpb0(pb0, pb[0]);
  and andcngb0(Cngb0, Cn, gb[0]);
  buf bufferpb1(pb1, pb[1]);
  and andpb0gb1(pb0gb1, pb[0], gb[1]);
  and andcngb01(Cngb01, Cn, gb[0], gb[1]);
  buf bufferpb2(pb2, pb[2]);
  and andpb1gb2(pb1gb2, pb[1], gb[2]);
  and andpb0gb1gb2(pb0gb1gb2, pb[0], gb[1], gb[2]);
  and andcngb012(Cngb012, Cn, gb[0], gb[1], gb[2]);
  buf bufferpb3(pb3, pb[3]);
  and andpb2gb3(pb2gb3, pb[2], gb[3]);
  and andpb1gb2gb3(pb1gb23, pb[1], gb[2], gb[3]);
  and andpb0gb123(pb0gb123, pb[0], gb[1], gb[2], gb[3]);
  nand nandG(G, gb[0], gb[1], gb[2], gb[3]);
  nor norP(P, pb3,pb2gb3,pb1gb23,pb0gb123);
  nand nandCnG(CnG, gb[0], gb[1], gb[2], gb[3], Cn);
  nand nandCn4(Cn4, P, CnG);
  nor norc3(C[3], pb2, pb1gb2, pb0gb1gb2, Cngb012);
  nor norc2(C[2], pb1, pb0gb1, Cngb01);
  nor norc1(C[1], pb0, Cngb0);
endmodule
