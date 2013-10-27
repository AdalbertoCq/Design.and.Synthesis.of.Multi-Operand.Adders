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


module adder8(s, co, a, b, ci);
   
   output [7:0] s;
   output 	co;
   input [7:0] 	a, b;
   input 	ci;
   
   wire 	c1, c2, c3, c4, c5, c6, c7;
   
   adder a0(s[0], c1, a[0], b[0], ci);
   adder a1(s[1], c2, a[1], b[1], c1);
   adder a2(s[2], c3, a[2], b[2], c2);
   adder a3(s[3], c4, a[3], b[3], c3);
   adder a4(s[4], c5, a[4], b[4], c4);
   adder a5(s[5], c6, a[5], b[5], c5);
   adder a6(s[6], c7, a[6], b[6], c6);
   adder a7(s[7], co, a[7], b[7], c7);
   
   
endmodule // adder8

module cadder(u, m, n, o, p, q, r, s, t);
  
   output [7:0] u;
   input  [7:0] m, n, o, p, q, r, s, t;
   wire   [7:0] w1, w2, w3, w4, w5, w6;
   wire         w, co1, co2, co3,co4, co5, co6, co7;
   
   assign w=0;
   adder8 a0(w1, co1, m, n, w);
   adder8 a1(w2, co2, o, p, w);
   adder8 a2(w3, co3, q, r, w);
   adder8 a3(w4, co4, s, t, w);
   adder8 a4(w5, co5, w1, w2, w);
   adder8 a5(w6, co6, w3, w4, w);
   adder8 a6(u, co7, w5, w6, w);
   
endmodule // cadder
