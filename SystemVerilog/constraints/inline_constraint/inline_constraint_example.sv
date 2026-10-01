// Code your testbench here
// or browse Examples
/*
  ============================================================
                    INLINE CONSTRAINT
  ============================================================

  - An inline constraint is a constraint specified directly
    inside the randomize() call.

  - It is used to add additional constraints for a particular
    randomization without modifying the class constraint.

  - Syntax:

        object.randomize() with {
          constraint;
        };

  - Inline constraints are applied along with the existing
    class constraints.

  - Example:

        item.randomize() with {
          val1 > 150;
          val1 < 160;
        };

  - Here, the inline constraint further restricts val1 to
    values between 151 and 159.

  - Another example:

        item.randomize() with {
          val2 inside {[10:15]};
        };

  - Inline constraints are temporary and apply only to that
    particular randomize() call.

  ============================================================
*/
class seq_item;
  rand bit [7:0] val1, val2;
 
  constraint val1_c {val1 > 100; val1 < 200;}
  constraint val2_c {val2 > 5; val2 < 80;}
endclass

module inline_constraint_example;
  seq_item item;
  
  initial begin
    item = new();
    
    repeat(5) begin
      item.randomize();
      $display("Before inline constraint: val1 = %0d, val2 = %0d", item.val1, item.val2);
      item.randomize with {val1 > 150; val1 < 160;};
      item.randomize with {val2 inside {[10:15]};};
      $display("After inline constraint: val1 = %0d, val2 = %0d", item.val1, item.val2);
    end
  end
endmodule
