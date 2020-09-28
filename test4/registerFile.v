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
	 
	 // output����register�仯���仯
     // Data1 ΪALU����ʱ��A����ָ��Ϊsllʱ��A��ֵ����������16λ�л��
     // Data2 λALU�����е�B����ֵʼ����Ϊrt
	 assign Data1 = register[rs];
	 assign Data2 = register[rt];
	 
	 // Write Reg
	 /*
	 always @(negedge clk or RegOut )//or RegWre or ALUM2Reg or writeReg or writeData) 
	 begin
	     if (RegWre && writeReg) 
	     register[writeReg] = writeData;  // ��ֹ����д��0�żĴ���
	 end  
	*/
    always @(posedge clk) begin
   // rd != 0 ��ȷ����żĴ�������ı������
    if (writeReg && RegWre) begin
      register[writeReg] = writeData;
    end
  end
	 
     
	 
	 
 
endmodule
