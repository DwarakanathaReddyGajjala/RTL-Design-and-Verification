// Code your design here
module decoder_2x4(input  [1:0] in,
                   input        en,
                   output [3:0] out);

  /*
  ============================================================
                           DECODER
  ============================================================

  A Decoder is a combinational circuit that converts an n-bit
  binary input into one of 2^n output lines. For each input
  combination, one corresponding output is selected.

  Real-Life Analogies:

  1. Memory Address Selection:
     A memory system may have 16 locations. Instead of using
     16 separate signals to represent the locations, a 4-bit
     address can represent all 16 locations (2^4 = 16).
     A decoder uses the 4-bit address to select one of the
     16 memory locations.

  2. Elevator Floor Selection:
     An elevator can have multiple floors. The selected floor
     number acts as an input to the control system, which
     identifies and selects the corresponding floor.

  ============================================================
*/
  
  //general 2x4 decoder(active high enable) 
  assign out[0] = en ? (~ in[1]) & (~in[0]) : 0;
  assign out[1] = en ? (~ in[1]) & ( in[0]) : 0;
  assign out[2] = en ? (  in[1]) & (~in[0]) : 0;
  assign out[3] = en ? (  in[1]) & ( in[0]) : 0;
  
endmodule
