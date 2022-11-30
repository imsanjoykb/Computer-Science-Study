`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    00:42:56 03/02/2021 
// Design Name: 
// Module Name:    RingCounter 
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
module RingCounter(
    input clk,
    input reset,
    output reg[7:0] out
    );

always @(posedge clk)
begin
	if(reset)
		out<=8'b00000001; //start
	else
	begin
	out[7]<=out[0];
	out[6]<=out[7];
	out[5]<=out[6];
	out[4]<=out[5];
	out[3]<=out[4];
	out[2]<=out[3];
	out[1]<=out[2];
	out[0]<=out[1];
	end
	end
endmodule
