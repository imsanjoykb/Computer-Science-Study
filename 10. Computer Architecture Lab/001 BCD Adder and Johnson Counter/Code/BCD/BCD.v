`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:17:41 03/01/2021 
// Design Name: 
// Module Name:    BCD 
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
module BCD(
    input [3:0] a,
    input [3:0] b,
    input cin,
    output [3:0] s,
    output cout
    );

	wire [3:0] sp;
	wire c, cignore, t1, t2;
	adder_4bit a1(a, b, cin, sp, c);
	adder_4bit a2(sp, {1'b0, cout, cout, 1'b0}, 0, s, cignore);
	AndGate u1(sp[3], sp[2], t1);
	AndGate u2(sp[3], sp[1], t2);
	orGate v(c, t1, t2, cout);

endmodule
