/*
  ============================================================
                    INSIDE CONSTRAINT
  ============================================================

  - The inside operator is used in a constraint to restrict
    a random variable to a specific set of values or a range.

  - The inside operator can be used with both individual
    values and ranges.

  - The constraint is satisfied when the randomized value
    belongs to the specified set or range.

  - Syntax:

        variable inside {values};


  ============================================================
                 INDIVIDUAL VALUES
  ============================================================

  - Individual values can be specified directly inside the
    braces.

        a inside {1,2,3};

  - This means a can take only one of the specified values:

        a → 1, 2, or 3

  - Another example:

        a inside {1,2,3,4,5};

  - This means a can take only:

        a → 1, 2, 3, 4, or 5


  ============================================================
                        RANGE
  ============================================================

  - A range can be specified using:

        [start:end]

  - For example:

        b inside {[10:15]};

  - This means b can take any value from 10 through 15.

        b → 10, 11, 12, 13, 14, 15


  ============================================================
                   INDIVIDUAL VALUES + RANGE
  ============================================================

  - Individual values and ranges can also be used together.

  - For example:

        c inside {1,2,[10:15]};

  - This means c can take:

        c → 1, 2, 10, 11, 12, 13, 14, 15


  ============================================================
                         EXAMPLE
  ============================================================

        constraint example_c {
          a inside {1,2,3};
          b inside {[10:15]};
        }

  - The constraint restricts a to the values 1, 2, or 3.

  - The constraint restricts b to the range 10 through 15.

  - Therefore:

        a → 1, 2, 3

        b → 10, 11, 12, 13, 14, 15


  ============================================================
                      RANDOMIZATION
  ============================================================

  - Every time randomize() is called, the values are generated
    while satisfying the inside constraints.

  - Therefore, randomization does not generate values outside
    the specified set or range.

  ============================================================
*/


class parent;
  rand  int a,b;
  constraint a_c { a inside {1,2,3,4,5};}
  constraint b_c { b inside {[11:16]};}
endclass

module inside_constraint_tb;
  initial begin
    parent p_h;
    p_h = new();
    repeat(10) begin 
      p_h.randomize();
      $display("a=%0d,b=%0d",p_h.a,p_h.b);
    end 
  end 
endmodule
