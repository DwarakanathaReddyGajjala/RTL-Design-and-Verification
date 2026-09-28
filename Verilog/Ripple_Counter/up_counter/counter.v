// Code your design here
 
`include "t_flipflop.v"
module counter(input            i_clock, i_reset,
               output reg [3:0] o_count         );
  
  /*
  ============================================================
       4-BIT ASYNCHRONOUS UP COUNTER — USING 4 T FLIP-FLOPS
       NEGATIVE-EDGE CLOCK — ACTIVE-HIGH RESET
  ============================================================

  - A 4-bit asynchronous up counter can be designed using
    four T flip-flops.

  - The first T flip-flop is driven by the external clock.

  - The output of each flip-flop is used as the clock for
    the next flip-flop.

  - Therefore, the flip-flops do not receive the same clock
    directly.

  - Each T flip-flop toggles when its clock receives the
    active edge.

  - When reset is HIGH, all flip-flops are reset to 0.

  - When reset is LOW, the counter counts upward from 0 to 15.

  - The counter then rolls over to 0.

  - Therefore:

        Clock → TFF0 → TFF1 → TFF2 → TFF3

        TFFs + Ripple Clocking + Reset → Asynchronous Counter

  ============================================================
*/
  
  t_ff t1 (1'b1,i_clock   ,i_reset ,o_count[0]);
  t_ff t2 (1'b1,o_count[0],i_reset,o_count[1]);
  t_ff t3 (1'b1,o_count[1],i_reset,o_count[2]);
  t_ff t4 (1'b1,o_count[2],i_reset,o_count[3]);

endmodule
