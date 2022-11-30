`timescale 1ns / 1ps

module dmem(
	 input clk, we,
	 input [7:0] a, wd,
	 output [7:0] rd
	 );

    reg [7:0] RAM[255:0];

    assign rd = RAM[a[7:2]];

    always @(posedge clk)
        if(we) RAM[a[7:2]] <= wd;

endmodule
