`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:17:53 04/02/2019 
// Design Name: 
// Module Name:    Klingon 
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
module Klingon(
    input [3:0] in,
    output [6:0] out
    );

wire [3:0] A;
reg [6:0] B;

assign A = in;
assign out = B;

always @(A)
begin
	case(A)
		4'b0000 : B <= 7'b1111110;
		4'b0001 : B <= 7'b1000000;
		4'b0010 : B <= 7'b1000001;
		4'b0011 : B <= 7'b1001001;
		4'b0100 : B <= 7'b0100011;
		4'b0101 : B <= 7'b0011101;
		4'b0110 : B <= 7'b0100101;
		4'b0111 : B <= 7'b0010011;
		4'b1000 : B <= 7'b0110110;
		4'b1001 : B <= 7'b0110111;
		default : B <= 7'b0000000;
		endcase
	end
endmodule
