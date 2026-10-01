/*
  ============================================================
                    DIST CONSTRAINT
  ============================================================

  - The dist constraint is used to control the distribution
    of random values.

  - It allows us to assign different weights to different
    values or ranges.

  ============================================================
                         := OPERATOR
  ============================================================

  - The := operator gives the specified weight to each value
    in the item or range.

  - Example:

        typ1 dist {
          0      := 20,
          [1:5]  := 50,
          6      := 40,
          7      := 10
        };

  - The range [1:5] contains 5 values.

  - Each value in the range gets a weight of 50.

  ============================================================
                         :/ OPERATOR
  ============================================================

  - The :/ operator distributes the specified weight across
    all values in the item or range.

  - Example:

        typ2 dist {
          0      :/ 20,
          [1:5]  :/ 50,
          6      :/ 40,
          7      :/ 10
        };

  - The total weight of 50 is shared among the 5 values in
    the range [1:5].

  ============================================================
                    := vs :/
  ============================================================

        := → Weight is given to each value.

        :/ → Weight is divided among the values.

  ============================================================
*/

class ABC;
  rand  bit [3:0] typ1;
  rand  bit [3:0] typ2; 


  constraint dist1_c {
    typ1 dist{0:=20,[1:5]:=50,6:=40,7:=10};}
  constraint dist2_c {
    typ2 dist{0:/20,[1:5]:/50,6:/40,7:/10};}
  
endclass

module distribution_constraint_tb;
  initial begin
    ABC abc = new;
    repeat(20) begin
      abc.randomize();
      $display("typ1=%d,typ2=%0d", abc.typ1,abc.typ2);
    end
  end
endmodule
