//Author: Roberto Y.  Guzmán Ortíz

module ALU32bit(output reg [31:0] result, output reg Z_flag, input [5:0]func, input [31:0] a, b);
  reg [31:0 ]temp1;
  integer index;
  integer counter = 0;
  integer val = 0;

  always @(func,a, b)
    case(func)
      6'd36: // AND 
        begin
          result = a & b;
        end

      6'd37: // OR
        begin
          result = a | b;
        end

      6'd38: // XOR
        begin
          result = a ^ b;
        end

      6'd39: // NOR 
        begin
          result = ~(a | b);
        end

      6'd0: // SLL
        begin
          result = a << 1;
        end

      6'd4: // SLLV
        begin
          result = a << b;
        end

      6'd2: // SRL
        begin
          result = a >> 1;
        end

      6'd6: // SRLV
        begin
          result = a >> b;
        end

      6'd33: // ADDU: sum unsigned
        begin
          result = a + b;
        end

      6'd35: // SUBU: sub unsigned
        begin 
           result = a - b;      
        end

      6'b100000: // ADD: addition signed
        begin
          result = $signed(a) + $signed(b); 
          Z_flag = (result == 0) ? 1 : 0;
        end

      6'd32: // SUB: subtract signed
        begin
          temp1 = (~b  + 1'b1);
          result = $signed(a) + $signed(temp1);
          Z_flag = (result == 0) ? 1 : 0;
        end

      6'd42:
        begin
          // SLT: if result of a < b then return 1 else 0.
          result = ($signed(a) < $signed(b)) ? 1 : 0;
        end

      6'd43:
        begin
          // SLTU: if result of a < b then return 1 else 0.
          result = (a < b) ? 1 : 0;
        end

      6'd56:
         begin
          // CLO: count of leading ones in a, return in "result" the number of leading ones;
          counter = 0;
          index = 31;
          while (a[index] == 1'b1) begin
            counter = counter + 1;
            index = index - 1;
          end
          result = counter;
        end

      6'd7:
        begin
          // CLZ: count of leading zeros in a, return in "result" the number of leading zeros.
          counter = 0;
          index = 31;
          while (a[index] == 1'b0) begin
            counter = counter + 1;
            index = index - 1;
          end
          result = counter;
        end
      
      6'b48:
        begin //SRA
          result = a >>> b;
        end
      
      6'b50:
        begin //BGTZ
          if (a > 32'd0) begin
            Z_flag = 1;
          end else begin
            Z_flag = 0;
          end
         
        end
      
      6'b52:
        begin //B
          Z_flag = 1;
        end
      
      6'b54:
        begin //B
          if (a <= 32'd0) begin
            Z_flag = 1;
          end else begin
            Z_flag = 0;
          end
        
        end
    endcase
endmodule
