/*
  ============================================================
                  RANGED DELAY OPERATOR (##[ ])
  ============================================================

  - The ranged delay operator is used in a sequence to specify
    a range of clocking events in which the next expression can
    occur.

  - The syntax is:

        ##[min:max]

  - It means that the next sequence expression can occur from
    min to max clocking events after the previous expression.


  ============================================================
                       ##[2:4] OPERATOR
  ============================================================

  - In this example:

        start ##[2:4] transfer;

  - This means that after start is true, transfer must become
    true 2, 3, or 4 clocking events later.

  - Therefore:

        start
          ↓
        ##2 → transfer
        ##3 → transfer
        ##4 → transfer

  - The assertion succeeds if transfer occurs at any of these
    three allowed clocking events.


  ============================================================
                    TIMING EXAMPLE
  ============================================================

        Clock:       C1       C2       C3       C4       C5

        start:        1        -        -        -        -

                      │        │        │        │
                      └──##2──→ transfer
                               └──##3──→ transfer
                                        └──##4──→ transfer

  - If transfer is true at C3, the sequence succeeds.

  - If transfer is true at C4, the sequence also succeeds.

  - If transfer is true at C5, the sequence also succeeds.

  - If transfer is not true at any of these allowed clocking
    events, that particular sequence attempt fails.


  ============================================================
                    RANDOM START VALUE
  ============================================================

        start = $random();

  - In this example, start is assigned a random value before
    every positive clock edge.

  - Since start is a 1-bit variable, its sampled value is
    either 0 or 1.

  - When start is sampled as 1, the sequence:

        start ##[2:4] transfer

    is started.

  - When start is sampled as 0, that clocking event does not
    start the sequence.


  ============================================================
                     TRANSFER = 1
  ============================================================

        transfer = 1'b1;

  - transfer is continuously assigned the value 1 in the
    testbench loop.

  - Therefore, whenever a sequence requires transfer to be
    true at one of its allowed clocking events, transfer
    satisfies that condition.

  - The important part of this example is therefore observing
    when the sequence starts and when the ranged delay reaches
    its allowed clocking events.


  ============================================================
                     ##[1:$] OPERATOR
  ============================================================

        start ##[1:$] transfer;

  - $ represents an unbounded upper limit.

  - Therefore, transfer can occur at any clocking event starting
    from 1 clock after start.

        ##1, ##2, ##3, ##4, ...

  - The sequence can continue waiting for transfer without a
    fixed upper limit.


  ============================================================
                  FIXED vs RANGED DELAY
  ============================================================

        start ##2 transfer

            → transfer must occur exactly 2 clocks later.

        start ##[2:4] transfer

            → transfer can occur 2, 3, or 4 clocks later.

        start ##[1:$] transfer

            → transfer can occur 1 or more clocks later.


  ============================================================
                  RANGED DELAY vs REPETITION
  ============================================================

        start ##[2:4] transfer

            → Specifies when transfer can occur.

        start[*3]

            → Requires start to be true for 3 consecutive
              clocking events.

  - Therefore:

        ##[ ] → Specifies a range of delay.

        [* ]  → Specifies repetition.


  ============================================================
                         KEY POINT
  ============================================================

        ##[min:max]

            → Next sequence expression can occur from min
              to max clocking events later.

        ##[2:4]

            → 2, 3, or 4 clocks later.

        ##[1:$]

            → 1 or more clocks later.

  ============================================================
*/
module ranged_delay_operator_ex2;
  bit start,transfer;
  bit clk;

  always #5 clk = ~clk;

  initial clk = 0; 
  
 
//   initial begin 
//     start = 1;
//     @(posedge clk);// sampled values in prepone transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
    
//     transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
    
//     transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
//     transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
    
//     @(posedge clk);// sampled values in prepone transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
//     transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;

//     @(posedge clk);// sampled values in prepone transfer = 0;
//     transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
//      transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
    
//     transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
//     transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
//     transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
    
//      transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
//     transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
    
//     transfer = 1;
//     @(posedge clk);// sampled values in prepone transfer = 1;
//     transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
//     @(posedge clk);// sampled values in prepone transfer = 0;
//   end 

  initial begin 
    repeat(29) begin 
      start    = $random();
//       transfer = $random();
      transfer = 1'b1;
      @(posedge clk);
    end
  end
      
  property p1;
    @(posedge clk)
    start ##[2:4]  transfer;
    //start ##[1:$] transfer;
  endproperty

  l1: assert property(p1)
    $display("[%0t] assertion success", $time);
    
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 

  initial 
    #280 $finish;

  endmodule
