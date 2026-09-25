// Code your design here
module half_adder(input  a_in, b_in,
                  output sum_out, carry_out);

/* ============================================================
   Verilog Modeling Styles
   ============================================================

   1. Structural Modeling:
      - Describes the circuit by connecting components or modules.
      - Focuses on how the components are interconnected.

   2. Gate-Level Modeling:
      - Describes the circuit using built-in gate primitives.
      - Example: xor, and

   3. Dataflow Modeling:
      - Describes how data flows through the circuit using expressions.
      - Uses continuous assignments with the 'assign' keyword.

   4. Behavioral Modeling:
      - Describes the behavior of the circuit using procedural blocks.
      - Uses blocks such as 'always' and 'initial'.
*/


// Gate-Level Modeling
// xor x1 (sum_out,   a_in, b_in);
// and a1 (carry_out, a_in, b_in);


// Dataflow Modeling
// assign sum_out   = a_in ^ b_in;
// assign carry_out = a_in & b_in;


// Dataflow Modeling using Boolean Expressions
/*
   - Sum:
     If either one of the two terms is 1 (true), the result should be
     1 (true). Therefore, bitwise OR '|' is used instead of '+'.

   - Carry:
     The carry is obtained by ANDing the two input bits. Therefore,
     bitwise AND '&' is used. The '.' operator is not the AND operator
     in Verilog.
*/

// assign sum_out = (~a_in & b_in) + (a_in & ~b_in); // Wrong: '+' is arithmetic addition
// assign carry_out = a_in . b_in;                  // Wrong: '.' is not the AND operator

assign sum_out   = (~a_in & b_in) | (a_in & ~b_in); // Correct: '|' is bitwise OR
assign carry_out = a_in & b_in;                     // Correct: '&' is bitwise AND

endmodule
