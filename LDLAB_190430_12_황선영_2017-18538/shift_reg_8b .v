`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:27:14 04/30/2019 
// Design Name: 
// Module Name:    shift_reg_8b 
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
module shift_reg_8b(
		input CLRb,
		input [1:0] s,
		input CLK,
		input SDL,
		input SDR,
		input [7:0] D,
		output [7:0] Q
    );

		reg [7:0] Q;
	
		always  @(posedge CLK or negedge CLRb)
					begin
						if(!CLRb) Q <= 8'b00000000;
						else begin
							if(s == 2'b11) Q <= D;
					else if(s == 2'b10) begin
						if(!SDL) Q <= {Q[6], Q[5], Q[4], Q[3], Q[2], Q[1],  Q[0], 1'b0};
						else Q <= {Q[6], Q[5], Q[4], Q[3], Q[2], Q[1],  Q[0], 1'b1};
					end
					
					else if(s == 2'b01) begin
						if(!SDR) Q <= {1'b0 ,Q[7], Q[6], Q[5], Q[4], Q[3], Q[2], Q[1]};
						else Q <= {1'b1 ,Q[7], Q[6], Q[5], Q[4], Q[3], Q[2], Q[1]};
					end
					
					else Q <= Q;
					end
		end	
	
endmodule
