`timescale 1ns/1ns

module TBCS_8 (input [7:0]a,[7:0]b,e0,g0 , output eq,gt);

    wire e1[0:5];
    wire g1[0:5];
    assign e1[4] = e0;
    assign eq = e1[0];
    assign g1[4] = g0;
    assign gt = g1[0];
    genvar i;
    generate
        for (i = 3 ; i >= 0 ; i = i - 1) begin : TBCSgates
            TBCS_2 XX (a[(2*i)+1:2*i],b[(2*i)+1:2*i],e1[i+1],g1[i+1],e1[i],g1[i]);
        end
    endgenerate
    
endmodule

module TBCS_8_test ();

    integer i,j;
    reg [7:0]a;
    reg [7:0]b;
    wire eq,gt;
    reg e0,g0;
    TBCS_8 test (a,b,e0,g0,eq,gt);

	initial begin
    #1000
    e0 = 1;
    g0 = 0;
    a = 8'd0;
    b = 8'd0;

    #1000 b = 8'd128;
    #1000 b = 8'd0;

    #1000 a = 8'd128;
    #1000 a = 8'd0;
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