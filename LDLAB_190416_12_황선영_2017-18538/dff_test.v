`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:49:20 04/18/2019
// Design Name:   dff
// Module Name:   /csehome/hwang0515/jkff/dff_test.v
// Project Name:  jkff
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: dff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module dff_test;

	// Inputs
	reg D;
	reg CLK;

	// Outputs
	wire Q;
	wire Q_L;

	// Instantiate the Unit Under Test (UUT)
	dff uut (
		.D(D), 
		.CLK(CLK), 
		.Q(Q), 
		.Q_L(Q_L)
	);

	initial begin
		// Initialize Inputs
		CLK = 0;
		D = 0;
      #500;
		D = 1;
      #500;
		D = 0;
      #500;
		D = 1;
      #500;				

		// Wait 100 ns for global reset to finish
        
		// Add stimulus here

	end

	always 
	#95 CLK = ~CLK;

endmodule 