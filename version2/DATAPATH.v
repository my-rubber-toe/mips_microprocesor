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




  
 endmodule  