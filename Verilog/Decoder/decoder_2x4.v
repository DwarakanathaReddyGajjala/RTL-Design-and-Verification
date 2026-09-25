// Code your design here
module decoder_2x4(input  [1:0] in,
                   input        en,
                   output [3:0] out);
  
  //general 2x4 decoder(active high enable) 
  assign out[0] = en ? (~ in[1]) & (~in[0]) : 0;
  assign out[1] = en ? (~ in[1]) & ( in[0]) : 0;
  assign out[2] = en ? (  in[1]) & (~in[0]) : 0;
  assign out[3] = en ? (  in[1]) & ( in[0]) : 0;
  
endmodule
