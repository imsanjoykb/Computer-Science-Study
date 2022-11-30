`timescale 1ns / 1ps

module imem(
	 input [7:0] a,
	 output [15:0] rd
	 );

	reg [15:0] RAM[255:0];

	initial 
		$readmemh("C:/Users/pixel/Desktop/src/memfile.dat",RAM);

	assign rd = RAM[a[7:2]];

endmodule
