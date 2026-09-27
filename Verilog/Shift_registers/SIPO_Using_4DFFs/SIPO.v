// Code your design here
`include "d_flipflop.v" 

module SIPO(input          serial_in,clk, rst,
            output  [3:0]  parallel_out      );
  /*
  ======================================================================
              SIPO SHIFT REGISTER — USING 4 D FLIP-FLOPS
  ======================================================================

  - A 4-bit SIPO shift register can be designed by connecting
    four D flip-flops in series.

  - The output of each flip-flop provides a parallel output
    of the shift register.

  - Serial data enters through the first flip-flop and shifts
    one stage on every active clock edge.

  - The outputs of all four flip-flops are available
    simultaneously as parallel outputs.

  - Therefore:

        Serial In → DFF1 → DFF2 → DFF3 → DFF4
                      ↓      ↓      ↓      ↓
                     Q3     Q2     Q1     Q0
                         Parallel Out

  ========================================================================
*/
  
  d_ff d1 
  (
    .clk  (clk             ),
    .rst  (rst             ),
    .din  (serial_in       ),
    .qout (parallel_out[3] ),
    .qbar (                )
  );

  d_ff d2
  (
    .clk  (clk             ),
    .rst  (rst             ),
    .din  (parallel_out[3] ),
    .qout (parallel_out[2] ),
    .qbar (                )
  );
  
  d_ff d3
  (
    .clk  (clk             ),
    .rst  (rst             ),
    .din  (parallel_out[2] ),
    .qout (parallel_out[1] ),
    .qbar (                )
  );
   
   d_ff d4
  (
    .clk  (clk             ),
    .rst  (rst             ),
    .din  (parallel_out[1] ),
    .qout (parallel_out[0] ),
    .qbar (                )
  );
  
  
endmodule
