module reg_10(input clk, rst,en,input[9:0] pin, output logic[9:0] pout);

  always @(posedge clk, posedge rst) begin
    if(rst) pout = 10'b0100000000;
    else pout <= en ? pin : pout;
  end

endmodule
