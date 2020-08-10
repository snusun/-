//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:10:12 03/27/2019 
// Design Name: 
// Module Name:    MUX4to1 
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
`timescale 1ns / 1ps

module MUX4to1(
    input [3:0] In,
    input [1:0]sel, //sel[0] = a, sel[1] = b
	 output Y
    );

	wire a_l, b_l, out1, out2, out3, out4;

	not U1(a_l, sel[0]);
	not U2(b_l, sel[1]);
	and U3(out1, In[0], a_l, b_l);
	and U4(out2, In[1], b_l, sel[0]);
	and U5(out3, In[2], sel[1], a_l);
	and U6(out4, In[3], sel[1], sel[0]);
	or U7(Y, out1, out2, out3, out4);

endmodule
