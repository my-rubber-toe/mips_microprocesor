`include "dasRAM.v"

module RAM_ACCESS;
  
integer fi, fo, code, i; reg[7:0] data;
reg Enable, ReadWrite; reg[7:0] DataIn;
reg[511:0] Address; wire [7:0] DataOut;
wire MOC, MOV;
  
RAM ram1 (DataOut, MOC, Enable, MOV, ReadWrite, Address, DataIn);
  
initial begin
  fi = $fopen("input_file.txt","r");
  Address = 7'b0000000;
  while (!$feof(fi)) begin
    code = $fscanf(fi, "%d", data);
    ram1.Mem[Address] = data;
    Address = Address + 1;
  end
  $fclose(fi);
end
           
initial begin
  fo = $fopen("memcontext.txt","w");
  Enable = 1'b0; ReadWrite = 1'b1;
  Address = #1 7'b0000000;
  repeat(10) begin
  	#5 Enable = 1'b1;
  	#5 Enable = 1'b0;
  	Address = Address + 1;
  	end
  $finish;
end
always @ (posedge Enable)
begin
  #1
  $fdisplay(fo,"data en %d = %d %4d", Address, DataOut, $time);
end
endmodule
                                                                          