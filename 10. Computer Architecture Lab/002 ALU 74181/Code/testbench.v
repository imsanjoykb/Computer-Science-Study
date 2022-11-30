`timescale 1ns / 1ps
module testbench;
	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg M;
	reg [3:0] S;
	reg Cn;
	// Outputs
	wire [3:0] F;
	wire G;
	wire P;
	wire Cn4;
	wire AeqB;
	// Instantiate the Unit Under Test (UUT)
	alu74181 uut (
		.A(A),
		.B(B),
		.M(M),
		.S(S),
		.Cn(Cn),
		.F(F),
		.G(G),
		.P(P),
		.Cn4(Cn4),
		.AeqB(AeqB)
	);

	initial begin
		Cn=1;
		// Initialize Inputs
		A = 4'b0011;
		B = 4'b0100;
		S = 4'b1001;   // A+B
		M = 0;
		#100;
		A = 4'b1100;
		B = 4'b1000;
		S = 4'b0000; 	// not A
		M = 1;
		#100;
		A=4'b1001;
		B=4'b1111; 
		S=4'b0011;     //-1
		M=0;
		#100
		A=4'b1011;
		B=4'b1101;
		S=4'b0111;    //A & not B
		M=1;
	end
endmodule

