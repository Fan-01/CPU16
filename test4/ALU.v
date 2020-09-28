`timescale 1ns / 1ps
 
module ALU(ReadData1, ReadData2, inExt, ALUSrcB, ALUOp, zero, result);
    input [31:0] ReadData1, ReadData2, inExt;
	 input ALUSrcB;
	 input [2:0] ALUOp;
	 output zero;
	 output [31:0] result;
	 
	 reg zero;
	 reg [31:0] result;
	 wire [31:0] B;
	 assign B = ALUSrcB? inExt : ReadData2;
	 
	 always @(ReadData1 or ReadData2 or inExt or ALUSrcB or ALUOp or B)
	     begin
		      case(ALUOp)
				    // A + B
					 3'b000: begin
					     result = ReadData1 + B;
						  zero = (result == 0)? 1 : 0;
					 end
					 // A - B
					 3'b001: begin
					     result = ReadData1 - B;
						  zero = (result == 0)? 1 : 0;
					 end
					 // B - A
					 3'b010: begin
					     result = B - ReadData1;
						  zero = (result == 0)? 1 : 0;
					 end
					 // A ¡Å B
					 3'b011: begin
					     result = ReadData1 | B;
						  zero = (result == 0)? 1 : 0;
					 end
					 // A ¡Ä B
					 3'b100: begin
					     result = ReadData1 & B;
						  zero = (result == 0)? 1 : 0;
					 end
					 // /A ¡Ä B
					 3'b101: begin
					     result = (~ReadData1) & B;
						  zero = (result == 0)? 1 : 0;
					 end
					 // A ¨’ B
					 3'b110: begin
					     result = ReadData1 ^ B;
						  zero = (result == 0)? 1 : 0;
					 end
					 // A ¡Ñ B
					 3'b111: begin
					     result = ReadData1 ^~ B;
						  zero = (result == 0)? 1 : 0;
					 end
		      endcase
		  end
endmodule
