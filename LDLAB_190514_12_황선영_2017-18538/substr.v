`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    20:21:07 05/14/2019 
// Design Name: 
// Module Name:    substr 
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
module seq_detector
(
	//Control signals
	input clk,	//Positive edge triggered.
	input areset,	//Reset all in 1

	//Data signals
	input seq,
	output detected
);
	//Declare your variables here.
	/*parameter[1:0] S0 = 2'b00,
										S1 = 2'b01,
										S2 = 2'b10;
	*/
	reg [1:0] state = 2'b00;
	
	always @(posedge clk or posedge areset)
	begin
		//Write your code here.
		if(areset) begin 
			state<=2'b00;
			
		end
		
		else begin
			case(state) 
			2'b00: begin
					if(seq == 0) begin
						state <= 2'b01;
					end	
					else begin
						state <= 2'b00;
					end
			end 
			
			2'b01: begin
					if(seq == 1) begin
						state <= 2'b10;
					end	
					else begin
						state <= 2'b01;
					end
			end 
			
			2'b10: begin
					if(seq == 0) begin
						state <= 2'b01;
					end	
					else begin
						state <= 2'b00;
					end
			end 
			
			default: begin
				state <= 2'b00;
			end
			endcase
		end
	end
	//You may write some wiring code here.
	assign detected = (state==2'b10) & (!seq);
	
endmodule  