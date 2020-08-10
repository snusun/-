`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:04:27 04/18/2019 
// Design Name: 
// Module Name:    jkff 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module latch(
	input R,
	input S,
	output Q,
	output Q_L
	);
	
	assign #5 Q = ~(Q_L & R);
	assign #5 Q_L = ~(Q & S);
	
endmodule

module jkff(
	input J,
	input CLK,
	input K,
	output Q,
	output Q_L
    );
	 
	 wire [1:0]tmp;
	 
	 assign #5 tmp[0] = ~(Q_L & J & CLK);
	 assign #5 tmp[1] = ~(Q & K & CLK);
	 
	 latch L_0(.R(tmp[0]), .S(tmp[1]), .Q(Q), .Q_L(Q_L));

endmodule
