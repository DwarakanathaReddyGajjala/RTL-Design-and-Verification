// Code your design here
module t_ff(input       i_t             ,
             input      i_clock, i_reset,
             output reg o_q             ,
             output     o_qbar          );
  
  
  assign o_qbar = ~o_q;
  
  /*
  ============================================================
                        T FLIP-FLOP
  ============================================================

  - A T flip-flop is an edge-triggered sequential storage
    element that stores one bit of data.

  - It uses T (Toggle) as the input to control the stored
    output.

  - The output changes only on the active edge of the clock.

  - When T=0, the output retains its previous value.

  - When T=1, the output toggles to its opposite state.

  - Therefore:

        T + Clock Edge → T Flip-Flop

  ============================================================
*/
      
  always@(posedge i_clock)  
    if(i_reset)  
      o_q <= 0;
    else   
      if(i_t)
        o_q <= ~o_q;
                        
endmodule
