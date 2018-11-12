module aluCtrl (output reg [5:0] result, input [1:0] aluOp, input [5:0]funcIn);

  always @(aluOp, funcIn)
    case (aluOp)
      
      2'b00: assign result = funcIn;

      2'b01: //functions for CLO and CLZ
        
        if (funcIn == 6'b100001) begin
          result = 6'b111000;
        end else if (funcIn == 6'b100000) begin
          result = 6'b000111;
        end

      2'b10: //function to do SW and LW
        assign result = 6'b100000;
      
      2'b11:
        assign result = 6'b100010;
        
      default: assign result = funcIn;
    endcase
endmodule

// module main ();

//   /////////////////////VARIABLE DECLARATION/////////////////////
  
//   //inputs
//   reg [2:0] operationCode;
//   reg [5:0] fnc;
//   //outputs
//   wire  [5:0] result;

//   // sim time
//   parameter sim_time = 1900;

//   // ALU module initialization
//   aluCtrl adder(result, operationCode, fnc);

//   initial #sim_time $finish;
//   /////////////////////VARIABLE DECLARATION/////////////////////



//   /////////////////////SET VALUES TO TEST/////////////////////
//   initial begin
//     operationCode = 3'b000; fnc = 6'b101010; 
//     #10 $display("");

//     operationCode = 3'b001; fnc = 6'b101010; 
//     #10 $display("");

//     operationCode = 3'b010; fnc = 6'b101010; 
//     #10 $display("");

//     operationCode = 3'b011; fnc = 6'b101010; 
//     #10 $display("");

//     operationCode = 3'b100; fnc = 6'b101010; 
//     #10 $display("");

//     operationCode = 3'b101; fnc = 6'b101010; 
//     #10 $display("");

//     operationCode = 3'b110; fnc = 6'b101010; 
//     #10 $display("");

//     operationCode = 3'b111; fnc = 6'b101010; 
//     #10 $display("");
    
//   end
//   /////////////////////SET VALUES TO TEST/////////////////////


//   /////////////////////DO THE THING/////////////////////

//   initial begin
//     $display ("time        operation           function         result");
//     $monitor ("%4d        %b          %b       %b", $time, operationCode, fnc,  result);
//   end
//  /////////////////////DO THE THING/////////////////////

// endmodule