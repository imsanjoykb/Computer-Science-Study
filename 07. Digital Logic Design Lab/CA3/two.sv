`timescale 1ns/1ns

module BCS (input b,a,e0,g0 , output eq,gt);

    wire j,k;
    assign #(12,12) j = a ~^ b;
    assign #(13,18) eq = j & e0;
    assign #(27,17) k = ~a & b & e0;
    assign #(19,18) gt = k | g0;
    
endmodule

module NCS #(parameter n = 1) (input [n-1:0]a,[n-1:0]b,e0,g0 , output eq,gt);

    wire e1[0:n];
    wire g1[0:n];
    assign e1[n] = e0;
    assign eq = e1[0];
    assign g1[n] = g0;
    assign gt = g1[0];
    genvar i;

    generate
        for (i = n-1 ; i >= 0 ; i = i - 1) begin : BCSgates
            BCS XX (a[i],b[i],e1[i+1],g1[i+1],e1[i],g1[i]);
        end
    endgenerate
    
endmodule

module NCS_test ();

    reg [7:0]a;
    reg [7:0]b;
    wire eq,gt;
    reg e0,g0;
    NCS #8 test (a,b,e0,g0,eq,gt);

	initial begin
    #500
    e0 = 1;
    g0 = 0;
    a = 8'd0;
    b = 8'd0;

    #500 b = 8'd128;
    #500 b = 8'd0;

    #500 a = 8'd128;
    #500 a = 8'd0;

    #500 $stop;
	end
    
endmodule