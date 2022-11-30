module mymor2(input a, b,
		output o);
	assign o = ~a | ~b;
endmodule