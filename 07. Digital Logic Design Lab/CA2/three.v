`timescale 1ns/1ns

module TBCS_2 (input [1:0]a,[1:0]b,e0,g0 , output eq,gt);

    /*wire w1,w2,w3,w4,w5,w6;
    xnor xn1(w1,a[1],b[1]),xn2(w2,a[0],b[0]);
    and nd1(w3,a[1],~b[1]),nd2(w4,a[0],~b[0]);
    and n1(eq,e0,w1,w2),n2(w5,e0,w3),n3(w6,w4,e0,w1);
    or o1(gt,g0,w5,w6);*/

    assign #12 eq = (a==b) ? e0 : 0;
    assign #112 gt = (a==b) ? g0 :(a>b);

endmodule

module TBCS_2_test ();

    reg [1:0]a;
    reg [1:0]b;
    wire eq,gt;
    reg e0,g0;
    TBCS_2 test (a,b,e0,g0,eq,gt);
    integer i,j;

	initial begin
    #500
    e0 = 1;
    g0 = 0;
    /*a = 2'd2;
    b = 2'd2;

    #500
    a = 2'd0;
    b = 2'd3;

    #500
    a = 2'd2;
    b = 2'd0;*/
    a = 2'd0;
    for (i = 0; i<4; i = i+1) begin
        j=0;
        b = 2'd0;
        for (j = 0 ; j<4 ; j = j +1 ) begin
            #500 b = b + 2'd1;
        end
        a = a + 2'd1;
    end
    
    #500 $stop;
	end
    
endmodule