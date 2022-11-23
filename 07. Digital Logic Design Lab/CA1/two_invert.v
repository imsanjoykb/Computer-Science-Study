`timescale 1ns/1ns

module my_invert_test (); /*Test for my_invert*/

    reg aa;
	wire ww;
    integer i;
    reg[1:0] data = 1'b0;
    my_invert test(aa,ww);

	initial begin

    for (i = 0; i<2; i = i+1) begin
        
        #100 aa = data ;
        data = data + 1'b1;

    end
    #100 $stop;
	end

endmodule