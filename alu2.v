//Author: Roberto Y.  Guzmán Ortíz

module ALU32bit(output reg [31:0] result, output reg Z_flag, input [5:0]func, input [31:0] a, b);
  reg [31:0 ]temp1;
  integer index;
  integer counter = 0;
  integer val = 0;

  always @(func,a, b)
    case(func)
      6'b100100: // AND 
        begin
          result = a & b;
        end

      6'b100101: // OR
        begin
          result = a | b;
        end

      6'b100110: // XOR
        begin
          result = a ^ b;
        end

      6'b100111: // NOR 
        begin
          result = ~(a | b);
        end

      6'b000000: // SLL
        begin
          result = a << 1;
        end

      6'b000100: // SLLV
        begin
          result = a << b;
        end

      6'b000010: // SRL
        begin
          result = a >> 1;
        end

      6'b000110: // SRLV
        begin
          result = a >> b;
        end

      6'b100001: // ADDU: sum unsigned
        begin
          result = a + b;
        end

      6'b100011: // SUBU: sub unsigned
        begin 
           result = a - b;      
        end

      6'b100000: // ADD: addition signed
        begin
          result = $signed(a) + $signed(b); 
          Z_flag = (result == 0) ? 1 : 0;
        end

      6'b100010: // SUB: subtract signed
        begin
          temp1 = (~b  + 1'b1);
          result = $signed(a) + $signed(temp1);
          Z_flag = (result == 0) ? 1 : 0;
        end
      6'b101010:
        begin
          // SLT: if result of a < b then return 1 else 0.
          result = ($signed(a) < $signed(b)) ? 1 : 0;
        end

      6'b101011:
        begin
          // SLTU: if result of a < b then return 1 else 0.
          result = (a < b) ? 1 : 0;
        end

      6'b111000:
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

      6'b000111:
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
      
      6'b110000:
        begin //SRA
          result = a >>> b;
        end
    endcase
endmodule
