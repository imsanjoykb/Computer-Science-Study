`timescale 1ns/1ns

module BCS_8 (input [7:0]a,[7:0]b,e0,g0 , output eq,gt);

    wire e1[0:8];
    wire g1[0:8];
    assign e1[8] = e0;
    assign eq = e1[0];
    assign g1[8] = g0;
    assign gt = g1[0];
    genvar i;
    generate
        for (i = 7 ; i >= 0 ; i = i - 1) begin : BCSgates
            BCS_1 XX (a[i],b[i],e1[i+1],g1[i+1],e1[i],g1[i]);
        end
    endgenerate
    
endmodule

module BCS_8_test ();

    integer i,j;
    reg [7:0]a;
    reg [7:0]b;
    wire eq,gt;
    reg e0,g0;
    BCS_8 test (a,b,e0,g0,eq,gt);

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

    /*for (i = 0; i<2; i = i+1) begin
        j=0;
         b = 8'b128;
        for (j = 0 ; j<2 ; j = j +1 ) begin
            #500 b = b + 8'b128;
        end
        a = a + 8'b128;
    end*/
    #500 $stop;
	end
    
endmodule