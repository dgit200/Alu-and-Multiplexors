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


module mux2to1(a,b,sel,out);
	input a,b,sel;
	output out;
	tri out;
	bufif1 (out,a,sel);
	bufif0 (out,b,sel);
endmodule

module mux4to1(a,sel,out);
	input [3:0] a;
	input [1:0] sel;
	output out;

	wire mux[2:0];

	mux2to1 m1 (a[3],a[2],sel[0],mux_1),
	        m2 (a[1],a[0],sel[0],mux_2),
	        m3 (mux_1,mux_2,sel[1],out);
endmodule
