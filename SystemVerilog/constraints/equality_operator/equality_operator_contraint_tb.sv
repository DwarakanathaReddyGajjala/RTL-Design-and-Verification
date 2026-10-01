/*
  ============================================================
                  EQUALITY OPERATOR (==)
  ============================================================

  - The equality operator (==) is used in a constraint to
    specify that two expressions must have equal values.

  - For example:

        constraint b1_c {
          b == a;
        }

  - This means the constraint solver must choose values such
    that b and a are equal.

  - Example:

        a inside {[1:10]};
        b inside {3,5,7};
        b == a;

  - Therefore, the possible values are:

        a = 3, b = 3
        a = 5, b = 5
        a = 7, b = 7

  - All constraints must be satisfied during randomization.

  ============================================================
*/

class parent;
  rand  int a,b; 

  constraint a_c { a inside {[1:10]};}
  constraint b_c { b inside {3,5,7};}
  constraint b1_c { b == a;}
  
endclass

module equality_operator_contraint_tb;
  initial begin
    parent p_h;
    p_h = new();
    repeat(15) begin 
      p_h.randomize();
      $display("a=%0d,b=%0d",p_h.a,p_h.b);
    end 
  end
endmodule
    
