module addA (output reg [31:0] result, input [31:0] pc);
  reg [31:0 ] four = 32'd4;
  always @(pc)
    result = pc + four;
endmodule

// module main ();

//   /////////////////////VARIABLE DECLARATION/////////////////////
  
//   //inputs
//   reg [31:0] in0;
//   // reg [31:0] in1;
//   //outputs
//   wire  [31:0] result;

//   // sim time
//   parameter sim_time = 1900;

//   // ALU module initialization
//   addA adder(result, in0);

//   initial #sim_time $finish;
//   /////////////////////VARIABLE DECLARATION/////////////////////



//   /////////////////////SET VALUES TO TEST/////////////////////
//   initial begin
//     in0 = 32'd6; 
//     #10 $display("");
//   end
//   /////////////////////SET VALUES TO TEST/////////////////////


//   /////////////////////DO THE THING/////////////////////

//   initial begin
//     $display ("time         ins         result");
//     $monitor ("%4d  %d  %d", $time, in0,  result);
//   end
//  /////////////////////DO THE THING/////////////////////

// endmodule