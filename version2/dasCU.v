module control( 
  input[5:0] opcode,  
  input reset,  
  output reg reg_dst, mem_to_reg,
  output reg[4:0] alu_fnc,
  output reg MOV, MOC, HILO, RAMEnable, jump, branch, RW, alu_src, reg_write                     
   );  

 always @(*)  
 begin  
      if(reset == 1'b1) begin // no Op 
                reg_dst = 0;
                reg_write = 0;
                alu_src = 0;
                alu_fnc = 5'b00000;
                RAMEnable = 0;
                RW = 0;
                mem_to_reg = 0;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
      end  
      else begin  
      case(opcode)   
      6'b000000: begin // ADD, ADDU, SUB, SUBU, SLT, SLTU, AND, OR, NOR, SLL, SLLV, SRL, SRLV, SRA, 
                reg_dst = 1;
                reg_write = 1;
                alu_src = 0;
                alu_fnc = 5'b00000;
                RAMEnable = 0;
                RW = 0;
                mem_to_reg = 0;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end  
      6'b011100: begin // CLO, CLZ
                reg_dst = 1;
                reg_write = 1;
                alu_src = 0;
                alu_fnc = 5'b00001;
                RAMEnable = 0;
                RW = 0;
                mem_to_reg = 0;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end  
      6'b000010: begin // JMP 
                reg_dst = 0;
                reg_write = 0;
                alu_src = 0;
                alu_fnc = 5'b00000;
                RAMEnable = 0;
                RW = 0;
                mem_to_reg = 0;
                jump = 1;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end 

      6'b101011: begin // SW
                reg_dst = 0;
                reg_write = 1;
                alu_src = 1;
                alu_fnc = 5'b01101;
                RAMEnable = 1;
                RW = 0;
                mem_to_reg = 1;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

      6'b101001: begin // SH 
                reg_dst = 0;
                reg_write = 1;
                alu_src = 1;
                alu_fnc = 5'b01110;
                RAMEnable = 1;
                RW = 0;
                mem_to_reg = 1;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

      6'b101000: begin // SB
                reg_dst = 0;
                reg_write = 1;
                alu_src = 1;
                alu_fnc = 5'b01111;
                RAMEnable = 1;
                RW = 0;
                mem_to_reg = 1;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end
      
      6'b100011: begin // LW 
                reg_dst = 0;
                reg_write = 0;
                alu_src = 1;
                alu_fnc = 5'b01000;
                RAMEnable = 1;
                RW = 1;
                mem_to_reg = 1;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

        6'b100011: begin // LH 
                reg_dst = 0;
                reg_write = 0;
                alu_src = 1;
                alu_fnc = 5'b01000;
                RAMEnable = 1;
                RW = 1;
                mem_to_reg = 1;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

        6'b100101: begin // LHU
                reg_dst = 0;
                reg_write = 0;
                alu_src = 1;
                alu_fnc = 5'b01001;
                RAMEnable = 1;
                RW = 1;
                mem_to_reg = 1;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

        6'b100000: begin // LB
                reg_dst = 0;
                reg_write = 0;
                alu_src = 1;
                alu_fnc = 5'b01010;
                RAMEnable = 1;
                RW = 1;
                mem_to_reg = 1;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

      6'b000100: begin // B
                reg_dst = 0;
                reg_write = 0;
                alu_src = 1;
                alu_fnc = 5'b10000;
                RAMEnable = 0;
                RW = 0;
                mem_to_reg = 0;
                jump = 0;  
                branch = 0;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

      6'b000110: begin // BLEZ
                reg_dst = 0;
                reg_write = 0;
                alu_src = 1;
                alu_fnc = 5'b10110;
                RAMEnable = 0;
                RW = 0;
                mem_to_reg = 0;
                jump = 0;  
                branch = 1;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

        6'b000111: begin // BGTZ
                reg_dst = 0;
                reg_write = 0;
                alu_src = 1;
                alu_fnc = 5'b10101;
                RAMEnable = 0;
                RW = 0;
                mem_to_reg = 0;
                jump = 0;  
                branch = 1;  
                HILO = 2'b00;
                MOC = ??
                MOV = ??
                end

      default: begin  
                reg_dst = 2'b01;  
                mem_to_reg = 2'b00;  
                alu_fnc = 2'b00;  
                jump = 1'b0;  
                branch = 1'b0;  
                mem_read = 1'b0;  
                mem_write = 1'b0;  
                alu_src = 1'b0;  
                reg_write = 1'b1;  
                sign_or_zero = 1'b1;  
                end  
      endcase  
      end  
 end  
 endmodule  