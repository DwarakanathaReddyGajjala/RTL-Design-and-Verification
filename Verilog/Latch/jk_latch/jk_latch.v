// Code your design here
module jk_latch(input      j,k,
                output  reg q,qbar);
  
  /*
  ============================================================
                    JK LATCH — DESIGN VIEW
  ============================================================

  A JK latch has two inputs, J and K, and two complementary
  outputs, Q and Qbar.

  The output behavior is:

      J  K     Operation
      0  0     Hold the previous state
      0  1     Reset
      1  0     Set
      1  1     Toggle the output

  The same JK latch behavior is described below using different
  Verilog modeling styles.

  ============================================================
*/

  /* ============================================================
     1. Dataflow Modeling — Using Truth Table (Feedback Allowed)
     ============================================================

   - Continuous assignments are used to describe the output
     equations.
   - In the toggle condition (J=1, K=1), q and qbar are used
     on the RHS to generate their opposite values.
   - Since assign is a continuous assignment, whenever a value
     on the RHS changes, the corresponding LHS is updated.
   - Therefore, when q and qbar toggle, their changes again
     affect the RHS.
   - This creates continuous zero-time toggling:

         q=0 → q=1 → q=0 → q=1 → ...

   - As a result, the simulation can run infinitely at the
     same simulation time and enter a hung state.

   ============================================================
*/

//   assign q    = ( j & ~k) | ((~j & ~k) & q   ) | ((j & k) & ~q   );
//   assign qbar = (~j &  k) | ((~j & ~k) & qbar) | ((j & k) & ~qbar);
  
  
  
 /* ============================================================
   3. Dataflow Modeling — Using Ternary Operator (Feedback Allowed)
   ============================================================

   - Continuous assignments are used with the ternary operator
     to describe the JK behavior.
   - In the toggle condition (J=1, K=1), q and qbar are used
     on the RHS to generate their opposite values.
   - Since assign is a continuous assignment, a change in the
     RHS causes the LHS to update.
   - The updated q and qbar values again change the RHS.
   - Therefore, q and qbar continuously toggle in zero simulation
     time:

         q=0 → q=1 → q=0 → q=1 → ...

   - This creates an infinite feedback loop and the simulation
     enters a hung state.

   ============================================================
*/ 
  
  assign q    = (j ? (k ? ~q    : 1) :(k ? 0 : q   ));
  assign qbar = (j ? (k ? ~qbar : 0) :(k ? 1 : qbar));


  
/* ========================================================================
   4. Behavioral Modeling — Non-Blocking Assignment (Using Case Statement)
   ========================================================================

   - The case statement describes the four possible operations
     of the JK latch.
   - J=0,K=0 → Hold.
   - J=0,K=1 → Reset.
   - J=1,K=0 → Set.
   - J=1,K=1 → Toggle.
   - Non-blocking assignments (<=) are used for q and qbar.

   - In the toggle condition (J=1,K=1), q and qbar are present
     on the RHS:

         q    <= ~q;
         qbar <= ~qbar;

   - When the NBA update changes q and qbar, these signals
     change on the RHS of the always @(*) block.
   - Therefore, the always block is triggered again.
   - The same toggle operation happens again, causing q and
     qbar to continuously change.

         q=0 → q=1 → q=0 → q=1 → ...

   - Since there is no timing control to stop or separate these
     executions, the always block can execute indefinitely at
     the same simulation time.
   - Therefore, the simulation can enter a hung state.

   ========================================================================*/

//   always @ (*) begin 
//     case ({j,k})
//       2'b00: begin q    <= q    ; 
//                    qbar <= qbar ;
//              end
//       2'b01: begin q    <= 0    ;
//                    qbar <= 1    ;
//              end
//       2'b10: begin q    <= 1    ;
//                    qbar <= 0    ;
//              end
//       2'b11: begin q    <= ~q   ;
//                    qbar <= ~qbar;
//              end
//     endcase
//   end
    

 

/* =================================================================
   5. Behavioral Modeling — Non-Blocking Assignment (Using If-Else)
   =================================================================

   - The if-else structure describes the same four JK operations.
   - J=1,K=0 → Set.
   - J=0,K=1 → Reset.
   - J=1,K=1 → Toggle.
   - J=0,K=0 → Hold.
   - Non-blocking assignments (<=) are used for q and qbar.

   - In the toggle condition (J=1,K=1), q and qbar are present
     on the RHS:

         q    <= ~q;
         qbar <= ~qbar;

   - When q and qbar are updated in the NBA region, their values
     change.
   - Since q and qbar are signals on the RHS of always @(*),
     their changes trigger the always block again.
   - The block toggles q and qbar again, which causes another
     trigger.

         q=0 → q=1 → q=0 → q=1 → ...

   - This continues indefinitely at the same simulation time
     because there is no timing control.
   - Therefore, the simulation can enter a hung state.

   ============================================================
*/
  
//   always @ (*) begin 
//     if( j && ~k ) begin 
//       q    <= 1;
//       qbar <= 0;
//     end 
//     else  if( ~j && k) begin 
//       q    <= 0;
//       qbar <= 1;
//     end 
//     else  if( j && k) begin 
//       q    <= ~q   ;
//       qbar <= ~qbar;
//     end 
//     else 
//       begin 
//         q    <= q;
//         qbar <= qbar;
//     end 
//   end
    
    endmodule
