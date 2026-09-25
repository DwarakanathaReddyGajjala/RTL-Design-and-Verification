// Code your design here
module full_adder(input  a_in, b_in, c_in,
                  output sum_out, carry_out);

  wire sum_0, and_1, and_2, and_3, or_1;


/* ============================================================
   Verilog Modeling Styles
   ============================================================

   1. Structural Modeling:
      - Describes the circuit by connecting different components
        or modules.
      - Focuses on how the components are interconnected.

   2. Gate-Level Modeling:
      - Describes the circuit using built-in gate primitives.
      - Example: xor, and, or

   3. Dataflow Modeling:
      - Describes how data flows through the circuit using expressions.
      - Uses continuous assignments with the 'assign' keyword.

   4. Behavioral Modeling:
      - Describes the behavior of the circuit using procedural blocks.
      - Uses blocks such as 'always' and 'initial'.
*/


// Dataflow Modeling
// Using arithmetic addition
assign {carry_out, sum_out} = a_in + b_in + c_in;


// Dataflow Modeling
// Using Boolean Expressions

/*
   - Sum:
     The Sum is 1 when an odd number of inputs are 1.
     Therefore, the terms are combined using bitwise OR '|'.

   - Carry:
     The Carry is 1 when any two or all three inputs are 1.
     Therefore, the AND terms are combined using bitwise OR '|'.
*/

// assign sum_out = (~a_in & ~b_in & c_in) +
//                  (~a_in & b_in & ~c_in) +
//                  (a_in & ~b_in & ~c_in) +
//                  (a_in & b_in & c_in); // Wrong: '+' is arithmetic addition

// Correct Boolean expression for Sum
// assign sum_out = (~a_in & ~b_in & c_in) |
//                  (~a_in & b_in & ~c_in) |
//                  (a_in & ~b_in & ~c_in) |
//                  (a_in & b_in & c_in);


// Reduced Expression using K-Map

// assign carry_out = (a_in & b_in) +
//                    (c_in & b_in) +
//                    (a_in & c_in); // Wrong: '+' is arithmetic addition

// Correct reduced expression for Carry
// assign carry_out = (a_in & b_in) |
//                    (c_in & b_in) |
//                    (a_in & c_in);


// Structural / Gate-Level Modeling

// xor x1 (sum_0,     a_in, b_in);
// xor x2 (sum_out,   c_in, sum_0);
// and a1 (and_1,     a_in, b_in);
// and a2 (and_2,     c_in, b_in);
// and a3 (and_3,     a_in, c_in);
// or  or1 (or_1,     and_2, and_1);
// or  or2 (carry_out, and_3, or_1);


// Structural / Gate-Level Modeling
// Using multi-input gates

// xor x1 (sum_out,   a_in, b_in, c_in); // More than 2 inputs allowed
// and a1 (and_1,     a_in, b_in);
// and a2 (and_2,     c_in, b_in);
// and a3 (and_3,     a_in, c_in);
// or  or1 (carry_out, and_2, and_1, and_3);

endmodule
