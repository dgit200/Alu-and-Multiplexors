`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 29.01.2016 14:12:40
// Design Name: 
// Module Name: ALU1Bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module mux1bit2to1(a, b, op, result);
input a, b, op;
output result;


assign result = (a & (~op)) | (b & op);			//multiplexer logic.

endmodule

module mux4to1(a, op,out);
	input [3:0] a;
	input op;
	output out;

	wire y;
	wire z;

	mux1bit2to1 m1 (a[3],a[2], op, y),
	            m2 (a[1],a[0], op, z),
	            m3 (y, z, ~op, out);
endmodule

module ALU1Bit(a, b, cin, less, cout, result, set, zero, op, g, p);
input a, b, cin, less;
input [1:0] op;
output cout, result, set, zero, g, p;

wire s, t;

mux1bit2to1 m1(a, ~a, op[1], s), 
            m2(b, ~b, op[0], t);

 assign set = s ^ t ^ cin;
 assign cout = (s & t) | (s & cin) | (t & cin);
 
 assign g = s & t;
 assign p = s | t;
 
 wire [3:0] q;
 assign q[0] = g;
 assign q[1] = p;
 assign q[2] = set;
 assign q[3] = less;

 mux4to1 m3(q, op[0],result);

endmodule
