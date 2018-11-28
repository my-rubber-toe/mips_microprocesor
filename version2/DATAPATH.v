`include "dasAddA.v"
`include "dasAddB.v"
`include "dasAluCtrl.v"
`include "dasAlu.v"
`include "dasCU.v"
`include "dasInstructionMem.v"
`include "dasMuxA.v"
`include "dasMuxB.v"
`include "dasMuxC.v"
`include "dasMuxD.v"
`include "dasMuxE.v"
`include "dasMuxF.v"
`include "dasRAM_ACCESS.v"
<<<<<<< HEAD
`include "RAM.v"
=======
>>>>>>> 24e2dd067389601a6aad6d86df1a4135a3f411cc
`include "dasRegister_File.v"
  `include "dasShifterBranch.v"
`include "dasShifterJMP.v"
`include "dasSignExt.v"
`include "dasAND.v"

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
  wire [5:0] alu_fnc;
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


initial begin
    $monitor("RAM_OUT=%b--PC=%b", RAMout, pc);
    $monitor("memInput=%b, MemReg=%b", MEM_input, MemReg);
    $monitor("IR=%b", ir);
end

instructionMem instructionMem(ir, clk, PC);
control control( ir[31:26], reset, MOC, reg_dst, mem_to_reg, alu_fnc, MOV, HILO, RAMEnable, jump, branch, RW, alu_src, reg_write);

muxA muxA(muxAout, HILO, ir[25:21], LO, HI);
muxB muxB(muxBout, reg_dst, ir[20:16], ir[15:11]);
register_file register_file(outA, outB, muxDout, muxAout, ir[20:16], muxBout, clk);
signExtender signExtender(signExtOut, ir[15:0]);
aluCtrl aluCtrl(aluCtrlOut, alu_fnc, ir[5:0]);
muxC muxC(muxCout, alu_src, outA, signExtOut);
ALU32bit ALU32bit(aluOut,zFlag, aluCtrlOut,outA, signExtOut);
RAM RAM(RAMout, MOC, RAMEnable, MOV, RW, outB, aluOut);
muxD muxD(muxCout,mem_to_reg, aluOut, RAMout);
shifterJMP shifterJMP(sifterJMPout,  ir[25:0]);
addA addA(addAout, pcout2);
shifterBranch shifterBranch(sifterBranchOut, signExtOut);
addB addB(addBout, addAout, sifterBranchOut);

AND AND(andOut, zFlag, branch);
muxE muxE(muxEout, andOut, addAout, addBout);
muxF muxF(muxFout, jump, muxEout, {sifterBranchOut, addAout[31:28]});









  
 endmodule  