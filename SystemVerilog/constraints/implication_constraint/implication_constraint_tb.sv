/*
  ============================================================
                  IMPLICATION OPERATOR (->)
  ============================================================

  - The implication operator (->) is used in a constraint to
    specify a conditional relationship.

  - The syntax is:

        condition -> constraint;

  - The constraint on the right side is applied only when the
    condition on the left side is true.

  - In this example:

        a -> b == 3'h3;

  - When a = 1:

        b must be 3.

  - When a = 0:

        the constraint on b is not applied, so b can take any
        valid value.

  - Therefore:

        a = 1 → b = 3
        a = 0 → b = 0, 1, 2, or 3

  ============================================================
*/

class ABC;
  rand  bit			a;
  rand  bit [1:0] 	b;

  constraint c_ab {a -> b == 3'h3;}
endclass

module implication_constraint_tb;
  initial begin
    ABC abc = new;
    for (int i = 0; i < 15; i++) begin
      abc.randomize();
      $display ("a=%0d b=%0d", abc.a, abc.b);
    end
  end
endmodule 
