// Code your design here
`include "mux_2x1.v"

module mux_4x1(input  [3:0] in ,
               input  [1:0] sel,
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
  wire [1:0] w;
  
  mux_2x1 m1 (in[1:0],sel[0],w[0]);
  mux_2x1 m2 (in[3:2],sel[0],w[1]);
  mux_2x1 m3 ( w[1:0],sel[1],out );
                       
endmodule
