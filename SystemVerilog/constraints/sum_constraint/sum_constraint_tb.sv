/*
  ============================================================
                    SUM CONSTRAINT
  ============================================================

  - A sum constraint is used to define a required relationship
    between randomized variables using an arithmetic expression.

  - In this example:

        a + b == 100;

  - This requires the sum of a and b to be exactly 100.

  - Therefore, every successful randomization must satisfy:

        a + b = 100

  ============================================================
*/

class ABC;
  rand  bit [6:0] a,b;

  constraint a_c { a inside {[0:100]};}
  constraint b_c { b inside {[0:100]};}
  constraint sum_c { a+b == 100;}
  
endclass

module sum_constraint_tb;
  initial begin
    ABC abc = new;
    repeat(30) begin
      abc.randomize();
      $display("a=%0d,b=%0d", abc.a,abc.b);
    end
  end
endmodule 
