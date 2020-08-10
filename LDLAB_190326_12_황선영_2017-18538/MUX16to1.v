//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:27:30 03/27/2019 
// Design Name: 
// Module Name:    MUX16to1 
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

module MUX16to1(
    input [3:0] In1,
	 input [7:4] In2,
	 input [11:8] In3,
	 input [15:12] In4,
    input [1:0] sel1, //sel1 is sel input for first level mux 
	 input [1:0] sel2, //sel2 is sel input for second level mux
	 //input sel2[0] = sela,
    //input sel2[1] = selb,
    output Y_L
    );
	 
	wire A1, A2, A3, A4, sela_l, selb_l, out1, out2, out3, out4;

//set inputs(wire out1-4) to outputs of previous 4to1 mux, and 16 inputs to inputs of each 4to1 mux

	MUX4to1 U1(.In(In1), .sel(sel1), .Y(A1));
	MUX4to1 U2(.In(In2), .sel(sel1), .Y(A2));
	MUX4to1 U3(.In(In3), .sel(sel1), .Y(A3));
	MUX4to1 U4(.In(In4), .sel(sel1), .Y(A4));
	
	not U5(sela_l, sel2[0]);
	not U6(selb_l, sel2[1]);
	and U7(out1, A1, sela_l, selb_l);
	and U8(out2, A2, selb_l, sel2[0]);
	and U9(out3, A3, sel2[1], sela_l);
	and U10(out4, A4, sel2[1], sel2[0]);
	or U11(Y_L, out1, out2, out3, out4);

endmodule
