`timescale 1ns/1ns

module one_test (); /*Test for transistor-level BCS*/

	reg a1,b1,e0,g0;
	wire e1,g1;
	one test(a1,b1,e0,g0,e1,g1);
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