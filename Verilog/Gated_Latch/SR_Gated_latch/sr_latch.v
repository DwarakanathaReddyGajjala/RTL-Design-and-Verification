// Code your design here
module sr_latch(input      s,r,
                input      en,resetn,
                output reg q,qbar);
  /* ============================================================
   NORMAL LATCH
   ============================================================

   - A normal latch directly responds to changes in its input
     according to its enable/level-control condition.

   - Without a dedicated gating stage, the input can directly
     reach the storage element whenever the latch is enabled.

   ============================================================
*/


/* ============================================================
   GATED LATCH
   ============================================================

   - A gated latch introduces an enable/control signal before
     the storage element.

   - The enable signal determines whether the input is allowed
     to reach the latch.

   - When EN = 1:
         D is allowed to reach the latch.
         Q follows D.

   - When EN = 0:
         D is blocked from reaching the latch.
         Q holds its previous value.

   ============================================================
*/


/* ============================================================
   ADVANTAGES OF GATED LATCH
   ============================================================

   1. Controlled Data Transfer
   - The enable signal controls when data can reach the latch.

   2. Prevents Unwanted Updates
   - When the latch is disabled, changes in D do not update Q.

   3. Better Control
   - The enable signal provides explicit control over when
     the storage element can respond to its input.

   4. Data Isolation
   - The input can change while the latch is disabled without
     changing the stored output.

   5. Useful in Sequential Designs
   - Gated latches are useful when data needs to be captured
     only during a specific enable condition.

   ============================================================
*/

  
// 1. Behavioral Modeling Using Non-Blocking Procedural Assignment with Case
//   always @ (*) begin 
//     if (!resetn) begin 
//       q    <= 0;
//       qbar <= 1;
//     end
//     else if(en) begin 
//       case ({s,r})
//         2'b00: begin q    <= q    ;
//                      qbar <= qbar ;
//                end
//         2'b01: begin q    <= 0    ;
//                      qbar <= 1    ;
//                end
//         2'b10: begin q    <= 1    ;
//                      qbar <= 0    ;
//                end
//         2'b11: begin q    <= 1'bx ;
//                      qbar <= 1'bx ;
//                end
//       endcase
//     end 
//   end


// 2. Behavioral Modeling Using Non-Blocking Procedural Assignment with If-Else  
  always @ (*) begin
    if (!resetn) begin 
      q    <= 0;
      qbar <= 1;
    end
    else if (en)  begin 
      if( s &&  ~r ) begin 
        q    <= 1;
        qbar <= 0;
      end 
      else  if( ~s && r) begin 
        q    <= 0;
        qbar <= 1;
      end 
      else  if( s && r) begin 
        q    <= 1'bx;
        qbar <= 1'bx;
      end 
      else begin 
          q    <= q;
          qbar <= qbar;
      end 
    end
  end
    
    endmodule
