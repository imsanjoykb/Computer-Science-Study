module RAM_256_TB();

reg CLK, W_R, CS;
reg [7:0] Address, Data_in;
wire [7:0] Data_out;
RAM_256 ram(
     CLK,
     Address,
     W_R,
     Data_in,
     CS,
     Data_out
    );
always
begin
 CLK = ~CLK; #10;
end
initial
begin
	CLK = 0;
	W_R = 0;
	CS = 1'b0;               //chip gheir faal
	Address = 8'b0;          // khorooji z
	Data_in = 8'b0;
	
	#100;
	CS = 1'b1;
	W_R = 1'b1;
	Address = 8'b1101;         // write
	Data_in = 8'b111111;
	
	#100;
	Address = 8'b101;         // write
	Data_in = 8'b11;
	#100;
	W_R = 0;
	Data_in = 8'b101010;      // read
	Address = 8'b1101;
	 
	#100; 
	Address = 8'b101;        //read
	
	#100; 
	CS = 1'b0;              //chip gheir faal zzzz 

end

endmodule
