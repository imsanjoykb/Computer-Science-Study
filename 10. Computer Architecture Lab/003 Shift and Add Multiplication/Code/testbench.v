module testbench;

	// Inputs
	reg [31:0] A;
	reg [31:0] B;
	reg on;
	reg clk;

	// Outputs
	wire [63:0] out;

	// Instantiate the Unit Under Test (UUT)
	multiplier uut (
		.A(A), 
		.B(B), 
		.on(on), 
		.clk(clk), 
		.out(out)
	);
	
	always 
			#5 clk = ~clk;

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		on = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		on = 1;
		A = 2;
		B = 23;
		
		#15;
		on = 0;
		
		#300;
		
		on = 1;
		A = 125;
		B = 25;
		
		#15;
		on = 0;
		
		#300;
		
        
		// Add stimulus here

	end
      
endmodule

