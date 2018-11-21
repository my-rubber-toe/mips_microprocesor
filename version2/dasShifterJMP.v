module shifterJMP (output reg [25:0] result, input [25:0] in);

  always @(in)

  result = in << 2;

endmodule