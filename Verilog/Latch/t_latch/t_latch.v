// Code your design here
module t_latch(input       t,resetn,
               output reg q,qbar);
  
  

/*
  ============================================================
                          T LATCH
  ============================================================

  A T latch is a latch that can either hold its previous state
  or toggle its state based on the T input.

  Inputs:
  - T      → Toggle input
  - resetn → Active-low reset

  Outputs:
  - q      → Main output
  - qbar   → Complementary output

  T Operation:

       T          Operation
       ----------------------
       0          Hold
       1          Toggle

  Reset Operation:

       resetn     Operation
       ----------------------
       0          Reset
       1          Normal operation

  When resetn = 0:
  - q    = 0
  - qbar = 1

  The reset has priority over the T input.

  ============================================================
*/

/* ========================================================================
   1. Behavioral Modeling — Non-Blocking Assignment (Using Case)
      With Active-Low Reset
   ========================================================================

   - The behavior of the T latch is described using an always @(*)
     procedural block.

   - Non-blocking assignments (<=) are used for q and qbar.

   - The active-low reset is checked first.

   - When resetn = 0:
         q    = 0
         qbar = 1

   - When resetn = 1, the T input determines the operation.

   - T=0 → Hold:
         q and qbar retain their previous values.

   - T=1 → Toggle:
         q and qbar change to their opposite values.

   - The default case provides a defined value for unexpected
     or unknown T conditions.

   - If the reset is not applied initially, q and qbar may start
     with X values because the hold and toggle operations depend
     on their previous states.

   ========================================================================
*/

//     always @ (*) begin
//       if (!resetn) begin 
//         q    <= 0;
//         qbar <= 1;
//       end
//       else begin 
//         case (t)
//           1'b0: begin q     <= q    ;
//                       qbar  <= qbar ;
//                 end
//           1'b1: begin q     <= ~q   ;
//                       qbar  <= ~qbar;
//                 end
//       default : begin q    <= 0     ;
//                       qbar <= 1     ;
//                     end
//         endcase
//       end
//     end

  
/* =================================================================
   2. Behavioral Modeling — Non-Blocking Assignment (Using If-Else)
      With Active-Low Reset
   =================================================================

   - The T latch behavior is described using an always @(*)
     procedural block with if-else statements.

   - The active-low reset is checked first.

   - When resetn = 0:
         q    = 0
         qbar = 1

   - When resetn = 1:

         T=0 → Hold
         T=1 → Toggle

   - In the toggle condition:

         q    <= ~q;
         qbar <= ~qbar;

   - q and qbar are used on the RHS of the non-blocking
     assignments.

   - Since q and qbar are signals on the RHS of always @(*),
     changes in q and qbar can trigger the always block again.

   - Therefore, when T=1 and there is no timing control,
     q and qbar can continuously toggle at the same
     simulation time.

   - This can cause the simulation to enter a hung state.

   ============================================================
*/
    always @ (*) begin 
      if (!resetn) begin 
        q    <= 0;
        qbar <= 1;
      end 
      else begin 
        if( t ) begin 
          q    <= ~q;
          qbar <= ~qbar;
        end 
        else 
          begin 
            q    <= q;
            qbar <= qbar;
          end 
      end
    end
 
endmodule
