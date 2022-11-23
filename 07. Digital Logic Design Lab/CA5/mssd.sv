module mssd(input clk, sin, output logic valid, error, output logic [1:0]d, output logic [3:0]p);

  logic [3:0] ps, ns;
  logic upen, upco, shiften, dwnen, dwnco, ld, rst;
  
  wire [7:0] data;
  wire [2:0] out3;
  wire [8:0] out9;

  parameter [3:0] A = 0, B = 1, C = 2, D = 3, E = 4, F = 5, G = 6;
  
  upcounter upcnt(clk, rst, upen, upco, out3);
  shiftreg shreg(clk, rst, shiften, sin, data);
  downcounter dwncnt(clk, rst, dwnen, ld, data[7:2], dwnco, out9);
  demux dmux(sin, d, p);
  
  always @(ps, upco, dwnco,sin) begin
    rst = 0; valid = 0; error = 0; ns = A;
    case(ps)
      A: begin rst = 1 ; ns = sin ? A : B; end
      B: begin ns = C; rst = 0; upen = 1; shiften = 1; end
      C: begin rst = 0; upen = 1; shiften = 1; ns = upco ? D : C; end
      D: begin upen = 0; shiften = 0;  ld = 1; d = data[1:0]; ns = E ; end
      E: begin ld = 0 ; dwnen = 1; valid = 1 ; ns = dwnco ? F : E; end
      F: begin dwnen = 0; ns = sin ? A : G; end
      G: begin error = 1; ns = sin ? A : G; end
      default: ns = A;
    endcase
  end

  always @(posedge clk)begin
    ps <= ns;
  end
  
endmodule

module upcounter (input clk, rst, en, output co, output logic [2:0] out);

  always @ (posedge clk, posedge rst) begin
    if(rst) out <= 3'b0;
    else if(en) out <= out + 1;
  end
  assign co = &{out};

endmodule

module downcounter (input clk, rst, en, ld, input [5:0] pin, output co, output logic [8:0] out);

  always @(posedge clk, posedge rst) begin
    if(rst) out <= 9'b0;
    else if(ld) out[8:3] <= pin;
    else if(en) out <= out - 1;
  end
  assign co = ~|{out};

endmodule

module demux (input in,input [1:0]s,output [3:0] out);

    assign out[0] = (s==2'b00) ? in : 1'bz;
    assign out[1] = (s==2'b01) ? in : 1'bz;
    assign out[2] = (s==2'b10) ? in : 1'bz;
    assign out[3] = (s==2'b11) ? in : 1'bz;
        
endmodule

module shiftreg(input clk, rst, en, in, output logic[7:0] out);

  always @(posedge clk, posedge rst) begin
    if(rst) out <= 8'b0;
    else out <= en ? {in, out[7:1]} : out;
  end

endmodule
