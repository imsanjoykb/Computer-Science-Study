module testbench();

reg[3:0] A;
reg[3:0] B;
reg[3:0] S;
reg M;
reg Cn_;

wire[3:0] F;
wire Eq;
wire G;
wire P;
wire Cnplus;

ALU alu0(A,B,S,
		M,Cn_,
		F,
		Eq,G,P,Cnplus);




initial
	begin
		S = 4'b0000;
		A = 4'b0010;
		B = 4'b0110;
		M = 1'b0;
		Cn_ = 1'b1;

		
		#15;
		S = 4'b0001;
		A = 4'b1010;
		B = 4'b0110;
		M = 1'b0;
		Cn_ = 1'b0;

	
		#15;
		S = 4'b0010;
		A = 4'b1110;
		B = 4'b1010;
		M = 1'b0;
		Cn_ = 1'b0;
		
		
		
		#15;
		S = 4'b0011;
		A = 4'b1110;
		B = 4'b0001;
		M = 1'b1;
		Cn_ = 1'b1;
		
		
		
		
		#15;
		S = 4'b0101;
		A = 4'b1111;
		B = 4'b1111;
		M = 1'b0;
		Cn_ = 1'b1;
		
		

		
		
		
		#15;
		S = 4'b0111;
		A = 4'b1111;
		B = 4'b1111;
		M = 1'b0;
		Cn_ = 1'b0;
		
		
		
		
		#15;
		S = 4'b1000;
		A = 4'b1111;
		B = 4'b0111;
		M = 1'b0;
		Cn_ = 1'b0;
		
		
		
		

		
		
		
		
		#15;
		S = 4'b1010;
		A = 4'b0111;
		B = 4'b1000;
		M = 1'b0;
		Cn_ = 1'b1;
		
		
		

		
		
		
		
		#15;
		S = 4'b1100;
		A = 4'b1111;
		B = 4'b1111;
		M = 1'b0;
		Cn_ = 1'b1;
		
		
		
		
		
		

		
		
		
		
		
		#15;
		S = 4'b1100;
		A = 4'b0111;
		B = 4'b0001;
		M = 1'b1;
		Cn_ = 1'b0;
		
		


	$finish;
end
endmodule