module RAM (output reg [31:0] DataOut, output reg MOC, input Enable, MOV, RW, input [7:0] Address, input [31:0] DataIn);

<<<<<<< HEAD
	reg [31:0] Mem[0:127];
=======
	reg [7:0] Mem[511:0];
>>>>>>> 4cee2538767d5c5ff4ca6cb24835663df084c61b
	always @(Enable, MOV) //Whenever Enable and/or MOV is active
	if(Enable)
		if(MOV) //If MOV=1, proceed with ReadWrite
          if(RW) //Read Operation (1)
			begin
				DataOut = Mem[Address];
				#1 MOC = 1'b1;
				#1 MOC = 1'b0;
			end
		  else //Write Operation (0)
			begin
				Mem[Address] = DataIn;
				#1 MOC = 1'b1;
				#1 MOC = 1'b0;
			end
endmodule