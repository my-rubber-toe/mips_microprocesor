`include "addA.v";
`include "addB.v";
`include "alu2.v";
`include "aluCtrl.v";
`include "CU.v";
`include "instructionMem.v";
`include "mux5to1.v";
`include "mux32x1.v";
`include "RAM_ACCESS.v";
`include "RAM.v";
`include "register_file.v";
`include "register.v";
`include "shifterBranch.v";
`include "shifterJmp.v";
`include "signExt.v";


module mips_32( input clk,reset,  
                           output[31:0] pc_out, alu_result
   );  
  reg[31:0] pcIn;  
  wire [31:0] pcout1, pcout2;  
  wire [31:0] instr;  
  wire [31:0] ir;
  wire [4:0] muxAout;
  wire [31:0] signExtOut;
  wire [31:0] regFileOutA;
  wire [31:0] regFileOutB;
  wire [31:0] shifterBranch;
  wire [31:0] shifterJmp;
  wire [4:0] addAout;
  wire [31:0] addBout;
  wire [31:0] muxDout;
  wire [31:0] muxCout;
  //  wire [31:0] muxEout; is the same as pcIn
  wire [31:0] aluOut;
  wire [31:0] marOut;
  wire [31:0] mdrOut;
  wire [31:0] ramOut;
  wire [5:0] aluCtrlOut;

  //Control unit
  wire jmp, branch, mov, moc, irEnable, regDst, regWrite, MAR, MDR, RW, memToReg;
  wire [3:0] aluOp;

  // always @(posedge clk or posedge reset)  
  // begin   
  //       if(reset)   
  //           pc <= 16'd0;  
  //       else  
  //           pc <= pc_next;  
  // end  

  instructionMem instructionMem(ir, irEnable, pcIn);
  muxA mux5x1(muxAout, regDst, ir[20:16], ir[15:11]);
  register_file register_file(regFileOutA, regFileOutB, muxCout, ir[25:21], ir[20:16], muxAout, clk, regWrite);
  signExt signExt(signExtOut, ir[15:0]);
  aluCtrl aluCtrl(aluCtrlOut, aluOp, ir[5:0]);



 endmodule  