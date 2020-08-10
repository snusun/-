`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:19:21 04/09/2019 
// Design Name: 
// Module Name:    alu 
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
module alu
(
	input [1:0] mode, opcode,
	input ain, bin,
	output result, cout
);
	
	wire [1:0] mode_l, opcode_l;
   wire xor_l, xnor_l;
	reg c_l, r_l;
	
	assign mode_l  = mode;
	assign opcode_l = opcode;
	assign cout = c_l;
	assign result = r_l;
	
	xor U1(xor_l, ain, bin);
	xnor U2(xnor_l, ain, bin);
	
	always @(*)
	begin
			case({mode_l, opcode_l})
				4'b0000 : {c_l, r_l} <= {1'bx, ain};
				4'b0001 : {c_l, r_l} <= {1'bx, ~ain};
				4'b0010 : {c_l, r_l} <= {1'bx, xor_l};
				4'b0011 : {c_l, r_l} <= {1'bx, xnor_l};
				4'b0100 : {c_l, r_l} <= {0, ain};
				4'b0101 : {c_l, r_l} <= ~{0, ain};
				4'b0110 : {c_l, r_l} <= ain+bin;
				4'b0111 : {c_l, r_l} <= ~ain+bin;
				4'b1000 : {c_l, r_l} <= ain+1;
				4'b1001 : {c_l, r_l} <= (~{0,ain})+1;
				4'b1010 : {c_l, r_l} <= ain+bin+1;
				4'b1011 : {c_l, r_l} <= bin+((~{0,ain})+1);
				4'b11xx : {c_l, r_l} <= {1'bx, 1'bx};
			endcase
	end

endmodule
