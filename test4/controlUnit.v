`timescale 1ns / 1ps

module controlUnit(opCode, zero, PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut, ALUOp);
    input [5:0] opCode;
	 input zero;
	 output PCWre, ALUSrcB, ALUM2Reg, RegWre, InsMemRW, DataMemRW, ExtSel, PCSrc, RegOut;
	 output[2:0] ALUOp;
	 
	 assign PCWre = (opCode == 6'b111111)? 0 : 1;
	 assign ALUSrcB = (opCode == 6'b000001 || opCode == 6'b010000 || opCode == 6'b100110 || opCode == 6'b100111)? 1 : 0;
	 assign ALUM2Reg = (opCode == 6'b100111)? 1 : 0;
	 assign RegWre = (opCode == 6'b100110 || opCode == 6'b111111)? 0 : 1;
	 assign InsMemRW = 0;
	 assign DataMemRW = (opCode == 6'b100111)? 0 : 1;
	 assign ExtSel = (opCode == 6'b010000)? 0 : 1;
	 assign PCSrc = (opCode == 6'b110000 && zero == 1)? 1 : 0;
	 assign RegOut = (opCode == 6'b000001 || opCode == 6'b010000 || opCode == 6'b100111)? 0 : 1;
	 assign ALUOp[2] = (opCode == 6'b010001)? 1 : 0;
	 assign ALUOp[1] = (opCode == 6'b010000 || opCode == 6'b010010)? 1 : 0;
	 assign ALUOp[0] = (opCode == 6'b000010 || opCode == 6'b010000 || opCode == 6'b010010 || opCode == 6'b110000)? 1 : 0; 
	 
endmodule