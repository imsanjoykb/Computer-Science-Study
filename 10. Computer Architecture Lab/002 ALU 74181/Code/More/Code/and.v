module myand1(input a,
		output o);
	assign o = a;
endmodule 

module myand2(input a, b,
		output o);
	assign o = a & b;
endmodule


module myand3(input a, b, c,
		output o);
	assign o = a & b & c;
endmodule 

module myand4(input a, b, c, d,
		output o);
	assign o = a & b & c & d;
endmodule 

module myand5(input a, b, c, d, e,
		output o);
	assign o = a & b & c & d & e;
endmodule 