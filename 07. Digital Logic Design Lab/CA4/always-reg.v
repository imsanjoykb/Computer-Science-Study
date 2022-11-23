`timescale 1ns/1ns

module shift_reg_always (input sin,clk,rst, output reg [7:0] out,output so);

    assign so = out[7];

    always @(posedge clk) begin

        if(rst) #86 out <= 8'b0;
        else #86 out <= {sin,out[7:1]};

    end
    
endmodule

module always_flip_flop(input d,clk,rst, output reg q);

    always @(posedge clk) begin
        if (rst) #36 q<=1'b0;
        else #36 q<= d;
    end

endmodule

module always_shift_reg(input sin,clk,rst, output [7:0] out,so);

    wire s[8:0];
    assign s[8] = sin;
    assign so = s[0];
    genvar i;

    generate
        for ( i=7 ;i>=0 ;i=i-1 ) begin : always_gates
            always_flip_flop XXX (s[i+1],clk,rst,s[i]);
        end
    endgenerate

    genvar j;
    for (j =0 ;j<8 ;j=j+1 ) begin
        assign out[j]=s[j];
    end

endmodule

module shift_8_always_test ();
    
    reg sin,clk=0,rst=0;
    wire so;
    wire [7:0]out;
    always_shift_reg test(sin,clk,rst,out,so);

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

module compare_test ();
    
    reg sin,clk=0,rst=0;
    wire s1,s2,s3;
    wire [7:0]full_always_out;
    wire [7:0]always_out;
    wire [7:0]gate_out;
    shift_reg_always test1(sin,clk,rst,full_always_out,s1);
    always_shift_reg test2(sin,clk,rst,always_out,s2);
    flip_flop_shift_reg test3(sin,clk,rst,gate_out,s3);

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