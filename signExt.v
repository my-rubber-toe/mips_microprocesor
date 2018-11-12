module signExtender (output reg [31:0] result, input [15:0] ins);

  reg [15:0] tempOnes = 16'b1111111111111111;
  reg [15:0] tempZero = 16'b0000000000000000;

  always @(ins)
  
  if (ins[15] == 0) begin
    result = {tempZero, ins};
  end else begin
    result = {tempOnes, ins};
  end

endmodule

// module main ();

//   /////////////////////VARIABLE DECLARATION/////////////////////
  
//   //inputs
//   reg [15:0] ins;

//   //outputs
//   wire  [31:0] result;

//   // sim time
//   parameter sim_time = 1900;

//   // ALU module initialization
//   signExtender signExt(result, ins);

//   initial #sim_time $finish;
//   /////////////////////VARIABLE DECLARATION/////////////////////



//   /////////////////////SET VALUES TO TEST/////////////////////
//   initial begin
//     ins = 16'b1000000000000000;
//     #10 $display("");

//     ins = 16'b0111111111111111;
//     #10 $display("");
//   end
//   /////////////////////SET VALUES TO TEST/////////////////////


//   /////////////////////DO THE THING/////////////////////

//   initial begin
//     $display ("time        ins          result");
//     $monitor ("%4d        %b           %b  ", $time, ins, result);
//   end
//  /////////////////////DO THE THING/////////////////////

// endmodule