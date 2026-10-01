/*
  ============================================================
                    DYNAMIC ARRAY
  ============================================================

  - A dynamic array does not have a fixed size when it is
    declared.

  - Its size can be determined or changed during simulation.

  - Example:

        bit [4:0] mem [];

  - The empty brackets [] indicate that mem is a dynamic array.

  ============================================================
              DYNAMIC ARRAY WITH FOREACH CONSTRAINT
  ============================================================

  - foreach can be used with a dynamic array to apply a
    constraint to every element of the array.

  - Example:

        foreach(mem[i])
          mem[i] == i**2;

  - Here, each element is constrained according to its index.

  - Therefore:

        mem[0] = 0
        mem[1] = 1
        mem[2] = 4
        mem[3] = 9
        ...

  ============================================================
                    ARRAY SIZE CONSTRAINT
  ============================================================

  - The size() method returns the current number of elements
    in a dynamic array.

  - Example:

        mem.size() == b;

  - This constraint requires the number of elements in mem to
    be equal to the value of b.

  - Therefore:

        b = 5 → mem has 5 elements
        b = 8 → mem has 8 elements

  ============================================================
*/
class ABC;
  rand  bit [4:0] mem [];
  rand  bit [3:0] 	b;

  constraint mem_c {
    foreach(mem[i])
      mem[i] == i**2;
     }
  constraint b_c {
    mem.size()== b;
     }
endclass

module dynamic_array_foreach_constraint_tb;
  initial begin
    ABC abc = new;
    repeat(15) begin
      abc.randomize();
      $display("%p", abc);
    end
  end
endmodule 
