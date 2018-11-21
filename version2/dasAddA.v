module addA (output reg [31:0] result, input [31:0] pc);
  reg [31:0 ] four = 32'd4;
  always @(pc)
    result = pc + four;
endmodule
