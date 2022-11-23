`timescale 1ns/1ns

module BCS_1 (input b,a,e0,g0 , output eq,gt);

    wire j,k;
    assign #(12,12) j = a ~^ b;
    assign #(13,18) eq = j & e0;
    assign #(27,17) k = ~a & b & e0;
    assign #(19,18) gt = k | g0;
    
endmodule