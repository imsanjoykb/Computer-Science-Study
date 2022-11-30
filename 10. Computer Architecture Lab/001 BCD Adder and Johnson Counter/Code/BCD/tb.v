module tb;

	// Inputs
	reg [11:0] a;
	reg [11:0] b;
	reg cin;

	// Outputs
	wire [11:0] s;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	BCD3 uut (
		.a(a),
		.b(b),
		.cin(cin),
		.s(s),
		.cout(cout)
	);

	initial
	begin
		cin = 0;
		a = 12'b0000_0000_0010; //2
		b = 12'b0000_0000_0011; //3
		#100;
		a = 12'b0001_0001_0001; //111
		b = 12'b0001_0001_0001; //111
		#100;
		a = 12'b1000_1000_1000; //888
		b = 12'b0011_0011_0011; //333   overflow
		#100;
	end
endmodule