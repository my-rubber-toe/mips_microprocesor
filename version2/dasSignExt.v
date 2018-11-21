module signExtender (output reg [31:0] result, input [15:0] ins);

  reg [15:0] tempOnes = 16'b1111111111111111;
  reg [15:0] tempZero = 16'b0000000000000000;

  always @(ins)
  
  if (ins[15] == 0) begin
    result = {tempZero, ins};
  end else begin
    result = {tempOnes, ins};
  end

endmodule