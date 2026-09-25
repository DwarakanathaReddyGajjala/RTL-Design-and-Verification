// Code your design here
`include "mux_4x1.v"

module mux_8x1(input  [7:0] in ,
               input  [2:0] sel,
               output       out);
  wire [5:0] x;
  
//   // two 4x1 mux + one 2x1 mux = 8x1 mux
//   mux_4x1 m4_1 (in[3:0],sel[1:0],x[0]);
//   mux_4x1 m4_2 (in[7:4],sel[1:0],x[1]);
//   mux_2x1 m2_1 ( x[1:0],sel[2]  ,out );
  
  
  
//   // Four 2x1 mux+ one 4x1 mux  = 8x1 mux
//   mux_2x1 m2_1 (in[1:0],sel[0]  ,x[0]);
//   mux_2x1 m2_2 (in[3:2],sel[0]  ,x[1]);
//   mux_2x1 m2_3 (in[5:4],sel[0]  ,x[2]);
//   mux_2x1 m2_4 (in[7:6],sel[0]  ,x[3]);
//   mux_4x1 m4_1 ( x[3:0],sel[2:1],out) ;

  
  // Seven 2x1 mux = 8x1 mux
  mux_2x1 m2_1 (in[1:0],sel[0]  ,x[0]);
  mux_2x1 m2_2 (in[3:2],sel[0]  ,x[1]);
  mux_2x1 m2_3 (in[5:4],sel[0]  ,x[2]);
  mux_2x1 m2_4 (in[7:6],sel[0]  ,x[3]);
  mux_2x1 m2_5 ( x[1:0],sel[1]  ,x[4]);
  mux_2x1 m2_6 ( x[3:2],sel[1]  ,x[5]);
  mux_2x1 m2_7 ( x[5:4],sel[2]  ,out);



                                
endmodule
