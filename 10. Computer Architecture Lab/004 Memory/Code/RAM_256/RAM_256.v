module RAM_256 #(parameter ADDR_WIDTH = 8, DATA_WIDTH = 8, DEPTH = 256) (
    input wire CLK,
    input wire [ADDR_WIDTH-1:0] Address,
    input wire W_R,
    input wire [DATA_WIDTH-1:0] Data_in,
    input wire CS,
    output reg [DATA_WIDTH-1:0] Data_out
    );

    reg [DATA_WIDTH-1:0] memory_array [0:DEPTH-1];

    always @ (posedge CLK)
    begin
		  if(!CS) Data_out <= 8'bzzzzzzzz;
		  else 
		  begin
        if(W_R) 
            memory_array[Address] <= Data_in;
		  else
				Data_out <= memory_array[Address];
		  end
    end
endmodule
