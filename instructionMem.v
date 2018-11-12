module instructionMem (output reg [31:0] Instruction, input Enable, input [512:0] PC);

	reg [31:0] Mem[0:127];
	always @(Enable) //Whenever Enable and/or MOV is active
	if(Enable)
        Instruction = Mem[PC];
endmodule