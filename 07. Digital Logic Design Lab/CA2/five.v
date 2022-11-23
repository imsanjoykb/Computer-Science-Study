`timescale 1ns/1ns

module compare_test ();

    integer i,j;
    reg [7:0]a;
    reg [7:0]b;
    wire eq_8,gt_8,eq_4,gt_4;
    reg e0,g0;
    BCS_8 test1 (a,b,e0,g0,eq_8,gt_8);
    TBCS_8 test2 (a,b,e0,g0,eq_4,gt_4);

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

    for (i = 0; i<256; i = i+1) begin
        j=0;
        b = 8'd0;
        for (j = 0 ; j<256 ; j = j +1 ) begin
            #1000 b = b + 8'd1;
        end
        a = a + 8'd1;
    end
    
    #500 $stop;
	end
    
endmodule