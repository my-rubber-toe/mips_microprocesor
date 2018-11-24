`include "dasAddA.v";
`include "dasAddB.v";
`include "dasAluCtrl.v";
`include "dasAlu.v";
`include "dasCU.v";
`include "dasInstructionMem.v";
`include "dasMuxA.v";
`include "dasMuxB.v";
`include "dasMuxC.v";
`include "dasMuxD.v";
`include "dasMuxE.v";
`include "dasMuxF.v";
`include "dasRAM_ACCESS.v";
`include "dasRAM.v";
`include "dasRegister_File.v";
`include "dasRegister.v";
`include "dasShifterBranch.v";
`include "dasShifterJMP.v";
`include "dasSignExt.v";
`include "dasAND.v";

module mips_32( 
  input clk,reset,  
  output[31:0] pc_out, alu_result
   );  
  
  reg[31:0] pcIn;  
  wire [31:0] pcout1, pcout2;  
  wire [31:0] ir;
  wire [4:0] muxAout;
  wire [4:0] muxBout;
  wire [31:0] signExtOut;
  wire [31:0] outA;
  wire [31:0] outB;
  wire [31:0] muxCout;
  wire [4:0] aluCtrlOut;
  wire [31:0] aluOut;
  wire zFlag;
  wire [31:0] RAMout;
  wire [4:0] muxDout;

  wire [31:0] addAout;
  wire [25:0] sifterJMPout;
  wire [31:0] sifterBranchOut;
  wire [31:0] addBout;
  wire [31:0] muxEout;
  wire [31:0] muxFout;
  wire andOut;
  wire [4:0] HI, LO ;


  ////////// STATE FLAGS ////////////
  wire  reg_dst;
  wire reg_write;
  wire alu_src;
  wire [4:0] alu_fnc;
  wire RAMEnable;
  wire RW;
  wire mem_to_reg;
  wire jump;  
  wire branch;  
  wire [1:0] HILO;
  wire MOC;
  wire MOV;






/////////////////////////COMPONENTS////////////////////////////////////

reg [511:0] PC = 512'd0;
intructionMem dasInstructionMem(ir, clk, PC);
cu dasCU( ir[31:26], reset, MOC, reg_dst, mem_to_reg, alu_fnc, MOV, HILO, RAMEnable, jump, branch, RW, alu_src, reg_write);

muxA dasMuxA(muxAout, HILO, ir[25:21], LO, HI);
muxB dasMuxB(muxBout, reg_dst, ir[20:16], ir[15:11]);
registerFile dasRegister_File(outA, outB, muxDout, muxAout, ir[20:16], muxBout, clk);
signExt dasSignExt(signExtOut, ir[15:0]);
aluCtrl dasAluCtrl(aluCtrlOut, alu_fnc, ir[5:0]);
muxC dasMuxC(muxCout, alu_src, outA, signExtOut);
alu dasAlu(aluOut,zFlag, aluCtrlOut,outA, signExtOut);
RAM dasRAM(RAMout, MOC, RAMEnable, MOV, RW, outB, aluOut);
muxC dasMuxC(muxCout,mem_to_reg, aluOut, RAMout);
shifterJmp dasShifterJMP(sifterJMPout,  ir[25:0]),;
addA dasAddA(addAout, pcout2);
shifterBranch dasShifterBranch(sifterBranchOut, signExtOut);
addB dasAddB(addBout, addAout, sifterBranchOut);

theeAnd dasAND(andOut, zFlag, branch);
muxE dasMuxE(muxEout, andOut, addAout, addBout);
muxF dasMuxF(muxFout, jump, muxEout, {sifterBranchOut, addAout[31:28]});









  
 endmodule  