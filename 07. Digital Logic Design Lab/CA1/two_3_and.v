`timescale 1ns/1ns

module my_3_and_test (); /*Test for my 3 input and*/

	reg aa,bb,cc;
	wire ww;
	my_3_and test(aa,bb,cc,ww);
    integer i;
    reg[3:0] data = 3'b0;

	initial begin

    for (i = 0; i < 8 ; i = i+1) begin
        
        #100 {aa,bb,cc} = data;
        data = data + 3'b1;

    end
    #100 $stop;
	end

endmodule