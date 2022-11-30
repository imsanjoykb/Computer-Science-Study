`timescale 1ns / 1ps
module alu74181(
    input [3:0] A,
    input [3:0] B,
    input M,
    input [3:0] S,
    input Cn,
    output [3:0] F,
    output G,
    output P,
    output Cn4,
    output AeqB
    );
	 wire [3:0] gb, pb, C, Bnot;
	 module1 m1 (A, B, S, gb, Bnot);
	 module2 m2 (A, B, Bnot, S, pb);
	 modulefinal1 m3(gb, pb, Cn, C, G, P, Cn4);
	 modulefinal2 m4(gb, pb, C, M, F, AeqB);
endmodule
