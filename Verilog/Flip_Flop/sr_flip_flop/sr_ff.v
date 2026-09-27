// Code your design here
module sr_ff(input      i_s    , i_r,
             input      i_clock, i_resetn,
             output reg o_q    ,
             output     o_qbar );
  
  
  assign o_qbar = ~o_q;
  
  /*
  ============================================================
                       SR FLIP-FLOP
  ============================================================

  - An SR flip-flop is an edge-triggered sequential storage
    element that stores one bit of data.

  - It uses S (Set) and R (Reset) inputs to control the stored
    output.

  - The output changes only on the active edge of the clock.

  - S is used to set the output to 1.

  - R is used to reset the output to 0.

  - Therefore:

        S + R + Clock Edge → SR Flip-Flop

  ============================================================
*/
    
//   always@(posedge i_clock) begin 
//     if(!i_resetn)  
//       o_q <= 0;
//     else  
//       case({i_s,i_r}) 
//         2'b00: o_q <= o_q ;
//         2'b01: o_q <= 0   ;
//         2'b10: o_q <= 1   ;
//         2'b11: o_q <= 1'bx;
//       endcase
//   end 
  
  
  always@(posedge i_clock)  
    if(!i_resetn)  
      o_q <= 0;
    else   
      if(i_s && ~i_r)
        o_q <= 1;
      else if(~i_s && i_r)
        o_q <= 0;
      else if(i_s && i_r)
        o_q <= 1'bx; 
                        
endmodule
