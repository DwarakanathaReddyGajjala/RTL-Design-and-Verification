// Code your design here
module t_ff(input       i_t    ,
             input      i_clock, i_reset,
             output reg o_q    ,
             output     o_qbar );
    
  assign o_qbar = ~o_q;
         
  always@(posedge i_clock,posedge i_reset)  
    if(i_reset)  
      o_q <= 0;
    else   
      if(i_t)
        o_q <= ~o_q;
                        
endmodule
