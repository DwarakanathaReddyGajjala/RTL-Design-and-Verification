// Code your design here
module t_latch(input      t,
               input      en,resetn,
               output reg q,
               output     qbar);

  assign qbar = ~q;
  
  /*
  ============================================================
                       GATED T LATCH
  ============================================================

  - A T latch is a level-sensitive storage element that stores
    one bit of data.

  - A T latch uses T as the toggle input.

  - A gated T latch adds an explicit Enable (EN) signal to
    control when the latch responds to T.

  - Therefore:

        T + Enable → Gated T Latch

  ============================================================
*/
  
  
// 1. Behavioral Modeling — Non-Blocking Assignment Using Case
//   always @ (*) begin 
//     if (!resetn)  
//       q    <= 0;
//     else if(en) begin 
//       case (t)
//         1'b0:   q <=  q ;
//         1'b1:   q <= ~q ;
//       endcase
//     end 
//   end

  
// 2. Behavioral Modeling — Non-Blocking Assignment Using IF-ELSE
  always @ (*) begin
    if (!resetn)  
      q    <= 0;    
    else if (en && t) 
      q    <= ~q;
  end  
    
endmodule
