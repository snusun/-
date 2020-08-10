`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:16:41 04/18/2019
// Design Name:   jkff
// Module Name:   /csehome/hwang0515/jkff/jkff_test.v
// Project Name:  jkff
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: jkff
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module jkff_test;

	// Inputs
	reg J;
	reg CLK;
	reg K;

	// Outputs
	wire Q;
	wire Q_L;

	// Instantiate the Unit Under Test (UUT)
	jkff uut (
		.J(J), 
		.CLK(CLK), 
		.K(K), 
		.Q(Q), 
		.Q_L(Q_L)
	);

	initial begin
		// Initialize Inputs
		CLK = 1;
		J = 0;
		K = 1;
		force Q = 0;
		#15;
		release Q;
		#235;
		J = 1;
		K = 0;
		#250;
		J = 0;
		K = 0;
		#250;		
		J = 1;
		K = 1;
	
	end
	
	always 
		#47.5 CLK = ~CLK;
      
endmodule

