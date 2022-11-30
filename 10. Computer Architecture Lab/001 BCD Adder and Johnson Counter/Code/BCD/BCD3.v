`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:35 03/01/2021 
// Design Name: 
// Module Name:    BCD3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module BCD3(
    input [11:0] a,
    input [11:0] b,
    input cin,
    output [11:0] s,
    output cout
    );

	wire c1, c2;
	BCD b1(a[3:0], b[3:0], cin, s[3:0], c1);
	BCD b2(a[7:4], b[7:4], c1, s[7:4], c2);
	BCD b3(a[11:8], b[11:8], c2, s[11:8], cout);

endmodule
