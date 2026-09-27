// Code your design here
module d_latch(input        d,
               output reg   q, qbar);

/*
  ============================================================
                         D LATCH
  ============================================================

  A D latch stores the input data and provides complementary
  outputs q and qbar.

  Design View:
  - q follows the required data value.
  - qbar produces the complement of q.
  - The same functionality can be described using different
    Verilog modeling styles.

  ============================================================
*/


/* ============================================================
   1. Gate-Level Modeling — Feedback Allowed
   ============================================================


   - The circuit is described using NOR gate primitives.
   - Feedback is created by connecting the output of each NOR
     gate to the input of the other NOR gate.
   ============================================================*/

 nor n1(q   , qbar, ~d);
 nor n2(qbar, q   ,  d);


/*  ============================================================
    2. Dataflow Modeling — Using Truth Table (Feedback Allowed)
    ============================================================


    - The relationship between input and outputs is directly
      described using continuous assignments.
    - q follows d and qbar follows the complement of d.
    ============================================================*/

// assign q    = d;
// assign qbar = ~d;


/* ================================================================
   3. Dataflow Modeling — Using Ternary Operator (Feedback Allowed)
   ================================================================

   - The ternary operator describes the output behavior based
     on the value of d.
   - If d=1, q=1 and qbar=0.
   - If d=0, q=0 and qbar=1.
   ================================================================*/

// assign q    = d ? 1 : 0;
// assign qbar = d ? 0 : 1;


/* ========================================================================
   4. Behavioral Modeling — Non-Blocking Assignment  (Using Case Statement)
   ========================================================================


   - The case statement describes the output behavior for each
     possible value of d.
   - Non-blocking assignments (<=) are used for the outputs.
   ========================================================================*/

// always @(*) begin
//   case (d)
//     1'b0: begin
//       q    <= 0;
//       qbar <= 1;
//     end
//     1'b1: begin
//       q    <= 1;
//       qbar <= 0;
//     end
//   endcase
// end


/* =================================================================
   5. Behavioral Modeling — Non-Blocking Assignment  (Using If-Else)
   =================================================================

   - The if-else structure describes the output behavior based
     on the value of d.
   - Non-blocking assignments (<=) are used for the outputs.
   =================================================================*/

// always @(*) begin
//   if (d) begin
//     q    <= 1;
//     qbar <= 0;
//   end
//   else if (~d) begin
//     q    <= 0;
//     qbar <= 1;
//   end
// end

endmodule
