`timescale 1ns/1ps

//Machine code layout

/*
Jump:	00 [offset 6b]
Load:	01 [rt] [rs] [off] -> rt = rs[off]
Loading to any register should update tb_data of TB wiring (Handled by TA).

Store: 	10 [rs] [rd] [off] -> rd[off] = rs

Arith:	11 [op] [rd] [rs]
	11 00 NOP
	11 01 ADD	rd += rs
	11 10 SUB	rd -= rs
	11 11 NOP
*/


module cpu	//Do not change top module name or ports.
(
	input	clk,
	input	areset,
	output	[7:0] imem_addr,	//Request instruction memory
	input	[7:0] imem_data,	//Returns
	output	[7:0] tb_data		//Testbench wiring.
);

	//Data memory and testbench wiring. you may rename them if you like.
	wire dmem_write;
	wire [7:0] dmem_addr, dmem_write_data, dmem_read_data;
	wire Jump, ALUSrc, RegDst, MemtoReg, RegWrite;
	wire [7:0] MUXtoPC, PC_out, Sign_out;
	wire [7:0] MUXtoAdder, AddertoMUX;
	wire [7:0] RFtoALU, MUXtoALU; 
	wire [7:0] MUXtoRF;
	wire [1:0] MUX2toRF, MUX3toRF, ALUOp;
	
	//Data memory module in tb.v.
	memory dmem(	.clk(clk), .areset(areset),
			.write(dmem_write), .addr(dmem_addr),
			.write_data(dmem_write_data), .read_data(dmem_read_data));

	assign tb_data = dmem_read_data;
	//Testbench wiring end.

	//Write your code here.
	ProgramCounter PC(.CLK(clk), .in(MUXtoPC), .out(PC_out));
	RegisterFile RF(.CLK(clk), .ReadReg1(imem_data[3:2]), .ReadReg2(MUX2toRF), .Write_enable(RegWrite),
			.WriteReg(MUX3toRF), .WriteData(MUXtoRF), .areset(areset), .ReadData1(RFtoALU), .ReadData2(dmem_write_data));
	ControlLogic CL(.Mode(imem_data[7:6]), .OpCode(imem_data[5:4]), .Jump(Jump), .ALUSrc(ALUSrc), 
			.ALUOp(ALUOp), .MemWrite(dmem_write), .RegDst(RegDst), .MemtoReg(MemtoReg), .RegWrite(RegWrite));
	SignExtensionUnit SEU(.in(imem_data[5:0]), .Jump(Jump), .out(Sign_out));
	ALU alu(.opcode(ALUOp), .ain(RFtoALU), .bin(MUXtoALU), .result(dmem_addr));
	EightBitMUX mux1(.control(areset), .in0(AddertoMUX), .in1(8'h00), .out(MUXtoPC));
	TwoBitMUX mux2(.control(dmem_write), .in0(imem_data[1:0]), .in1(imem_data[5:4]), .out(MUX2toRF));
	TwoBitMUX mux3(.control(RegDst), .in0(imem_data[5:4]), .in1(imem_data[3:2]), .out(MUX3toRF));
	EightBitMUX mux4(.control(MemtoReg), .in0(dmem_addr), .in1(dmem_read_data), .out(MUXtoRF));
	EightBitMUX mux5(.control(ALUSrc), .in0(Sign_out), .in1(dmem_write_data), .out(MUXtoALU));
	EightBitMUX mux6(.control(Jump), .in0(8'h01), .in1(Sign_out), .out(MUXtoAdder));
	EightBitAdder adder(.a(PC_out), .b(MUXtoAdder), .s(AddertoMUX));
	
	assign imem_addr = PC_out;
endmodule

module ProgramCounter
(
	 input CLK,
    input [7:0] in,
    output reg [7:0] out
);

		always@(posedge CLK) 
			begin
				out <= in;          
			end
endmodule

module RegisterFile
(
	input CLK,
	input [1:0] ReadReg1,
	input [1:0] ReadReg2,
	input Write_enable,
	input [1:0] WriteReg,
	input [7:0] WriteData, 
	input areset,
	output [7:0] ReadData1,
	output [7:0] ReadData2
);

	reg [7:0] registers [3:0];
	
	initial 
		begin
			registers[0] <= 8'b00000000;
			registers[1] <= 8'b00000000;
			registers[2] <= 8'b00000000;
			registers[3] <= 8'b00000000;		
		end
	
	assign ReadData1 = registers[ReadReg1];
	assign ReadData2 = registers[ReadReg2];
	
	always@(posedge areset or posedge CLK) 
		begin
		if(areset==1'b1) 
			begin
				registers[0] = 8'b00000000;
				registers[1] = 8'b00000000;	
				registers[2] = 8'b00000000;
				registers[3] = 8'b00000000;			
			end
		
		else if(Write_enable==1'b1) 
			begin 
				registers[WriteReg] = WriteData;
			end
		end
endmodule

module ControlLogic
(
	input [1:0] Mode,
	input [1:0] OpCode,
	output reg Jump,
	output reg ALUSrc,
	output reg [1:0] ALUOp,
	output reg MemWrite,
	output reg RegDst,
	output reg MemtoReg,
	output reg RegWrite
);

	initial 
		begin
			{Jump, ALUSrc, ALUOp, MemWrite, RegDst, MemtoReg, RegWrite} = 8'b00000000;
		end
	always@(Mode or OpCode)
		begin
			case({Mode, OpCode})
				4'b1101: //add
					begin
						Jump <= 1'b0;
						ALUSrc <= 1'b0; 
						ALUOp <= 2'b11;
						MemWrite <= 1'b0;
						RegDst <= 1'b1;
						MemtoReg <= 1'b0;
						RegWrite <= 1'b1;
					end
				4'b1110: //sub
					begin
						Jump <= 1'b0;
					   ALUSrc <= 1'b0; 
						ALUOp <= 2'b10;
						MemWrite <= 1'b0;
						RegDst <= 1'b1;
						MemtoReg <= 1'b0;
						RegWrite <= 1'b1;
					end
				4'b01xx: //load
					begin
						Jump <= 1'b0;
						ALUSrc <= 1'b1; 
						ALUOp <= 2'b01;
						MemWrite <= 1'b0;
						RegDst <= 1'b0;
						MemtoReg <= 1'b1;
						RegWrite <= 1'b1;
					end
				4'b10xx: //store
					begin
						Jump <= 1'b0;
						ALUSrc <= 1'b1; 
						ALUOp <= 2'b01;
						MemWrite <= 1'b1;
						RegDst <= 1'b1;
						MemtoReg <= 1'b1;
						RegWrite <= 1'b0;
					end
           4'b00xx: //jump
					begin
						Jump <= 1'b1;
						ALUSrc <= 1'b0;
						ALUOp <= 2'b00;
						MemWrite <= 1'b0;
						RegDst <= 1'b0;
						MemtoReg <= 1'b0;
						RegWrite <= 1'b0;
					end
			endcase
		end
endmodule 

module SignExtensionUnit
(
	input [5:0] in,
	input Jump,
	output reg [7:0] out
);

	always@(*)
		begin
			if(Jump==1'b1)
				begin
					out[5:0] <= in[5:0];
					out[7:6] <= {2{in[5]}};
			end
			else 
				begin 
					out[1:0] <= in[1:0];
					out[7:2] <= {6{in[1]}};
				end
		end
endmodule

module ALU
(
	input [1:0] opcode,
	input [7:0] ain, bin,
	output [7:0] result
);

	wire b_l;
	assign b_l = ~(bin) + 1;
	
	assign result = (opcode==2'b01) ? (ain+bin) :
									(opcode==2'b10) ? (ain-bin) :
									(bin[7]==1) ? (ain - (b_l)) :
																				(ain+bin);
endmodule 

module TwoBitMUX
(		
	input control,
	input [1:0] in0,
	input [1:0] in1,
	output reg [1:0] out 
);

		always@(control or in0 or in1) 
			begin
				if(control==0)
					begin 
						out <= in0;
					end
				else 
					begin
						out <= in1;
					end
			end
endmodule

module EightBitMUX
(		
	input control,
	input [7:0] in0,
	input [7:0] in1,
	output reg [7:0] out 
);

		always@(control or in0 or in1) 
			begin
				if(control==0)
					begin 
						out <= in0;
					end
				else 
					begin
						out <= in1;
					end
			end
endmodule

module EightBitAdder
(
	input [7:0]a,b,
	output [7:0]s
);
	assign s = a+b;
endmodule 