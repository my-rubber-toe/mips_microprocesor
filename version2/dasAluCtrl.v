module aluCtrl (output reg [5:0] result, input [4:0] aluOp, input [5:0]funcIn);

  always @(aluOp, funcIn)
  case (aluOp)
    5'b00000: assign result = funcIn;

      ///////////////////////EXCEPTIONS///////////////////////////////////
      5'b00001: //functions for CLO and CLZ
        
        if (funcIn == 6'b100001) begin
          result = 6'b111000;
        end else if (funcIn == 6'b100000) begin
          result = 6'b000111;
        end
      ///////////////////////EXCEPTIONS///////////////////////////////////

      ///////////////////////IMMEDIATES///////////////////////////////////
      5'b00010: // ADDI and ADDIU
        assign result = 6'b100000; // simply use ADD function regardless of result
      
      5'b00011: // SLTI and SLTIU
        assign result = 6'b100000; // (rs < imm16) ? rt = 1 : rt = 0; ...  for comparison operation, subtract values
      
      5'b00100: // ANDI
        assign result = 6'b100100; // use AND function
      
      5'b00101: // ORI
        assign result = 6'b100101; // use OR function
      
      5'b00110: // XORI
        assign result = 6'b100110; // use XOR function
      
      // 5'000111: // LUI, primeros rt[31:16] = imm16 ..... rt[15:0] = 0
      //   assign result = 6'b100110; // use LUI function
      ///////////////////////IMMEDIATES///////////////////////////////////

      ///////////////////////STORE AND LOADS///////////////////////////////////

      5'b01000: // LW
        assign result = 6'b100000; // load value in memory [rs + imm16]
      
      // 5'b01000: // LH
      //   assign result = 6'b100000; // load half word with sign extention in memory [rs + imm16]
      
      5'b01001: // LHU
        assign result = 6'b100000; // load half word with NO sign extention in memory [rs + imm16]
      
      5'b01010: // LB
        assign result = 6'b100000; // load byte in memory with sign extended [rs + imm16]
      5'b01011: // LBU
        assign result = 6'b100000; // load byte in memory NO sign extended [rs + imm16]

      5'b01100: // SD 
        assign result = 6'b100000; // STORE double word in memory [rs + imm16]
      
      5'b01101: // SW
        assign result = 6'b100000; // STORE word in memory [rs + imm16]
      
      5'b01110: // SH
        assign result = 6'b100000; // STORE half word in memory [rs + imm16]

      5'b01111: // SB
        assign result = 6'b100000; // STORE byte in memory [rs + imm16]
      
      5'b10000: // B
        assign result = 6'd52; // BRANCH
      
      // 5'b10001: // BAL
      //   assign result = 6'b100000; // 

      // 5'b10010: // BEQ
      //   assign result = 6'b100000; // 

      // 5'b10011: // BGEZ
      //   assign result = 6'b100000; // 

      // 5'b10100: // BGEZAL
      //   assign result = 6'b100000; // 

      5'b10101: // BGTZ
        assign result = 6'd50; // 

      5'b10110: // BLEZ
        assign result = 6'd54; // 
      
      5'b10111: // BLTZ
        // assign result = 6'b100000; // 
    default: 
      assign result = funcIn;
  endcase
endmodule
