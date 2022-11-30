`timescale 1ns / 1ps
module ripple_adder4_test;
	reg [3:0] a;
	reg [3:0] b;
	reg cin;
	wire [3:0] sum;
	wire cout;
	ripple_adder4 uut (
		.a(a),
		.b(b),
		.cin(cin),
		.sum(sum),
		.cout(cout)
	);

	initial begin
		a = 0;
		b = 0;
		cin = 0;
      	a = 4'b0011; b = 4'b1100; cin = 1'b0;
		#100;
      	a = 4'b0011; b = 4'b1100; cin = 1'b1;
		#100;
      	a = 4'b0001; b = 4'b1111; cin = 1'b1;
		#100;
	end
endmodule

