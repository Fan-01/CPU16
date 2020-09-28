`timescale 1ns / 1ps
 
module dataMemory(DAddr, DataIn, DataMemRW, DataOut);
    input [31:0] DAddr, DataIn;
	 input DataMemRW;
	 output reg [31:0] DataOut;
	 reg[31:0] memory[31:0];
	 
	 // read data
	 always @(DataMemRW) begin
	 if (DataMemRW == 0) //assign 
	 DataOut = memory[DAddr];
	 end
	 
	 
	 // write data
	 integer i;
	 initial begin
	  //   for (i = 0; i < 32; i = i+1) memory[i] = 0;
	 end
	 
	 always @(DataMemRW or DAddr or DataIn)
	     begin
		      if (DataMemRW) memory[DAddr] = DataIn;
		  end
 
endmodule
