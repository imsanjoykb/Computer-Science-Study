module CACHE_TB();

reg clk, w_r;
reg [7:0] data, address;
wire hit;
wire [7:0] out;
CACHE cache(clk, address, data, w_r, hit, out);

always
begin
  clk = ~clk; #1;
end

  initial
  begin
    clk = 0;
    address = 0;
    data = 0;
    w_r = 0;
    #100;
    address = 3;
    data = 6;
    #100;
    w_r = 1;
    #100;
    w_r = 0;
    #100;
    w_r = 1;
    address = 18;
    data = 59;
    #100;
    w_r = 0;
    #100;
    address = 3;
    #100;
    address = 18;
    #100;
  end
endmodule

