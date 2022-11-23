`timescale 1ns/1ns

module my_2_xnor_test (); /*Test for my 2 input xnor*/

	reg aa,bb;
	wire ww;
	my_2_xnor test(aa,bb,ww);
    integer i;
    reg[2:0] data = 2'b0;

	initial begin

    for (i = 0; i<4; i = i+1) begin
        
        #100 {aa,bb} = data;
        data = data + 2'b1;

    end
    #100 $stop;
	end

endmodule