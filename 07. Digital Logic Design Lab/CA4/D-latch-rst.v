`timescale 1ns/1ns

module d_latch_rst(input d,clk,rst, output q,qb);

    wire w1,w2,w3,w4,w5;
    assign q = w4;
    assign qb = w3;
    not #6 n6(w5,rst);
    nand #8 n1(w1,w5,d,clk),n2(w2,w1,clk),n3(w4,w1,w3),n4(w3,w5,w2,w4);

endmodule

module d_latch_rst_test ();
    
    reg d,clk=0,rst;
    wire q,qb;
    d_latch_rst test(d,clk,rst,q,qb);

    always #25 clk <= ~clk;

    initial begin
        
        #25 
        rst=0;
        d=0;
        #25
        d=1;
        #25
        d=0;
        #25
        d=1;
        #25
        d=1;
        #10
        rst=1;
        #25
        d=1;
        #25
        d=0;
        rst=0;
        #25
        d=0;
        #25
        d=0;
        rst=1;
        #25
        d=1;
        #25
        rst=0;
        #100
        d=1;
        #100
        rst=1;

        #200 $stop;

    end

endmodule