// Adder 
module adder(s, co, a, b, ci);
   
   output s, co;
   input  a, b, ci;
   wire   o0, o1, o2;
   xor(s, a, b, ci);
   or(o0, a, b);
   or(o1, b, ci);
   or(o2, ci, a);
   and(co, o0, o1, o2);

endmodule // adder

module csa1(s, co, x, y, z);

    output [6:0] s;
	output [6:0] co;
	input  [6:0] x;
	input  [6:0] y;
	input  [6:0] z;
 
	adder a0(s[0], co[0], x[0], y[0], z[0]);
    adder a1(s[1], co[1], x[1], y[1], z[1]);
    adder a2(s[2], co[2], x[2], y[2], z[2]);
	adder a3(s[3], co[3], x[3], y[3], z[3]);
	adder a4(s[4], co[4], x[4], y[4], z[4]);
    adder a5(s[5], co[5], x[5], y[5], z[5]);
    adder a6(s[6], co[6], x[6], y[6], z[6]);
	
endmodule // CSA1

module csa2(s, co, x, y, cin);

    output [6:0] s;
	output [6:0] co;
	input  [6:0] x;
	input  [6:0] y;
	input  [6:0] cin;
	wire w;
 
    assign w =0;
	adder a0(s[0], co[0], x[0], y[0], w);
    adder a1(s[1], co[1], x[1], y[1], cin[0]);
    adder a2(s[2], co[2], x[2], y[2], cin[1]);
	adder a3(s[3], co[3], x[3], y[3], cin[2]);
	adder a4(s[4], co[4], x[4], y[4], cin[3]);
	adder a5(s[5], co[5], x[5], y[5], cin[4]);
	adder a6(s[6], co[6], x[6], y[6], cin[5]);
	
endmodule // CSA2

module cpa(s, co, x, cin);
    
	output [6:0] s;
	output co;
	input  [6:0] x;
	input  [6:0] cin;
	wire w, w1, w2, w3, w4, w5, w6;
	
	assign w =0;
	adder a0(s[0], w1, x[0], cin[0], w);
	adder a1(s[1], w2, x[1], cin[1], w1);
	adder a2(s[2], w3, x[2], cin[2], w2);
	adder a3(s[3], w4, x[3], cin[3], w3);
	adder a4(s[4], w5, x[4], cin[4], w4);
	adder a5(s[5], w6, x[5], cin[5], w5);
	adder a6(s[6], co, x[6], cin[6], w6);
	
endmodule // CPA

module adder4to2(sf1, sf0, x, y, z, w);

    output [6:0] sf1, sf0;
    input  [6:0] x,y,z,w;
    wire   [6:0] cp, sp, cs, ss, s, incpa;
	wire         co;
	
	csa1 c1(sp, cp, x, y, z);
	csa2 c2(ss, cs, w, sp, cp);
	assign incpa[0] = ss[1];
    assign incpa[1] = ss[2];
	assign incpa[2] = ss[3];
	assign incpa[3] = ss[4];
	assign incpa[4] = ss[5];
	assign incpa[5] = ss[6];
	assign incpa[6] = cp[6];
    cpa  cpa0(s, co, cs, incpa);
	assign sf0[0] = ss[0];
    assign sf0[1] = s[0];
	assign sf0[2] = s[1];
	assign sf0[3] = s[2];
	assign sf0[4] = 0;
	assign sf0[5] = 0;
	assign sf0[6] = 0;
	assign sf1[0] = 0;
	assign sf1[1] = 0;
	assign sf1[2] = 0;
	assign sf1[3] = 0;
	assign sf1[4] = s[3];
	assign sf1[5] = s[4];
	assign sf1[6] = 0;
	
endmodule // adder4to2	

module adder4to21(sf, x, y, z, w);

    output [8:0] sf;
    input  [6:0] x,y,z,w;
    wire   [6:0] cp, sp, cs, ss, s, incpa;
	wire         co;
	
	csa1 c1(sp, cp, x, y, z);
	csa2 c2(ss, cs, w, sp, cp);
	assign incpa[0] = ss[1];
    assign incpa[1] = ss[2];
	assign incpa[2] = ss[3];
	assign incpa[3] = ss[4];
	assign incpa[4] = ss[5];
	assign incpa[5] = ss[6];
	assign incpa[6] = cp[6];
    cpa  cpa0(s, co, cs, incpa);
	assign sf[0] = ss[0];
    assign sf[1] = s[0];
	assign sf[2] = s[1];
	assign sf[3] = s[2];
	assign sf[4] = s[3];
	assign sf[5] = s[4];
	assign sf[6] = s[5];
	assign sf[7] = s[6];
	assign sf[8] = co;
	
endmodule // adder4to21

module addertree(u, m, n, o, p, q, r, s, t);	

    output [8:0]  u;
	input  [6:0]  m, n, o, p, q, r, s, t;
	wire   [6:0]  x, y, z, w;
	
	adder4to2  adder0(x, y, m, n, o, p);
	adder4to2  adder1(z, w, q, r, s, t);
	adder4to21 adder2(u, x, y, z, w);
	
endmodule //addertree