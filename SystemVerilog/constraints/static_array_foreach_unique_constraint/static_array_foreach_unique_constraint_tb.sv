/*
  ============================================================
                       STATIC ARRAY
  ============================================================

  - A static array has a fixed size that is known at
    declaration time.

  - The size of the array cannot be changed during simulation.

  - Example:

        bit [4:0] mem [8];

  - This creates 8 elements:

        mem[0] to mem[7]

  - Each element is 5 bits wide.

  ============================================================
                         FOREACH
  ============================================================

  - foreach is used to iterate through each element of an
    array.

  - It provides an index variable that represents the current
    array element.

  - Example:

        foreach(mem[i])

  - Here, i represents the index of each element.

  - For an 8-element array:

        i → 0, 1, 2, 3, 4, 5, 6, 7

  ============================================================
              STATIC ARRAY WITH FOREACH CONSTRAINT
  ============================================================

  - foreach can be used in a constraint to apply the same
    constraint to every element of a static array.

  - Example:

        foreach(mem[i])
          mem[i] inside {[10:25]};

  - This applies the constraint to every element of mem.

  - Therefore, every element must have a value from 10 to 25.

  ============================================================
                    UNIQUE CONSTRAINT
  ============================================================

  - The unique constraint is used to ensure that all specified
    values are different from each other.

  - Example:

        unique {mem};

  - This ensures that no two elements of mem have the same
    value.

  - Therefore, all 8 elements of mem must contain unique
    values.

  ============================================================
*/

class ABC;
  rand  bit [4:0] mem [8];
  rand  bit [1:0] 	b;

  constraint mem_c {
    foreach(mem[i])
      mem[i] inside {[10:25]};
     }
  constraint mem_unique_c {
    unique{mem};
     }
endclass

module static_array_foreach_unique_constraint_tb;
  initial begin
    ABC abc = new;
    repeat(5) begin
      abc.randomize();
      $display("%p", abc);
    end 
  end
endmodule
