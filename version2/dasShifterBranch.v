module shifterBranch (output reg [31:0] result, input [31:0] in);

  always @(in)

  result = in << 2;

endmodule

// module main ();

//   /////////////////////VARIABLE DECLARATION/////////////////////
  
//   //inputs
//   reg [31:0] ins;

//   //outputs
//   wire  [31:0] result;

//   // sim time
//   parameter sim_time = 1900;

//   // ALU module initialization
//   shifterBranch shift2(result, ins);

//   initial #sim_time $finish;
//   /////////////////////VARIABLE DECLARATION/////////////////////



//   /////////////////////SET VALUES TO TEST/////////////////////
//   initial begin
//     ins = 32'd1;
//     #10 $display("");

//     ins = 32'd10;
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