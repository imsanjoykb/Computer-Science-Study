`timescale 1ns/1ns

module test_bench();

  	logic sIn = 1'b1;
  	logic clk = 1'b0;
	wire valid,error;
	wire validq,errorq;
	wire[1:0] d;
	wire[1:0] dq;
	wire[3:0] port;
	wire[3:0] portq;
	parameter [1:0] p = 2'd2;
	parameter [5:0] n = 6'd3;
	mssd test(clk,sIn,valid,error,d,port);
	mssd_q test_q(clk,sIn,validq,errorq,dq,portq);
	integer i;
	always #250 clk = ~clk;
	initial begin
		#500 sIn = 1'b0;
		for(i=0;i<2;i = i+1)
			#500 sIn = p[i];
		for(i=0;i<6;i = i+1)
			#500 sIn = n[i];
		repeat(8*n) #500 sIn = $random;
		#500 sIn = 1;
		#1000 $stop;
	end

endmodule
