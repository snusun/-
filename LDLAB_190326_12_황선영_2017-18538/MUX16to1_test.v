`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   12:53:02 03/27/2019
// Design Name:   MUX16to1
// Module Name:   /csehome/rachelg98/MUX16to1/MUX16to1_test.v
// Project Name:  MUX16to1
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MUX16to1
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module MUX16to1_test;

	// Inputs
	reg [3:0] In1;
	reg [7:4] In2;
	reg [11:8] In3;
	reg [15:12] In4;
	reg [1:0] sel1;
	reg [1:0] sel2;

	// Outputs
	wire Y_L;

	// Instantiate the Unit Under Test (UUT)
	MUX16to1 uut (
		.In1(In1), 
		.In2(In2), 
		.In3(In3), 
		.In4(In4), 
		.sel1(sel1), 
		.sel2(sel2), 
		.Y_L(Y_L)
	);

	initial begin
		// Initialize Inputs
		In1 = 0;
		In2 = 0;
		In3 = 0;
		In4 = 0;
		sel1 = 0;
		sel2 = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		//1st case fixed input 16'b1100001110110100 
		In1 = 4'b1100;
		In2 = 4'b0011;
		In3 = 4'b1011;
		In4 = 4'b0100;
		//manipulate selection lines (16 cases)
		sel2 = 2'b00; //second level select line input
		sel1 = 2'b00;
		#100;
		sel1 = 2'b01;
		#100;	
		sel1 = 2'b10;
		#100;	
		sel1 = 2'b11;
		#100;
				
		sel2 = 2'b01;
		sel1 = 2'b00;
		#100;
		sel1 = 2'b01;
		#100;	
		sel1 = 2'b10;
		#100;	
		sel1 = 2'b11;
		#100;
		
		sel2 = 2'b10;
		sel1 = 2'b00;
		#100;
		sel1 = 2'b01;
		#100;	
		sel1 = 2'b10;
		#100;	
		sel1 = 2'b11;
		#100;
		
		sel2 = 2'b11;
		sel1 = 2'b00;
		#100;
		sel1 = 2'b01;
		#100;	
		sel1 = 2'b10;
		#100;	
		sel1 = 2'b11;
		#100;
		
		//2nd case fixed input 16'b1100111111111111
		In1 = 4'b1100;
		In2 = 4'b1111;
		In3 = 4'b1111;
		In4 = 4'b1111;
		//manipulate selection lines for fixed input (16 cases. total = 32 cases)
		sel2 = 2'b00; //second level select line input
		sel1 = 2'b00;
		#100;
		sel1 = 2'b01;
		#100;	
		sel1 = 2'b10;
		#100;	
		sel1 = 2'b11;
		#100;
				
		sel2 = 2'b01;
		sel1 = 2'b00;
		#100;
		sel1 = 2'b01;
		#100;	
		sel1 = 2'b10;
		#100;	
		sel1 = 2'b11;
		#100;
		
		sel2 = 2'b10;
		sel1 = 2'b00;
		#100;
		sel1 = 2'b01;
		#100;	
		sel1 = 2'b10;
		#100;	
		sel1 = 2'b11;
		#100;
		
		sel2 = 2'b11;
		sel1 = 2'b00;
		#100;
		sel1 = 2'b01;
		#100;	
		sel1 = 2'b10;
		#100;	
		sel1 = 2'b11;
		#100;
		
	end
      
endmodule

