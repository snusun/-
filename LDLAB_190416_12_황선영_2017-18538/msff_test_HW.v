`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   19:41:13 04/16/2019
// Design Name:   msflipflop
// Module Name:   /csehome/rachelg98/gatedrslatch/msff_test_HW.v
// Project Name:  gatedrslatch
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: msflipflop
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module msff_test_HW;

	// Inputs
	reg CLK;
	reg R;
	reg S;

	// Outputs
	wire Q;
	wire Q_L;

	// Instantiate the Unit Under Test (UUT)
	msflipflop uut (
		.CLK(CLK), 
		.R(R), 
		.S(S), 
		.Q(Q), 
		.Q_L(Q_L)
	);

	
	initial begin
		CLK = 0;
		R = 0;
		S = 0;
		#50;
		R = 0;
		S = 1;
		#50;
		CLK = 1;
		#100;
      CLK = 0;
		#50
		R = 0;
		S = 0;
		#50;
		CLK = 1;
		#50;
		R = 1;
		S = 0; 
		#50;
		CLK =0;
		#50;
		R = 0;
		#50;
		CLK = 1;
		S = 1;
		#50;
		S = 0;
		R = 0;
	end
	
	//always
		//#95 CLK = ~CLK;
      
      
endmodule

