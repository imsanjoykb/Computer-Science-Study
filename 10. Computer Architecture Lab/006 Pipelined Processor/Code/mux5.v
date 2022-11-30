`timescale 1ns / 1ps

module mux5 #(parameter WIDTH = 8)(
	 input [WIDTH-1:0] d0, 
	 input [WIDTH-1:0] d1, 
	 input [WIDTH-1:0] d2, 
	 input [WIDTH-1:0] d3, 
	 input [WIDTH-1:0] d4,
	 input [2:0] s,
	 output reg [WIDTH-1:0] y
	 );

    always @(*)
		 if(s == 3'b001) y = d1;
		 else if(s == 3'b010) y = d2;
		 else if(s == 3'b011) y = d3;
		 else if(s == 3'b100) y = d4;
		 else y = d0;

endmodule
