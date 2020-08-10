`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:11:37 05/07/2019 
// Design Name: 
// Module Name:    counter 
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
module counter( clk, rst, toggle, bcd_1, bcd_10);
		input clk;
		input rst;
		input toggle;
		output reg [3:0] bcd_1, bcd_10;

 
  reg A;
 
 always@(posedge clk or posedge rst)
		begin
				if(rst) begin
						bcd_1 <= 4'b0000;
						bcd_10 <= 4'b0000;
				end

				else begin
					if(toggle) begin 
						A <= ~A;
					end
					else begin
					if(A) begin
							case(bcd_1)
							4'b0000: bcd_1 <= 4'b1001;
							4'b0001: bcd_1 <= 4'b0000;
							4'b0010: bcd_1 <= 4'b0001;
							4'b0011: bcd_1 <= 4'b0010;
							4'b0100: bcd_1 <= 4'b0011;
							4'b0101: bcd_1 <= 4'b0100;
							4'b0110: bcd_1 <= 4'b0101;
							4'b0111: bcd_1 <= 4'b0110;
							4'b1000: bcd_1 <= 4'b0111;
							4'b1001: bcd_1 <= 4'b1000;
						endcase
						
						if(bcd_1==4'b0000) begin
							case(bcd_10)
							4'b0000: bcd_10 <= 4'b1001;
							4'b0001: bcd_10 <= 4'b0000;
							4'b0010: bcd_10 <= 4'b0001;
							4'b0011: bcd_10 <= 4'b0010;
							4'b0100: bcd_10 <= 4'b0011;
							4'b0101: bcd_10 <= 4'b0100;
							4'b0110: bcd_10 <= 4'b0101;
							4'b0111: bcd_10 <= 4'b0110;
							4'b1000: bcd_10 <= 4'b0111;
							4'b1001: bcd_10 <= 4'b1000;
							endcase
						end
					end
					else begin
						case(bcd_1)
							4'b0000: bcd_1 <= 4'b0001;
							4'b0001: bcd_1 <= 4'b0010;
							4'b0010: bcd_1 <= 4'b0011;
							4'b0011: bcd_1 <= 4'b0100;
							4'b0100: bcd_1 <= 4'b0101;
							4'b0101: bcd_1 <= 4'b0110;
							4'b0110: bcd_1 <= 4'b0111;
							4'b0111: bcd_1 <= 4'b1000;
							4'b1000: bcd_1 <= 4'b1001;
							4'b1001: bcd_1 <= 4'b0000;
						endcase
						
						if(bcd_1==4'b1001) begin
							case(bcd_10)
							4'b0000: bcd_10 <= 4'b0001;
							4'b0001: bcd_10 <= 4'b0010;
							4'b0010: bcd_10 <= 4'b0011;
							4'b0011: bcd_10 <= 4'b0100;
							4'b0100: bcd_10 <= 4'b0101;
							4'b0101: bcd_10 <= 4'b0110;
							4'b0110: bcd_10 <= 4'b0111;
							4'b0111: bcd_10 <= 4'b1000;
							4'b1000: bcd_10 <= 4'b1001;
							4'b1001: bcd_10 <= 4'b0000;
							endcase
						end
					end
				end
				end
		end

endmodule
