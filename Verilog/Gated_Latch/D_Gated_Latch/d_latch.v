// Code your design here
module d_latch(input      d,
               input      en,resetn,
               output reg q,
               output     qbar);

  assign qbar = ~q;
  
 /*
  ============================================================
                       GATED D LATCH
  ============================================================

  - A latch is a level-sensitive storage element that stores
    one bit of data.

  - A D latch uses D as the data input.

  - A gated D latch adds an explicit Enable (EN) signal to
    control when the latch responds to D.

  - Therefore:

        D + Enable → Gated D Latch

  ============================================================
*/

// 1. Behavioral Modeling — Non-Blocking Assignment Using Case
//   always @ (*) begin 
//     if (!resetn)  
//       q    <= 0;
//     else if(en) begin 
//       case (d)
//         1'b0:   q <= 0 ;
//         1'b1:   q <= 1 ;
//       endcase
//     end 
//   end

// 2. Behavioral Modeling — Non-Blocking Assignment Using If-Else 
  always @ (*) begin
    if (!resetn)  
      q    <= 0;    
    else if (en)   
      q    <= d ;
  end

endmodule
