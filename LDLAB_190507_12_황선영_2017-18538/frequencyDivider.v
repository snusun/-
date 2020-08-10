`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:34:24 05/07/2019 
// Design Name: 
// Module Name:    frequencyDivider 
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
module frequencyDivider(rst, clkIN, clkOUT);
	
		input rst, clkIN;
		output reg clkOUT;
		
		reg [31:0] count;
		always @(posedge clkIN) begin
				if(rst) begin
						count <= 32'd0;
						clkOUT <= 1'b0;
				end
				else if(count == 32'd25000000) begin
						count <= 32'd0;
						clkOUT <= ~clkOUT;
				end
				else begin
						count <= count +1;
				end
		end

endmodule
