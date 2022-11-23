`timescale 1ns/1ns

module d_flip_flop(input d,clk,rst, output q,qb);

    wire w1,w2,w3,w4,w5,w7,w8;
    not #6 n1(w1,clk),n2(w2,w1),n3(w3,rst);
    and #14 n4(w4,d,w3);
    d_latch d1(w4,w1,w5,w6),d2(w5,w2,w7,w8);
    assign q = w7;
    assign qb = w8;

endmodule

module d_flip_flop_test ();
    
    reg d,clk=0,rst;
    wire q,qb;
    d_flip_flop test(d,clk,rst,q,qb);

    always #50 clk <= ~clk;

    initial begin
        
        #50 
        rst=0;
        d=0;
        #50
        d=1;
        #50
        d=0;
        #50
        d=1;
        rst=1;
        #50
        d=1;
        #50
        d=1;
        #50
        d=0;
        rst=0;
        #50
        d=0;
        #50
        d=0;
        rst=1;
        #50
        d=1;
        #50
        rst=0;

        #200 $stop;

    end

endmodule