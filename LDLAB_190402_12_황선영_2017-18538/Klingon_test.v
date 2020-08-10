`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:22:02 04/02/2019
// Design Name:   Klingon
// Module Name:   /csehome/rachelg98/Klingon/Klingon_test.v
// Project Name:  Klingon
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: Klingon
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Klingon_test;

	// Inputs
	reg [3:0] in;

	// Outputs
	wire [6:0] out;

	// Instantiate the Unit Under Test (UUT)
	Klingon uut (
		.in(in), 
		.out(out)
	);

	initial begin
		// Initialize Inputs
		in = 0;

		// Wait 10 ns for global reset to finish
		#10;
        
		// Add stimulus here

		in = 4'b0001;
		#10;
		
		in = 4'b0010;
		#10;
		
		in = 4'b0011;
		#10;
		
		in = 4'b0100;
		#10;
		
		in = 4'b0101;
		#10;
		
		in = 4'b0110;
		#10;
		
		in = 4'b0111;
		#10;
		
		in = 4'b1000;
		#10;
		
		in = 4'b1001;
		#10;
		
		in = 4'b1011;
		#10;
		
		in = 4'b1100;
		#10;
		
      in = 4'b1101;
		#10;
		
		in = 4'b1110;
		#10;
		
		in = 4'b1111;
		#10;
		

	end
      
endmodule

