/*
  ============================================================
                    SOLVE ... BEFORE
  ============================================================

  - The solve...before constraint is used to control the
    randomization order of variables.

  - Syntax:

        solve a before b;

  - It tells the constraint solver to solve a before solving b.

  - In this example:

        a == 3 -> b < 5;
        solve a before b;

  - First, the solver determines the value of a.

  - Then, based on the value of a, the constraint on b is
    applied.

  - If:

        a = 3 → b < 5

    If:

        a != 3 → no restriction is placed on b by this
                 implication constraint.

  - solve...before controls the solving order; it does not
    change the actual constraint relationship.

  ============================================================
*/

class parent;
  rand  bit [2:0]  a,b;
//   rand  int        a,b;// probability reduces 


  constraint a_c { a==3 -> b<5;
                 solve a before b ;
                 }
    
endclass

module solve_before_constraint_tb;
  initial begin
    parent p_h;
    p_h = new();
    repeat(30) begin 
      p_h.randomize();
      $display("a=%0d,b=%0d",p_h.a,p_h.b);
    end 
  end 
endmodule
    
