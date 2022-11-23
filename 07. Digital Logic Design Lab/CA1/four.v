`timescale 1ns/1ns

module four_test (); /*Test for transistor-level BCS and gate-level BCS*/

	reg a1,b1,e0,g0;
	wire e1_one,g1_one,e1_three,g1_three;
    one test1(a1,b1,e0,g0,e1_one,g1_one);
	three test2(a1,b1,e0,g0,e1_three,g1_three);
    integer i;
    reg[4:0] data = 4'b0;

	initial begin

    for (i = 0; i<16; i = i+1) begin
        
        #100 {a1,b1,e0,g0} = data;
        data = data + 4'b1;

    end
    #100 $stop;
	end

endmodule