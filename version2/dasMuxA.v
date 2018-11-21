module muxA (output reg [4:0] result, input [1:0] s, input [4:0] zero, one, two);

  always @(s,zero, one, two)
  case (s)
    2'b00: result = zero;
    2'b01: result =  one;
    2'b10: result = two;
    
    default: result = zero;
  endcase
endmodule