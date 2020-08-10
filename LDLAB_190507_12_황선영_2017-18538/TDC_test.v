`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:22:49 05/07/2019
// Design Name:   Two_Digit_Counter
// Module Name:   /csehome/rachelg98/TDC/TDC_test.v
// Project Name:  TDC
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Two_Digit_Counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module TDC_test;

	// Inputs
	reg clk;
	reg rst;

	// Outputs
	wire [6:0] seg_1;
	wire [6:0] seg_10;

	// Instantiate the Unit Under Test (UUT)
	Two_Digit_Counter uut (
		.clk(clk), 
		.rst(rst), 
		.seg_1(seg_1), 
		.seg_10(seg_10)
	);

	initial begin
		rst = 1;	clk =0;
		#100
		rst=0;
		end
		always 
		 #10 clk = ~clk;
      
		// Add stimulus here


      
endmodule

