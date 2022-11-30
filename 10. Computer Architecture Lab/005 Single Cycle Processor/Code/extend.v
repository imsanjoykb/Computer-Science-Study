`timescale 1ns / 1ps

module extend(
	 input [2:0] inputImm,
	 input [7:0] ImmLi,
	 input ImmSrc,
	 output reg [7:0] outputImm
	 );


    always @(ImmSrc, ImmLi, inputImm)
    case(ImmSrc)
        1'b0: outputImm = {5'b0 , inputImm};

        1'b1: outputImm = ImmLi ;
        
        default: outputImm =  7'bx ;
    endcase
    

endmodule
