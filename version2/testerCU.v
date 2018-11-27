`include "dasCU.v"


module main ();

  /////////////////////VARIABLE DECLARATION/////////////////////
  
  //inputs
  reg[5:0] opcode;
  reg reset, MOC;
  //outputs
  wire reg_dst, mem_to_reg;
  wire [4:0] alu_fnc;
  wire MOV, HILO, RAMEnable, jump, branch, RW, alu_src, reg_write;

  // sim time
  parameter sim_time = 1900;

  // ALU module initialization
  control control(opcode, reset, MOC, reg_dst, mem_to_reg, alu_fnc, MOV, HILO, RAMEnable, jump, branch, RW, alu_src, reg_write);

  initial #sim_time $finish;
  /////////////////////VARIABLE DECLARATION/////////////////////



  /////////////////////SET VALUES TO TEST/////////////////////
  initial begin
    opcode = 6'b001001 ; reset = 1'b1;//ADDUI
    #10 $display("");

    opcode = 6'b001001 ; reset = 1'b0; //ADDUI
    #10 $display("");

    opcode = 6'b100100 ; reset = 0; MOC = 0; //ADDUI
    #10 $display("");

    opcode = 6'b000000 ; reset = 0; MOC = 0; //ADDUI
    #10 $display("");

    opcode = 6'b000111 ; reset = 0; MOC = 0; //ADDUI
    #10 $display("");

    opcode = 6'b000000 ; reset = 0; MOC = 0; //ADDUI
    #10 $display("");

    // opcode = 6'b001001 ; reset = 0; MOC = 0; //ADDUI
    // #10 $display("");

    // opcode = 6'b001001 ; reset = 0; MOC = 0; //ADDUI
    // #10 $display("");

    // opcode = 6'b001001 ; reset = 0; MOC = 0; //ADDUI
    // #10 $display("");

    // opcode = 6'b001001 ; reset = 0; MOC = 0; //ADDUI
    // #10 $display("");

    // opcode = 6'b001001 ; reset = 0; MOC = 0; //ADDUI
    // #10 $display("");

    // opcode = 6'b001001 ; reset = 0; MOC = 0; //ADDUI
    // #10 $display("");

    // opcode = 6'b001001 ; reset = 0; MOC = 0; //ADDUI
    // #10 $display("");

    // opcode = 6'b001001 ; reset = 0; MOC = 0; //ADDUI
    // #10 $display("");

    // opcode = 6'b001001 ; reset = 1; MOC = 0; //RESET
    // #10 $display("");

  end
  /////////////////////SET VALUES TO TEST/////////////////////


  /////////////////////DO THE THING/////////////////////

  initial begin
    $display ("time       reg_dst   mem_to_reg    alu_fnc     MOV     HILO      RAMEnable     jump        branch          RW        alu_src       reg_write");
    $monitor ("%4d        %1b            %1b          %b       %b       %b           %b           %b            %b             %b           %b              %b", $time, reg_dst, mem_to_reg, alu_fnc, MOV, HILO, RAMEnable, jump, branch, RW, alu_src, reg_write);
  end
 /////////////////////DO THE THING/////////////////////

endmodule