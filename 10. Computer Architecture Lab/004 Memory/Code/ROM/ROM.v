module ROM(
        input wire [7:0] Address,
	      output wire [7:0] out
);
  reg [255:0] data [7:0];
  initial
  // first method
    $readmemb("E:\data.txt", data, 0);
		 assign out = data[Address];
		
   
  /*
    second method
		case (Address)
		0 : out = 8'b0;
		1 : out = 8'b0;
		2 : out = 8'b0;
		3 : out = 8'b0;
		4 : out = 8'b0;
		5 : out = 8'b0;
		6 : out = 8'b0;
		7 : out = 8'b0;
		endcase
  
  */
endmodule