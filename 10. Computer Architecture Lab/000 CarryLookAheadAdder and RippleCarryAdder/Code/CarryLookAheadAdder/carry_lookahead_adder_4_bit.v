`timescale 1ns / 1ps
module carry_lookahead_adder_4_bit(
    input [3:0] i_add1,
    input [3:0] i_add2,
    input cin,
    output [3:0] o_result,
	  output [3:0] o_carry
);

  wire [4:0]    w_C;
  wire [3:0]    w_G, w_P, w_SUM;
  full_adder full_adder_bit_0
    (
      .i_bit1(i_add1[0]),
      .i_bit2(i_add2[0]),
      .i_carry(w_C[0]),
      .o_sum(w_SUM[0]),
      .o_carry()
      );
  full_adder full_adder_bit_1
    (
      .i_bit1(i_add1[1]),
      .i_bit2(i_add2[1]),
      .i_carry(w_C[1]),
      .o_sum(w_SUM[1]),
      .o_carry()
      );
  full_adder full_adder_bit_2
    (
      .i_bit1(i_add1[2]),
      .i_bit2(i_add2[2]),
      .i_carry(w_C[2]),
      .o_sum(w_SUM[2]),
      .o_carry()
      );
  full_adder full_adder_bit_3
    (
      .i_bit1(i_add1[3]),
      .i_bit2(i_add2[3]),
      .i_carry(w_C[3]),
      .o_sum(w_SUM[3]),
      .o_carry()
      );
  assign w_G[0] = i_add1[0] & i_add2[0];
  assign w_G[1] = i_add1[1] & i_add2[1];
  assign w_G[2] = i_add1[2] & i_add2[2];
  assign w_G[3] = i_add1[3] & i_add2[3];

  assign w_P[0] = i_add1[0] | i_add2[0];
  assign w_P[1] = i_add1[1] | i_add2[1];
  assign w_P[2] = i_add1[2] | i_add2[2];
  assign w_P[3] = i_add1[3] | i_add2[3];


  assign w_C[0] = cin;
  assign w_C[1] = w_G[0] | (w_P[0] & w_C[0]);
  assign w_C[2] = w_G[1] | (w_P[1] & w_C[1]);
  assign w_C[3] = w_G[2] | (w_P[2] & w_C[2]);
  assign w_C[4] = w_G[3] | (w_P[3] & w_C[3]);

  assign o_result = w_SUM;
  assign o_carry = w_C[4];
endmodule
