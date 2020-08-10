`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:33:18 05/07/2019 
// Design Name: 
// Module Name:    bcd_7 
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
module bcd_7(
    input [3:0] A,
    output [6:0] out
    );

wire [3:0] in;
reg [6:0] B;

assign in = A;
assign out = B;

always @(in)
begin
	case(in)
		4'b0000 : B <= 7'b0111111;
		4'b0001 : B <= 7'b0000110;
		4'b0010 : B <= 7'b1011011;
		4'b0011 : B <= 7'b1001111;
		4'b0100 : B <= 7'b1100110;
		4'b0101 : B <= 7'b1101101;
		4'b0110 : B <= 7'b1111101;
		4'b0111 : B <= 7'b0100111;
		4'b1000 : B <= 7'b1111111;
		4'b1001 : B <= 7'b1101111;
		
		default B <= 7'b0000000;
		endcase
	end
endmodule 