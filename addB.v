module addB (output reg [31:0] result, input [31:0] entry1, entry0);
  
  always @(entry1, entry0)
  result = entry0 + entry1 ;
endmodule

// module main ();

//   /////////////////////VARIABLE DECLARATION/////////////////////
  
//   //inputs
//   reg [31:0] in0;
//   reg [31:0] in1;
//   //outputs
//   wire  [31:0] result;

//   // sim time
//   parameter sim_time = 1900;

//   // ALU module initialization
//   addB adder(result, in1, in0);

//   initial #sim_time $finish;
//   /////////////////////VARIABLE DECLARATION/////////////////////



//   /////////////////////SET VALUES TO TEST/////////////////////
//   initial begin
//     in1 = 32'd5; in0 = 32'd7; 
//     #10 $display("");
//   end
//   /////////////////////SET VALUES TO TEST/////////////////////


//   /////////////////////DO THE THING/////////////////////

//   initial begin
//     $display ("time        ins          result");
//     $monitor ("%4d        %d           %d       %d", $time, in1, in0,  result);
//   end
//  /////////////////////DO THE THING/////////////////////

// endmodule