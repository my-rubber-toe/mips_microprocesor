module muxE (output reg [31:0] result, input s, input [31:0] zero, one);

  always @(s,zero, one)
    if (s == 0) begin
      result = zero;
    end else begin
      result = one;
    end
endmodule