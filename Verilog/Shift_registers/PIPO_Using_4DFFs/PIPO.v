// Code your design here 
`include "d_flipflop.v"

module PIPO(input   [3:0]  parallel_in ,
            input          clk, rst    ,
            output  [3:0]  parallel_out );
  /*
  ============================================================
              PIPO SHIFT REGISTER — USING 4 D FLIP-FLOPS
  ============================================================

  - A 4-bit PIPO shift register can be designed using four
    D flip-flops connected in parallel.

  - Four input bits are loaded simultaneously into the four
    D flip-flops on the active clock edge.

  - The outputs of the four D flip-flops provide the
    parallel output.

  - Therefore:

        Parallel In[3:0] → DFFs → Parallel Out[3:0]

  ============================================================
*/
  
  d_ff d1 
  (
    .clk  (clk             ),
    .rst  (rst             ),
    .din  (parallel_in[0]  ),
    .qout (parallel_out[0] ),
    .qbar (                )
  );

   d_ff d2 
  (
    .clk  (clk             ),
    .rst  (rst             ),
    .din  (parallel_in[1]  ),
    .qout (parallel_out[1] ),
    .qbar (                )
  );
  
   d_ff d3 
  (
    .clk  (clk             ),
    .rst  (rst             ),
    .din  (parallel_in[2]  ),
    .qout (parallel_out[2] ),
    .qbar (                )
  );
  
   d_ff d4 
  (
    .clk  (clk             ),
    .rst  (rst             ),
    .din  (parallel_in[3]  ),
    .qout (parallel_out[3] ),
    .qbar (                )
  );
  
endmodule
