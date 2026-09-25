// Code your design here
`include "mux_4x1.v"

module mux_8x1(input  [7:0] in ,
               input  [2:0] sel,
               output       out);
  wire [5:0] x;

  /*
  ============================================================
                         MULTIPLEXER (MUX)
  ============================================================

  A MUX is a combinational circuit that selects one input from
  multiple inputs and sends the selected input to a single output.
  The selection is controlled by select lines.

  Real-Life Analogies:

  1. TV Input Selection:
     A TV can have multiple input sources such as HDMI 1, HDMI 2,
     USB, and AV. The input selector chooses one source and sends
     it to the TV screen.

  2. Car Audio Source Selection:
     A car audio system can have multiple sources such as FM,
     Bluetooth, USB, and AUX. The source selector chooses one
     source and sends it to the speakers.

  3. Data Source Selection:
     A system may have multiple data sources, such as different
     sensors or modules. A MUX selects one data source and sends
     its data to a common processing unit.

  ============================================================
*/
  
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
