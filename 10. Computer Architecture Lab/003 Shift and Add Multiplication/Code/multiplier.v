module multiplier(
    input [31:0] A,
    input [31:0] B,
	input on,
    input clk,
    output [63:0] out
    );
	 
	 reg [31:0] multiplier;
	 reg [63:0] multiplicand;
	 reg [63:0] result;
	 
	 always @(posedge clk) begin
	 
	 
	 if(on) begin //initial
		
			multiplicand <= {32'b0, A[31:0]};
			multiplier <= B;
			result <= 64'b0;
		
		end //initial
		
		else if (|multiplier) begin 
		
			if (multiplier[0] == 1'b1) begin
				result <= result + multiplicand;
			end
			
			multiplicand <= multiplicand << 1;
			multiplier <= multiplier >> 1;
			
		end
		
	 
	 end //end of always

		assign out = result;

endmodule
