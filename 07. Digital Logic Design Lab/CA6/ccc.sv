module ccc(input clk,start,input [9:0]x,input [9:0]y,output [9:0]result,output ready);

    wire cmp,xrrst,xren,ytrst,yten,cntrst,cnten,aswitch,s;
    controller cl (clk,start,cmp,ready,xrrst,xren,ytrst,yten,cntrst,cnten,aswitch,s);
    cosinus dp (cmp,clk,ytrst,yten,s,x,cnten,cntrst,y,result,xrrst,xren,aswitch);
endmodule
