`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.01.2016 20:06:49
// Design Name: 
// Module Name: mux1bit4to1
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

	mux1bit2to1 m1 (a[3], a[2], op, y),
	            m2 (a[1], a[0], op, z),
	            m3 (y, z, ~op, out);
endmodule
