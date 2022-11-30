`timescale 1ns / 1ps
module carry_lookahead_adder_test;
	reg [3:0] i_add1;
	reg [3:0] i_add2;
	reg cin;
	wire [3:0] o_result;
	carry_lookahead_adder_4_bit uut (
		.i_add1(i_add1),
		.i_add2(i_add2),
		.i_carry(cin),
		.o_result(o_result),
		.o_carry(o_carry)
	);

	initial begin
		cin = 1'b0;
		i_add1 = 4'b0011;
		i_add2 = 4'b1100;
		#100;
		cin = 1'b1;
      	i_add1 = 4'b0011;
		i_add2 = 4'b1100;

		#100;
		cin = 1'b1;
		i_add1 = 4'b0001;
		i_add2 = 4'b1111;
	end

endmodule

