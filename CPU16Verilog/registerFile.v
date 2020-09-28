`timescale 1ns / 1ps
 
module registerFile(clk, RegWre, RegOut, rs, rt, rd, ALUM2Reg, dataFromALU, dataFromRW, Data1, Data2);
    input clk, RegOut, RegWre, ALUM2Reg;
	 input [4:0] rs, rt, rd;
	 input [31:0] dataFromALU, dataFromRW;
	 output [31:0] Data1, Data2;
	 
	 
	 wire [4:0] writeReg;
	 wire [31:0] writeData;
	 assign writeReg = RegOut? rd : rt;
	 assign writeData = ALUM2Reg? dataFromRW : dataFromALU;
	 
	 reg [31:0] register[0:31];
	 integer i;
	 initial begin
	     register[0] = 0;
	 end
	 
	 // output：随register变化而变化
     // Data1 为ALU运算时的A，当指令为sll时，A的值从立即数的16位中获得
     // Data2 位ALU运算中的B，其值始终是为rt
	 assign Data1 = register[rs];
	 assign Data2 = register[rt];
	 
	 // Write Reg
	 /*
	 always @(negedge clk or RegOut )//or RegWre or ALUM2Reg or writeReg or writeData) 
	 begin
	     if (RegWre && writeReg) 
	     register[writeReg] = writeData;  // 防止数据写入0号寄存器
	 end  
	*/
    always @(posedge clk) begin
   // rd != 0 是确保零号寄存器不会改变的作用
    if (writeReg && RegWre) begin
      register[writeReg] = writeData;
    end
  end
	 
     
	 
	 
 
endmodule
