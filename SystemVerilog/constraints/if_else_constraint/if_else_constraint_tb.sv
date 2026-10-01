/*
  ============================================================
                    IF-ELSE CONSTRAINT
  ============================================================

  - An if-else constraint applies different constraints based
    on the value of a condition.

  - In this example:

        if(a)
          b > 19;
        else
          b < 20;

  - When a = 1, the constraint requires:

        b > 19

    Since b is 5 bits wide, b can have values from 0 to 31.

    Therefore:

        b → 20 to 31


  - When a = 0, the constraint requires:

        b < 20

    Therefore:

        b → 0 to 19


  - Therefore:

        a = 1 → b = 20 to 31
        a = 0 → b = 0 to 19

  - The constraint solver chooses values that satisfy the
    applicable condition during randomization.

  ============================================================
*/

class ABC;
  rand  bit			a;
  rand  bit [4:0] 	b;

  constraint c_ab { 
    if(a) b> 19;
    else  b< 20;
  }
endclass

module if_else_constraint_tb;
  initial begin
    ABC abc = new;
    for (int i = 0; i < 14; i++) begin
      abc.randomize();
      $display ("a=%0d b=%0d", abc.a, abc.b); 
    end
  end
endmodule
