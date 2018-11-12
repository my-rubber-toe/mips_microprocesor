module register(Qs, Ds, Ld, CLK);
  output reg [31:0] Qs;
  input [31:0]  Ds;
  input   Ld;
  input   CLK;
  
  initial begin
  	Qs= 32'd0;
  end
  
  always @(Qs, Ld, CLK)
    if(Ld && CLK)
      Qs<=Ds;
  
endmodule //Register