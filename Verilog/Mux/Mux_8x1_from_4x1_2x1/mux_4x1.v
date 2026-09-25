// Code your design here
`include "mux_2x1.v"

module mux_4x1(input  [3:0] in ,
               input  [1:0] sel,
               output       out);
  
  wire [1:0] w;
  
  mux_2x1 m1 (in[1:0],sel[0],w[0]);
  mux_2x1 m2 (in[3:2],sel[0],w[1]);
  mux_2x1 m3 ( w[1:0],sel[1],out );
                       
endmodule
