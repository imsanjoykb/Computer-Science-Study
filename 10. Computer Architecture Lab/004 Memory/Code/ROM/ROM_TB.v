module ROM_TB();

    reg [7:0] Address;
    wire [7:0] Out;


    ROM rom(Address ,Out);

    initial
        begin
            Address = 0;//0
            #100;
            Address = 8'b00000001;//1
            #100;
            Address = 8'b00000010;//2
            #100;
            Address = 8'b00000011;//3
            #100;
            Address = 8'b00000100;//4
            #100;
            Address = 8'b00000101;//5
            #200;
        end

endmodule
