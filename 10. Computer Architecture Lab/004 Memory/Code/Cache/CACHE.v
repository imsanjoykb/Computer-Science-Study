module CACHE(
    input clk, input wire [7:0] address,
    input wire [7:0] data, input wire w_r,
    output wire hit, output wire [7:0] out
);
    reg [14:0]cache[7:0]; wire [7:0] mem_out;
    wire [1:0] set; wire [5:0] cache_tag;
    wire [5:0] input_tag; wire [7:0] cache_data;
    wire valid;

    assign set = address[1:0];
    assign input_tag = address[7:2];
    assign cache_data = cache[set][7:0];
    assign cache_tag = cache[set][13:8];
    assign valid = cache[set][14];

    RAM_256 ram(clk, address, w_r, data, ~hit, mem_out);
    assign hit=valid & (cache_tag == input_tag);
    always @ (posedge clk)
    begin
        if (w_r)
        begin
            cache[set] = {1'b1, input_tag, data};
        end
        else if (~hit)
            cache[set]= {1'b1, input_tag, mem_out};
    end
    assign out = hit ? cache_data : mem_out;

endmodule
