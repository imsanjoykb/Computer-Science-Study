`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:28 03/01/2021 
// Design Name: 
// Module Name:    JohnsonCounter 
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
module JohnsonCounter(

    input clk,
    input  reset,
    output reg [3:0]out
);

    always @(posedge clk)
    begin
        if (reset)
            out <= 4'b0000;
        else
        begin
            out[3]<=~out[0];
            out[2]<=out[3];
            out[1]<=out[2];
            out[0]<=out[1];
        end
    end
endmodule
