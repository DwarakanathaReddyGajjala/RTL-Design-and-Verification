// Code your testbench here
// or browse Examples

/*
  ============================================================
                    SOFT CONSTRAINT
  ============================================================

  - Inline constraints can be used to change constraints during
    randomization.

  - Normally, inline constraints should not conflict with
    class constraints because conflicting constraints can cause
    randomization failure.

  - In the first example, the class constraint is:

        val inside {5,[10:15]};

    and the inline constraint is:

        val inside {[20:30]};

  - These constraints conflict because there is no common value.

  - Since the class constraint is a hard constraint by default,
    randomization fails.

  - To allow the inline constraint to override the class
    constraint, the soft keyword can be used:

        soft val inside {5,[10:15]};

  - Now, when the same conflict occurs, the inline constraint
    is allowed to override the soft constraint.

  - Soft constraints are useful when we intentionally need to
    change a constraint, such as for error injection.


  ============================================================
                HARD vs SOFT CONSTRAINT EXAMPLE
  ============================================================

  - To observe the constraint conflict and randomization
    failure, keep the hard constraint example active.

  - To test the soft constraint behavior:

      1. Comment the hard constraint example above.
      2. Uncomment the soft constraint example below.

  - Hard constraint + conflicting inline constraint
        → Randomization fails.

  - Soft constraint + conflicting inline constraint
        → Inline constraint overrides the soft constraint and
          randomization succeeds.

  ============================================================
*/


/*
  ============================================================
             HARD CONSTRAINT — RANDOMIZATION FAILURE
  ============================================================

  - The class constraint is a hard constraint by default.

  - The inline constraint requires val to be between 20 and 30.

  - The class constraint allows only 5 or 10 to 15.

  - There is no common value, so randomization fails.

  ============================================================
*/

class seq_item;
  rand bit [7:0] val;
  constraint val_c {
    val inside {5, [10:15]};
  }
endclass


module inline_constraint_example;
  seq_item item;
  initial begin
    item = new();
    repeat(5) begin
      item.randomize();
      $display("Before inline constraint: val = %0d", item.val);
      item.randomize with {
        val inside {[20:30]};
      };
      $display("After inline constraint: val = %0d", item.val);
    end
  end
endmodule



/*
  ============================================================
                 SOFT CONSTRAINT — NO FAILURE
  ============================================================

  - Uncomment this section after commenting the hard constraint
    example above.

  - The class constraint is declared as soft.

  - When the inline constraint conflicts with the soft
    constraint, the inline constraint overrides the soft
    constraint.

  - Therefore, randomization succeeds and val is generated
    between 20 and 30.

  ============================================================
*/


// class seq_item;
//   rand bit [7:0] val;
//   constraint val_c {
//     soft val inside {5, [10:15]};
//   }
// endclass


// module soft_constraint_example;
//   seq_item item;
//   initial begin
//     item = new();
//     repeat(5) begin
//       item.randomize();
//       $display("Before inline constraint: val = %0d", item.val);
//       item.randomize with {
//         val inside {[20:30]};
//       };
//       $display("After inline constraint: val = %0d", item.val);
//     end
//   end
// endmodule
