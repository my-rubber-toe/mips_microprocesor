module addB (output reg [31:0] result, input [31:0] entry1, entry0);
  
  always @(entry1, entry0)
  result = entry0 + entry1 ;
endmodule
