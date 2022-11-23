module controller(input clk,start,cmp ,output logic ready,xrrst,xren,ytrst,yten,cntrst,cnten,aswitch,s);
	reg [2:0] ps, ns;
	integer i = 1;
	parameter [2:0] idle = 0, initi = 1, Begin = 2, mult1 = 3, mult2 = 4, mult3 = 5, compY = 6,  add = 7;
	always@(ps , start) begin
		ns = idle;
		case(ps)
			idle: ns = start ? initi : idle;
			initi: ns = start ? initi : Begin;
			Begin: ns = mult1;
			mult1: ns = mult2;
			mult2: ns = mult3;
			mult3: ns = compY;
			compY: ns = cmp ? idle : add;
			add: ns = mult1;
			default: ns = idle;
		endcase
	end
	
	always@(ps, start) begin
		ready=0;xrrst=0;xren=0;ytrst=0;yten=0;cntrst=0;cnten=0;s=0;
		case(ps)
			idle: begin cntrst=1;ready=1; end
			initi: begin cntrst=1; end
			Begin: begin ytrst=1;xrrst=1; end
			mult1: begin s= 1'b0;yten=1; end
			mult2: begin s= 1'b1; yten=1;; end
			mult3: begin s= 1'b1; yten=1; end
			compY: begin i = i + 1 ; aswitch = (i%2); end
			add: begin xren=1;cnten=1;end
		endcase
	end
	always@(posedge clk)begin
		ps <= ns;
	end
endmodule
			