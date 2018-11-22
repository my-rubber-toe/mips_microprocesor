`include "dasAddA.v";
`include "dasAddB.v";
`include "dasAluCtrl.v";
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
  wire [31:0] sifterBranchout;
  wire [31:0] addBout;
  wire [31:0] muxEout;
  wire [31:0] muxFout;
  wire andOut;


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




  
 endmodule  