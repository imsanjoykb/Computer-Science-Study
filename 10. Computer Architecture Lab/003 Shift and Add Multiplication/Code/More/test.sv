module test();
// signals
	reg start,reset,clk;
	reg[31:0] A1,B1,A0,B0;
	reg[15:0] A2,B2;
	reg[7:0] A3,B3;
	reg[3:0] A4,B4;
	
// Outputs
	wire[63:0] O1,O0;
	wire[31:0] O2;
	wire[15:0] O3;
	wire[7:0] O4;
	wire Finish0,Finish1,Finish2,Finish3,Finish4;
	
// device under test

	mult dut0(reset,start,clk, A0,B0,O0,Finish0);
	mult dut1(reset,start,clk, A1,B1,O1,Finish1);
	mult #(.N(16)) dut2(reset,start,clk, A2,B2,O2,Finish2);
	mult #(.N(8)) dut3(reset,start,clk, A3,B3,O3,Finish3);
	mult #(.N(4)) dut4(reset,start,clk, A4,B4,O4,Finish4);
	
	initial begin
	reset=0; start=0; clk = 0;
	
	A0 = 32'd24221; B0 = 32'd14867; //expect = 360,093,607
	A1 = 32'd1878781947; B1 = 32'd2114709627; //expect = ‭‭3,973,078,270,354,703,769‬
	A2 = 16'd23291; B2 = 16'd32763; //expect = ‭763,083,033‬
	A3 = 8'd61; B3 = 8'd26; //expect = ‭1,586
	A4 = 4'd6; B4 = 4'd6; //expect = 36
	end 

	initial begin
	#5 clk = !clk; #5 clk = !clk;
	start = 1;
	#5 clk = !clk; #5 clk = !clk;
	start = 0;
	end
	always
		begin
			clk <= 1; # 5; clk <= 0; # 5;
		end
endmodule 