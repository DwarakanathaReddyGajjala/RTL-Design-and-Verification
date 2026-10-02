/*
  ============================================================
                   RANGED DELAY OPERATOR (##[ ])
  ============================================================

  - The ranged delay operator is used in a sequence to specify
    a range of clocking events in which the next expression can
    occur.

  - The syntax is:

        ##[min:max]

  - It means that the next expression can occur anywhere from
    min to max clocking events after the previous expression.


  ============================================================
                     ##[1:3] OPERATOR
  ============================================================

  - In this example:

        start ##[1:3] transfer;

  - This means that after start is true, transfer must become
    true within 1 to 3 clocking events.

  - Therefore, transfer can occur:

        1 clock later
        2 clocks later
        3 clocks later

  - The assertion succeeds when transfer occurs within this
    specified range.


  ============================================================
                    TIMING EXAMPLE
  ============================================================

        Clock:       C1       C2       C3       C4

        start:        1        -        -        -

                      |--------|--------|
                       ##1      ##2      ##3

        transfer:     -        1        -        -

  - Here, transfer occurs one clock after start, so the sequence
    succeeds.

  - transfer could also occur at C3 or C4 and still satisfy
    ##[1:3].


  ============================================================
                  ##[1:3] WITH PROPERTY
  ============================================================

        property p1;
          @(posedge clk)
          start ##[1:3] transfer;
        endproperty

  - The property is evaluated at every positive edge of clk.

  - When start is true, the assertion allows transfer to occur
    at any of the next 3 clocking events.

        start
          ↓
        ##1 → transfer
        ##2 → transfer
        ##3 → transfer


  ============================================================
                    RANGE OF POSSIBILITIES
  ============================================================

        start ##[1:3] transfer

        start
          │
          ├── 1 clock later → transfer
          │
          ├── 2 clocks later → transfer
          │
          └── 3 clocks later → transfer

  - Therefore, the range [1:3] provides three possible
    clocking events for transfer to occur.


  ============================================================
                    ##[1:$] OPERATOR
  ============================================================

        start ##[1:$] transfer;

  - $ represents an unbounded upper limit.

  - Therefore, transfer can occur at any clocking event starting
    from 1 clock after start.

        ##1, ##2, ##3, ##4, ...

  - The assertion continues to allow transfer until the
    required sequence is satisfied or the simulation ends.


  ============================================================
                  FIXED vs RANGED DELAY
  ============================================================

        start ##2 transfer

            → transfer must occur exactly 2 clocks later.

        start ##[1:3] transfer

            → transfer can occur 1, 2, or 3 clocks later.

        start ##[1:$] transfer

            → transfer can occur 1 or more clocks later.


  ============================================================
                 RANGE DELAY vs REPETITION
  ============================================================

        start ##[1:3] transfer

            → Specifies when transfer can occur.

        start[*3]

            → Requires start to occur for 3 consecutive
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

        ##[1:3]

            → 1, 2, or 3 clocks later.

        ##[1:$]

            → 1 or more clocks later.

  ============================================================
*/
module ranged_delay_operator_tb;
  bit start,transfer;
  bit clk;

  always #5 clk = ~clk;

  initial clk = 0;
  
 
  initial begin  
    start = 1;
    @(posedge clk);// sampled values in prepone transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
    
    transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    
    transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
    transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    
    @(posedge clk);// sampled values in prepone transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;

    @(posedge clk);// sampled values in prepone transfer = 0;
    transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
     transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
    
    transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
    transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    
     transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
    transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    
    transfer = 1;
    @(posedge clk);// sampled values in prepone transfer = 1;
    transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
    @(posedge clk);// sampled values in prepone transfer = 0;
  end 



  property p1;
    @(posedge clk)
    start ##[1:3] transfer;
//     start ##[1:$] transfer;
  endproperty

  l1: assert property(p1)
    $display("[%0t] assertion success", $time);
    
    
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 

  initial 
    #260 $finish;

  endmodule
