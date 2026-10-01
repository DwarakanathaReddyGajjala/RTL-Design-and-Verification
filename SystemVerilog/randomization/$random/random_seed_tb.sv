/*
  ============================================================
                    $RANDOM WITH SEED
  ============================================================

  - $random is used to generate a pseudo-random 32-bit value.

  - A seed can be passed to $random:

        a = $random(seed);

  - The seed is an inout argument, so $random uses the seed
    and updates it after generating the random value.

  - Therefore, when $random(seed) is called again, the updated
    seed is used to generate the next random value.

  - In this example, seed and seed1 maintain separate random
    sequences.

  - Since the calls are inside repeat(2), the updated seed from
    the first iteration is used in the second iteration.

  - If the seed is initialized with a known value, the same
    random sequence can be reproduced.

  - Therefore:

        Seed → $random() → Random Value + Updated Seed

  ============================================================
*/

module random_seed_tb; 
  int a;
  bit [31:0] b;
  bit [31:0] seed;
  int seed1;
  
  
  /*
  ============================================================
               FIXED SEED IN EACH ITERATION
  ============================================================

  - In this code, the seed is assigned a value inside the
    repeat loop.

  - Therefore, the seed is reset to the same value in every
    iteration.

        seed  = 4;
        seed1 = 5;

  - $random() then uses these seed values to generate the
    random values.

  ============================================================
*/

//   initial begin
//     repeat(2) begin 
//       seed = 4;
//       seed1 = 5;
//       a  = $random(seed);    
//       b  = $random(seed1);
//       $display("seed =%0d,seed =%b",seed,seed);
//       $display("seed1=%0d,seed1=%b",seed1,seed1);
//       $display("a=%d,a=%b",a,a);
//       $display("b=%d,b=%b",b,b);
//     end 
//   end
  
  
  /*
  ============================================================
                CONTINUOUS SEED UPDATE
  ============================================================

  - In this code, the seed is not assigned a new value inside
    the repeat loop.

  - $random() updates the seed after each call.

  - Therefore, the updated seed from the first iteration is
    used in the next iteration.

  - This allows the random sequence to continue from the
    previous randomization state.

  ============================================================
*/
  initial begin
    repeat(2) begin 
      a  = $random(seed);    
      b  = $random(seed1);
      $display("seed =%0d,seed =%b",seed,seed);
      $display("seed1=%0d,seed1=%b",seed1,seed1);
      $display("a=%d,a=%b",a,a);
      $display("b=%d,b=%b",b,b);
    end 
  end
endmodule

