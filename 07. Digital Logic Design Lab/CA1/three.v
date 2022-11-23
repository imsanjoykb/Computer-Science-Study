`timescale 1ns/1ns

module three (input a1,b1,e0,g0 , output e1,g1); /*The gate-level BCS*/

    wire j1,k1;
    assign #(12,12) j1 = a1 ~^ b1;
    assign #(13,18) e1 = j1 & e0;
    assign #(27,17) k1 = ~a1 & b1 & e0;
    assign #(19,18) g1 = k1 | g0;
    
endmodule