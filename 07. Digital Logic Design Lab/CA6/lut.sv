module lut (input[2:0]add,output [9:0] data);
    
    logic[9:0] dd;
    always @(add) begin
        case(add)
            0 : dd = 10'b0010000000;
            1 : dd = 10'b0000010100;
            2 : dd = 10'b0000001000;
            3 : dd = 10'b0000000100;
            4 : dd = 10'b0000000011;
            5 : dd = 10'b0000000010;
        endcase
    end 
		
	assign data = dd;
	
endmodule
