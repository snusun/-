`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:39:29 04/18/2019 
// Design Name: 
// Module Name:    dff 
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
module rslatch(
	input R,
	input S,
	output Q,
	output Q_L
	);
	
	assign #10 Q = ~(Q_L | R);
	assign #10 Q_L = ~(Q | S);
	
endmodule

module dff(
	input D,
	input CLK,
	output Q,
	output Q_L
    );
	 
	 wire [3:0]tmp;
	 
	 assign #10 tmp[0] = ~(tmp[3] | tmp[1]);
	 assign #10 tmp[1] = ~(tmp[0] | CLK);
	 assign #10 tmp[2] = ~(tmp[1] | CLK | tmp[3]);
	 assign #10 tmp[3] = ~(tmp[2] | D);
	 
	 rslatch L_0(.R(tmp[1]), .S(tmp[2]), .Q(Q), .Q_L(Q_L));



endmodule
