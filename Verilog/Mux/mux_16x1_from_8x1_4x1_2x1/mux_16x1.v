// Code your design here
`include "mux_8x1.v"

module mux_16x1(input [15:0] in ,
                input [ 3:0] sel,
                output       out);
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
  
  wire [3:0] x;
  
  // ONE 8x1 mux + TWO 4x1 mux + TWO 2x1 mux = 16x1 mux
  mux_8x1 m8_1 (in[ 7:0] ,sel[2:0],x[0]);
  mux_4x1 m4_1 (in[11:8] ,sel[1:0],x[2]);
  mux_4x1 m4_2 (in[15:12],sel[1:0],x[3]);
  mux_2x1 m2_1 ( x[3:2]  ,sel[2]  ,x[1]);
  mux_2x1 m2_2 ( x[1:0]  ,sel[3]  ,out) ;
                              
endmodule
