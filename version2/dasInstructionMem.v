module instructionMem (output reg [32:0] Instruction, input Enable, input [511:0] PC);

	reg [7:0] Mem[0:511];

	always @(Enable) //Whenever Enable and/or MOV is active
	if(Enable)
        Instruction = {Mem[PC], Mem[PC+1], Mem[PC+2], Mem[PC=3]};
endmodule