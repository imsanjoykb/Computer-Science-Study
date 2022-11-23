`timescale 1ns/1ns

module TMI (input [1:0]a,[1:0]b, output [1:0]s,co);

    wire [3:0]select;
    reg ci;
    assign ci = 0;
    assign select = {a[1],a[0],b[1],b[0]};
    
    assign #118 s[1] = (select == 4'b0000) ? 0 :
                       (select == 4'b0001) ? ci :
                       (select == 4'b0010) ? 1 :
                       (select == 4'b0011) ? ~ci :
                       (select == 4'b0100) ? ci :
                       (select == 4'b0101) ? 1 :
                       (select == 4'b0110) ? ~ci :
                       (select == 4'b0111) ? 0 :
                       (select == 4'b1000) ? 1 :
                       (select == 4'b1001) ? ~ci :
                       (select == 4'b1010) ? 0 :
                       (select == 4'b1011) ? ci :
                       (select == 4'b1100) ? ~ci :
                       (select == 4'b1101) ? 0 :
                       (select == 4'b1110) ? ci :
                       (select == 4'b1111) ? 1 : 1'bx;

    assign #118 s[0] = (select == 4'b0000) ? ci :
                       (select == 4'b0001) ? ~ci :
                       (select == 4'b0010) ? ci :
                       (select == 4'b0011) ? ~ci :
                       (select == 4'b0100) ? ~ci :
                       (select == 4'b0101) ? ci :
                       (select == 4'b0110) ? ~ci :
                       (select == 4'b0111) ? ci :
                       (select == 4'b1000) ? ci :
                       (select == 4'b1001) ? ~ci :
                       (select == 4'b1010) ? ci :
                       (select == 4'b1011) ? ~ci :
                       (select == 4'b1100) ? ~ci :
                       (select == 4'b1101) ? ci :
                       (select == 4'b1110) ? ~ci :
                       (select == 4'b1111) ? ci : 1'bx;

    assign #118 co  =  (select == 4'b0000) ? 0 :
                       (select == 4'b0001) ? 0 :
                       (select == 4'b0010) ? 0 :
                       (select == 4'b0011) ? ci :
                       (select == 4'b0100) ? 0 :
                       (select == 4'b0101) ? 0 :
                       (select == 4'b0110) ? ci :
                       (select == 4'b0111) ? 1 :
                       (select == 4'b1000) ? 0 :
                       (select == 4'b1001) ? ci :
                       (select == 4'b1010) ? 1 :
                       (select == 4'b1011) ? 1 :
                       (select == 4'b1100) ? ci :
                       (select == 4'b1101) ? 1 :
                       (select == 4'b1110) ? 1 :
                       (select == 4'b1111) ? 1 : 1'bx;

endmodule

module NMI #(parameter n = 2) (input [n-1:0]a, output [n-1:0]s,co);

    wire carry[n/2:0];
    assign co = carry[n/2];
    assign carry[0] = 0;
    genvar i;

    generate
        for (i = 0 ; i < n/2 ; i = i + 1) begin : TMAgates
            TMI XX (a[(2*i)+1:2*i],carry[i],s[(2*i)+1:2*i],carry[i+1]);
        end
    endgenerate
    
endmodule

module NMI_test ();

    wire co;
    reg [7:0]a;
    wire [7:0]s;
    reg ci;
    NMI #8 test (a,ci,s,co);

	initial begin
    
    #500
    a = 8'b00000000;
    b = 8'b00000000;
    ci = 1'b0;

    #500
    a = 8'b10000000;
    b = 8'b00000001;
    ci = 1'b1;

    #500
    a = 8'b00000000;
    b = 8'b00000000;
    ci = 1'b0;

    #500
    a = 8'b10000000;
    b = 8'b10000000;
    ci = 1'b0;

    #500
    a = 8'b00000000;
    b = 8'b00000000;
    ci = 1'b1;

    #500 $stop;

	end
    
endmodule