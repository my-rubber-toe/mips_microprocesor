module instructionMem (output reg [7:0] DataOut, input enable, input [7:0] DataIn);

	reg [31:0] Mem[0:127];
	always @(enable, DataIn) //Whenever Enable and/or MOV is active
  if (enable) begin
    
  end
endmodule