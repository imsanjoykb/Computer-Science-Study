`timescale 1ns/1ns

module d_latch(input d,clk, output q,qb);

    wire w1,w2,w3,w4;
    assign q = w4;
    assign qb = w3;
    nand #8 n1(w1,d,clk),n2(w2,w1,clk),n3(w4,w1,w3),n4(w3,w2,w4);

endmodule

module d_latch_test ();
    
    reg d,clk=0;
    wire q,qb;
    d_latch test(d,clk,q,qb);

    always #25 clk <= ~clk;

    initial begin
        
        #25 
        d=0;
        #25
        d=1;
        #25
        d=0;
        #25
        d=1;
        #25
        d=1;
        #25
        d=1;
        #25
        d=0;
        #25
        d=0;
        #25
        d=0;
        #25
        d=1;
        #5
        d=0;
        #30
        d=1;

        #200 $stop;

    end

endmodule