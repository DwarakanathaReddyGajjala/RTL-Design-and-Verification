/*
  ============================================================
                  BASIC RANDOMIZATION
  ============================================================

  - A class property can be declared as rand to make it a
    random variable.

        rand int a;
        rand bit [5:0] b;

  - randomize() generates random values for the properties
    declared with rand.

        random_h.randomize();

  - Properties without rand are not randomized.

        int c;

  - Therefore, in this example:

        a → randomized
        b → randomized
        c → not randomized

  - Since b is 6 bits wide, it can have values from 0 to 63.

  - randomize() returns a status indicating whether
    randomization was successful.

  - $display("%p", random_h) displays the complete contents
    of the class object.

  ============================================================
*/

class random;
  rand int a;
  rand bit [5:0] b;
  int c;
endclass

module randomization_tb; 
  random random_h;
  initial begin
    repeat(10) begin 
    random_h  = new(); 
    random_h.randomize();
    $display("%p",random_h);
    end 
  end 
endmodule
