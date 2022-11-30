module mynand2(input a, b,
		output o);
	assign o = ~(a & b);
endmodule 
module mynand4(input a, b, c, d,
		output o);
	assign o = ~(a & b & c & d);
endmodule 

module mynand5(input a, b, c, d, e,
		output o);
	assign o = ~(a & b & c & d & e);
endmodule 