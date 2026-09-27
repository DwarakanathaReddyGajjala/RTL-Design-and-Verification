// Code your design here
module d_ff(input       din     ,
             input      clk, rst,
             output reg qout    ,
             output     qbar    );
  
  assign qbar = ~qout;
  
  /*
  ============================================================
                        D FLIP-FLOP
  ============================================================

  - A D flip-flop is an edge-triggered sequential storage
    element that stores one bit of data.

  - It uses D (Data) as the input to control the stored output.

  - The output changes only on the active edge of the clock.

  - The value present at D is transferred to Q on the active
    clock edge.

  - Therefore:

        D + Clock Edge → D Flip-Flop

  ============================================================
*/
     
  always@(posedge clk)  
    if(rst)  
      qout <= 1'b0;
    else
      qout <= din;
                           
endmodule
