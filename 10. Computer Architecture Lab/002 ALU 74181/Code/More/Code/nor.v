module mynor2(input a,b,
		output o);
	assign o = ~(a | b);
endmodule

module mynor3(input a, b, c,
		output o);
	assign o = ~(a | b | c);
endmodule 


module mynor4(input a, b, c, d,
		output o);
	assign o = ~(a | b | c | d);
endmodule
