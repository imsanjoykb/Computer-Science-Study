`timescale 1ns/1ns

module latch_reg(input sin,clk,rst, output [7:0] out,so);

    wire s[8:0];
    wire qb[7:0];
    assign s[8] = sin;
    assign so = s[0];
    genvar i;

    generate
        for ( i=7 ;i>=0 ;i=i-1 ) begin : d_latch_rst_gates
            d_latch_rst XXX (s[i+1],clk,rst,s[i],qb[i]);
        end
    endgenerate

    genvar j;
    for (j =0 ;j<8 ;j=j+1 ) begin
        assign out[j]=s[j];
    end

endmodule

module latch_reg_test ();
    
    reg sin,clk=0,rst=0;
    wire so;
    wire [7:0]out;
    latch_reg test(sin,clk,rst,out,so);

    always #25 clk <= ~clk;

    initial begin
        
        #25 
        sin=1;
        #500
        sin=0;
        #200
        sin=1;
        #100
        rst=1;
        #100
        rst=0;
        sin=1;
        #250
        sin=0;
        //#50
        //sin=1;

        #200 $stop;

    end

endmodule