// Code your design here
`include "mux_8x1.v"

module mux_16x1(input [15:0] in ,
                input [ 3:0] sel,
                output       out);
  
  wire [3:0] x;
  
  // ONE 8x1 mux + TWO 4x1 mux + TWO 2x1 mux = 16x1 mux
  mux_8x1 m8_1 (in[ 7:0] ,sel[2:0],x[0]);
  mux_4x1 m4_1 (in[11:8] ,sel[1:0],x[2]);
  mux_4x1 m4_2 (in[15:12],sel[1:0],x[3]);
  mux_2x1 m2_1 ( x[3:2]  ,sel[2]  ,x[1]);
  mux_2x1 m2_2 ( x[1:0]  ,sel[3]  ,out) ;
                              
endmodule
