// Adder
module adder(s, co, a, b, ci);

output s, co;
input a, b, ci;
wire o0, o1, o2;
xor(s, a, b, ci);
or(o0, a, b);
or(o1, b, ci);
or(o2, ci, a);
and(co, o0, o1, o2);

endmodule // adder

module csa(s, co, x, y, z);

output [6:0] s;
output [6:0] co;
input [6:0] x;
input [6:0] y;
input [6:0] z;

adder a0(s[0], co[0], x[0], y[0], z[0]);
adder a1(s[1], co[1], x[1], y[1], z[1]);
adder a2(s[2], co[2], x[2], y[2], z[2]);
adder a3(s[3], co[3], x[3], y[3], z[3]);
adder a4(s[4], co[4], x[4], y[4], z[4]);
adder a5(s[5], co[5], x[5], y[5], z[5]);
adder a6(s[6], co[6], x[6], y[6], z[6]);

endmodule // CSA

module csa2(s, co, x, y, z);

output [6:0] s;
output [6:0] co;
input [6:0] x;
input [6:0] y;
input [6:0] z;
wire w;

assign w=0;
adder a0(s[0], co[0], x[0], w, z[0]);
adder a1(s[1], co[1], x[1], y[0], z[1]);
adder a2(s[2], co[2], x[2], y[1], z[2]);
adder a3(s[3], co[3], x[3], y[2], z[3]);
adder a4(s[4], co[4], x[4], y[3], z[4]);
adder a5(s[5], co[5], x[5], y[4], z[5]);
adder a6(s[6], co[6], x[6], y[5], z[6]);

endmodule // CSA

module cpa(s, co, x, cin);

output [6:0] s;
output co;
input [6:0] x;
input [6:0] cin;
wire w, w1, w2, w3, w4, w5, w6;

assign w =0;
adder a0(s[0], w1, x[1], cin[0], w);
adder a1(s[1], w2, x[2], cin[1], w1);
adder a2(s[2], w3, x[3], cin[2], w2);
adder a3(s[3], w4, x[4], cin[3], w3);
adder a4(s[4], w5, x[5], cin[4], w4);
adder a5(s[5], w6, x[6], cin[5], w5);
adder a6(s[6], co, w, cin[6], w6);

endmodule // CPA

module linearadder(u, m, n, o, p, q, r, s, t);

output [8:0] u;
input [6:0] m, n, o, p, q, r, s, t;
wire [6:0] y, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14;
wire co;

csa c0(w1, w2, m, n, o);
csa2 c1(w3, w4, w1, w2, p);
csa2 c2(w5, w6, w3, w4, q);
csa2 c3(w7, w8, w5, w6, r);
csa2 c4(w9, w10, w7, w8, s);
csa2 c5(w11, w12, w9, w10, t);
cpa cp0(y, co, w11, w12);

assign u[0]=w11[0];
assign u[1]=y[0];
assign u[2]=y[1];
assign u[3]=y[2];
assign u[4]=y[3];
assign u[5]=y[4];
assign u[6]=y[5];
assign u[7]=y[6];
assign u[8]=co;

endmodule // linear adder
