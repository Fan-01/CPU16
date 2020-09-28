`timescale 1ns / 1ps
 
module instructionMemory(
    input [31:0] pc,
    input InsMemRW,
	 output [5:0] op, 
	 output [4:0] rs, rt, rd,
	 output [15:0] immediate);
	 
	 wire [31:0] mem[0:15];
	 
	 assign mem[0] = 32'h00000000;
    // addi  $1,$0,8
	 assign mem[1] = 32'h04010008;
	 // ori  $2,$0,12
	 assign mem[2] = 32'h4002000C;
	 // add  $3,$1,$2
	 assign mem[3] = 32'h00221800;
	 // sub  $4,$2,$1
	 assign mem[4] = 32'h08412000;
	 // and  $5,$1,$2
	 assign mem[5] = 32'h44222800;
	 // or  $6,$1,$2
	 assign mem[6] = 32'h48223000;
	 // beq  $1,$2,4 (ת030)
	 assign mem[7] = 32'hC0220004;
	 // move  $7,$1
	 assign mem[8] = 32'h80203800;
	 // sw  $1,1($7)
	 assign mem[9] = 32'h98E10001;
	 // lw  $2,0($1)
	 assign mem[10] = 32'h9C220000;
	 // beq $2,$7,-5 (ת01C)
	 assign mem[11] = 32'hC047FFFB;
	 // halt
	 assign mem[12] = 32'hFC000000;
	 
	 assign mem[13] = 32'h00000000;
	 assign mem[14] = 32'h00000000;
	 assign mem[15] = 32'h00000000;
	 
	 // output
	 assign op = mem[pc[5:2]][31:26];
	 assign rs = mem[pc[5:2]][25:21];
	 assign rt = mem[pc[5:2]][20:16];
	 assign rd = mem[pc[5:2]][15:11];
	 assign immediate = mem[pc[5:2]][15:0];
 
endmodule
