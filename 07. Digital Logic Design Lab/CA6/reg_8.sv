module reg_8(input clk, rst,en,input[7:0] pin, output logic[7:0] pout);

  always @(posedge clk, posedge rst) begin
    if(rst) pout <= 8'b0;
    else pout <= en ? pin : pout;
  end

endmodule