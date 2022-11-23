`timescale 1ns/1ns

module flip_flop_shift_reg(input sin,clk,rst, output [7:0] out,so);

    wire s[8:0];
    wire qb[7:0];
    assign s[8] = sin;
    assign so = s[0];
    genvar i;

    generate
        for ( i=7 ;i>=0 ;i=i-1 ) begin : d_flip_flip_gates
            d_flip_flop XXX (s[i+1],clk,rst,s[i],qb[i]);
        end
    endgenerate

    genvar j;
    for (j =0 ;j<8 ;j=j+1 ) begin
        assign out[j]=s[j];
    end

endmodule

module flip_flop_reg(input [7:0]in,clk,rst, output [7:0] out);

    wire qb[7:0];
    genvar i;

    generate
        for ( i=7 ;i>=0 ;i=i-1 ) begin : d_flip_flip_gates
            d_flip_flop XXX (in[i],clk,rst,out[i],qb[i]);
        end
    endgenerate

endmodule

module shift_8_flip_flop_test ();
    
    reg sin,clk=0,rst=0;
    wire so;
    wire [7:0]out;
    flip_flop_shift_reg test(sin,clk,rst,out,so);

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

        #200 $stop;

    end

endmodule

module flip_flop_reg_test ();
    
    reg clk=0,rst=0;
    wire [7:0]out;
    reg [7:0]in;
    flip_flop_reg test(in,clk,rst,out);

    always #25 clk <= ~clk;

    initial begin
        
        #25
        rst=1;
        #25
        rst=0;
        in = 8'b00000000;
        #25
        in = 8'b01010010;
        #25
        in = 8'b11111111;
        #20
        rst=1;
        #5
        in = 8'b11000011;
        #25
        rst = 0;
        #25
        rst=1;

        #200 $stop;

    end

endmodule
