// Code your design here
`include "d_flipflop.v"

module SISO(input       in,clk, rst,
             output reg  out        );
  
  wire w1,w2,w3;
  
  /*
  ==================================================================================================
              SISO SHIFT REGISTER — USING 4 D FLIP-FLOPS
  ==================================================================================================

  - A 4-bit SISO shift register can be designed by connecting  four D flip-flops in series.

  - The output of each flip-flop is connected to the D input of the next flip-flop.

  - Serial data enters through the first flip-flop and shifts one stage on every active clock edge.

  - The output of the fourth flip-flop provides the serial output.

  - Therefore: Serial In → DFF1 → DFF2 → DFF3 → DFF4 → Serial Out

  ====================================================================================================
*/
 
  d_ff d1 
  (
    .clk  (clk ),
    .rst  (rst ),
    .din  (in  ),
    .qout (w1 ),
    .qbar (    )
  );

  d_ff d2 
  (
    .clk  (clk ),
    .rst  (rst ),
    .din  (w1  ),
    .qout (w2  ),
    .qbar (    )
  );
  
  d_ff d3 
  (
    .clk  (clk ),
    .rst  (rst ),
    .din  (w2  ),
    .qout (w3  ),
    .qbar (    )
  );
  
  d_ff d4 
  (
    .clk  (clk ),
    .rst  (rst ),
    .din  (w3  ),
    .qout (out ),
    .qbar (    )
  );
  
endmodule
