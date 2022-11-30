module mult
	#(parameter N = 32) (input reset, start, clk,
	input[N-1:0] A,B,
	output[2*N-1:0] O, output finish);
logic[2:0] State;
logic[2*N-1:0] multiplicand, product;
logic[N-1:0] multiplier;
logic[N-1:0] counter,zeroExt;
assign zeroExt = 0;
assign O = product;
assign finish = (State == 4)? 1'b1 : 1'b0;

always_ff @(posedge reset or posedge start or posedge clk)
begin
	if(start) begin	//Start
		State <= 0;
		counter <= 1;
		multiplicand <= {zeroExt,A};
		multiplier <= B;
		product <= 0;
	end
	else if(reset) begin
		State <= 8;	//useless state that do nothing
		counter <= 1;
	end
	else if(State==0) begin	//Test multiplier0
		if(multiplier[0]==1'b1) begin	//Add multiplicand to product and place the result in product register
			product <= product + multiplicand;
		end
		State <= State + 1;
	end
	else if(State==1) begin	//Shift the multiplicand register left 1 bit
		multiplicand <= {multiplicand[2*N-2:0], 1'b0};
		State <= State + 1;
	end
	else if(State==2) begin	//Shift the multiplier register right 1 bit
		multiplier <= {1'b0, multiplier[N-1:1]};
		State <= State + 1;
	end
	else if(State==3) begin	//32nd repetition?
		if(counter[N-1] == 1) begin //No: < 32 repetitions
			State <= 4;
		end
		else begin //Yes: 32 repetitions
			State <= 0;
			counter <= {counter[N-2:0], 1'b0};
		end
	end
end
endmodule 