`timescale 1ns/1ns

module tb();

    logic clk = 0 , start = 0;
    logic [9:0]x = 10'b0000000000;
    logic [9:0]y = 10'b0000000001;
    wire ready;
    wire [9:0]result;

    ccc test(clk,start,x,y,result,ready);

    always #25 clk = ~clk;
    initial begin
        #100 start = 1;
        #100 start = 0;
        #1000 $stop;
    end

endmodule