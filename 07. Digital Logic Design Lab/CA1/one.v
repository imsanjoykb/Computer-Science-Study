`timescale 1ns/1ns

module my_invert(input a , output w);

	supply1 vdd;
	supply0 gnd;

	pmos #(5,6,7) t1 (w,vdd,a);
	nmos #(3,4,5) t2 (w,gnd,a);

endmodule

module my_2_xnor(input a,b , output w); /*j1*/
	
	wire w1,w2;
	my_invert invert1(b,w2) , invert2(a,w1);
	nmos #(3,4,5) t1 (w,w1,w2) , t2 (w,a,b);

endmodule

module my_3_nand (input a,b,c , output w);
	
	supply0 gnd;
	supply1 vdd;
	wire w1,w2;
	nmos #(3,4,5) nt1 (w,w2,a) , nt2 (w2,w1,b) , nt3(w1,gnd,c);
	pmos #(5,6,7) pt1 (w,vdd,a) , pt2 (w,vdd,b) , pt3(w,vdd,c);

endmodule

module my_2_nand (input a,b , output w);
	
	supply0 gnd;
	supply1 vdd;
	wire w1;
	nmos #(3,4,5) nt1 (w,w1,a) , nt2 (w1,gnd,b);
	pmos #(5,6,7) pt1 (w,vdd,a) , pt2 (w,vdd,b);

endmodule

module my_3_and (input a,b,c , output w); /*k1*/
	
	wire ww;
	my_3_nand nand1(a,b,c,ww);
	my_3_nand invert1(ww,ww,ww,w);

endmodule

module my_2_and (input a,b , output w); /*e1*/
	
	wire ww;
	my_2_nand nand1(a,b,ww);
	my_2_nand invert1(ww,ww,w);

endmodule

module my_2_nor (input a,b , output w);
	
	supply0 gnd;
	supply1 vdd;
	wire w1;
	nmos #(3,4,5) nt1 (w,gnd,a) , nt2 (w,gnd,b);
	pmos #(5,6,7) pt1 (w1,vdd,a) , pt2 (w,w1,b);

endmodule

module my_2_or (input a,b , output w); /*g1*/
	
	wire ww;
	my_2_nor nor1(a,b,ww);
	my_2_nand invert1(ww,ww,w);

endmodule

module one (input a1,b1,e0,g0 , output e1,g1); /*The transistor-level BCS*/
	
	wire j1,k1;
	my_2_xnor xnor1(a1,b1,j1);
	my_2_and and1(j1,e0,e1);
	my_3_and and2(~a1,b1,e0,k1);
	my_2_or or1(k1,g0,g1);

endmodule