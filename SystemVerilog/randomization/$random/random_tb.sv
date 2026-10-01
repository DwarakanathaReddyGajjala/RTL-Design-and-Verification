/*
  ============================================================
                    $RANDOM SYSTEM FUNCTION
  ============================================================

  - $random is a SystemVerilog/Verilog system function used
    to generate pseudo-random values.

  - The returned value is a signed 32-bit value.

  - Therefore, when the generated 32-bit value has its MSB
    as 1, assigning it to a signed int can produce a negative
    decimal value.

  - In this example:

        int a;
        bit [31:0] b;

        a = $random(1);
        b = $random(1);

  - Both a and b receive the same random bit pattern because
    the same seed is used.

  - The difference is how the value is interpreted.

        int a
        → signed 32-bit value

        bit [31:0] b
        → 32-bit unsigned 4-state vector

  - Therefore, the same 32-bit pattern can produce different
    decimal values for a and b.

  - Example:

        10000000000000010000111000000000

    When interpreted as a signed int:

        a = -2147414528

    When interpreted as an unsigned 32-bit value:

        b = 2147552768

  ============================================================
                           SEED
  ============================================================

  - A seed is used to initialize the pseudo-random number
    generation.

  - The seed affects the sequence of random values generated.

  - In:

        $random(1)

    1 is the seed value.

  - Using the same seed produces the same pseudo-random
    sequence for the same simulation conditions.

  - Changing the seed changes the generated sequence.

  - Therefore, a fixed seed is useful when we want to reproduce
    the same random values during debugging.

  - A different seed can be used to generate a different
    random sequence for another simulation run.

  ============================================================
                         IMPORTANT
  ============================================================

  - $random generates pseudo-random values, not truly random
    values.

  - The generated value depends on the current randomization
    state and seed.

  - The same random sequence can be reproduced by using the
    same starting seed and the same sequence of random calls.

  ============================================================
*/

module random_tb; 
  int a;
  bit [31:0] b;

  initial begin
    a  = $random(1);    
    b  = $random(1);
//     b  = a;
    $display("a=%d,a=%b",a,a);
    $display("b=%d,b=%b",b,b);
   
    a  = $random(2);    
    b  = $random(1);
//     b  = a;
    $display("a=%d,a=%b",a,a);
    $display("b=%d,b=%b",b,b);
    
    a  = $random(1);    
    b  = $random(2);
//     b  = a;
    $display("a=%d,a=%b",a,a);
    $display("b=%d,b=%b",b,b);
  end
endmodule


