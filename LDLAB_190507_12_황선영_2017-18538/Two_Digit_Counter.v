`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:42:56 05/07/2019 
// Design Name: 
// Module Name:    Two_Digit_Counter 
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
module Two_Digit_Counter(
		input clk, rst, toggle,
		output [6:0] seg_1, seg_10 
    );
	
	wire [3:0] bcdout_1, bcdout_10;
	wire clk_1hz; 
	
	frequencyDivider f(.rst(rst), .clkIN(clk), .clkOUT(clk_1hz));
	counter c(.clk(clk_1hz), .rst(rst), .toggle(toggle), .bcd_1(bcdout_1), .bcd_10(bcdout_10));
	bcd_7 b1(.A(bcdout_1), .out(seg_1));
	bcd_7 b10(.A(bcdout_10), .out(seg_10));
endmodule
