module control( 
  input[5:0] opcode,  
  input reset,  
  output reg reg_dst,mem_to_reg,
  output reg[2:0] alu_op,
  output reg MOV, MOC, MAREnable, MDREanble, jump, branch, RW, alu_src, reg_write                     
   );  

 always @(*)  
 begin  
      if(reset == 1'b1) begin // no Op 
                reg_dst = 0;  
                mem_to_reg = 0;  
                alu_op = 2'b00;  
                jump = 0;  
                branch = 0;  
                mem_read = 0;  
                mem_write = 0;  
                alu_src = 0;  
                reg_write = 0;  
      end  
      else begin  
      case(opcode)   
      6'b000000: begin // ADD, ADDU, SUB, SUBU, SLT, SLTU, AND, OR, NOR, SLL, SLLV, SRL, SRLV, SRA
                reg_dst = 1;  
                mem_to_reg = 0;  
                alu_op = 2'b00;  
                jump = 0;  
                branch = 0;  
                mem_read_write = 0;   
                alu_src = 0;  
                reg_write = 1;   
                end  
      6'b011100: begin // CLO, CLZ
                reg_dst = 1;  
                mem_to_reg = 0;  
                alu_op = 2'b01;  
                jump = 0;  
                branch = 0;  
                mem_read_write = 0;   
                alu_src = 0;  
                reg_write = 1;  
                end  
      6'b000010: begin // JMP 
                reg_dst = 0;  
                mem_to_reg = 0;  
                alu_op = 2'b00;  
                jump = 1;  
                branch = 0;  
                mem_read_write = 0;   
                alu_src = 0;  
                reg_write = 0;  
                end 

      6'b101011: begin // SW 
                reg_dst = 0;  
                mem_to_reg = 1;  
                alu_op = 2'b10;  
                jump = 0;  
                branch = 0;  
                mem_read_write = 0;   
                alu_src = 1;  
                reg_write = 0;  
                end

      6'b100011: begin // LW 
                reg_dst = 0;  
                mem_to_reg = 1;  
                alu_op = 2'b10;  
                jump = 1;  
                branch = 0;  
                mem_read_write = 1;   
                alu_src = 1;  
                reg_write = 0;  
                end

      6'b000100: begin // BEQ
                reg_dst = 0;  
                mem_to_reg = 0;  
                alu_op = 2'b11;  
                jump = 0;  
                branch = 1;  
                mem_read_write = 0;   
                alu_src = 1;  
                reg_write = 0;  
                end

      default: begin  
                reg_dst = 2'b01;  
                mem_to_reg = 2'b00;  
                alu_op = 2'b00;  
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