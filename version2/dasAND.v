module AND (output reg result, input J, Z_flag);

  always @(J, Z_flag)
  result = J & Z_flag;
endmodule