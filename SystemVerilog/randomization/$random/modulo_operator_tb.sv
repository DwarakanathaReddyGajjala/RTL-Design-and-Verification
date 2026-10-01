/*
  ============================================================
                    MODULO OPERATOR (%)
  ============================================================

  - The modulo operator (%) returns the remainder after
    division.

        result = value % divisor;

  - For example:

        25 % 10 = 5

    because:

        25 = 10 × 2 + 5

  - In this example:

        a = $random(seed) % 1024;

    the random value is divided by 1024 and the remainder
    is assigned to a.

  - The same operation is performed for b:

        b = $random(seed1) % 1024;

  - Since $random returns a signed value, the result of the
    modulo operation can also be negative when the random
    value is negative.

  - Therefore, % 1024 does not always guarantee a value from
    0 to 1023 when the left operand is signed.

  - For example:

        -1407 % 1024 = -383

  - If this negative result is assigned to a signed int:

        int a = -383;

    it is displayed as:

        -383

  - If the same negative result is assigned to an unsigned
    32-bit value:

        bit [31:0] b = -383;

    the same 32-bit bit pattern is stored, but it is
    interpreted as an unsigned value.

  - Therefore, the decimal value displayed for b can be much
    larger than 1023.

  ============================================================
*/

module modulo_operator_tb;
  int a; 
  bit [31:0] b;
  bit [31:0] seed;
  int seed1;

  initial begin
    repeat(4) begin 
      a  = $random(seed) % 1024;    
      b  = $random(seed1) % 1024;
      $display("seed =%0d,seed =%b",seed,seed);
      $display("seed1=%0d,seed1=%b",seed1,seed1);
      $display("a=%0d,a=%b",a,a);
      $display("b=%0d,b=%b",b,b);
    end 
  end
endmodule

