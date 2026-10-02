/*
  ============================================================
              CONSECUTIVE REPETITION OPERATOR ([*])
  ============================================================

  - The repetition operator is used in a sequence to specify
    how many consecutive clocking events an expression must
    remain true.

  - The consecutive repetition operator is written as:

        [*n]

  - Here, n specifies the number of consecutive clocking
    events for which the expression must be true.


  ============================================================
                       [*2] OPERATOR
  ============================================================

  - In this example:

        start[*2]

  - This means that start must be true for 2 consecutive
    clocking events.

  - Therefore:

        Clock 1 → start = 1
        Clock 2 → start = 1

    forms a successful sequence.

  - If start becomes 0 before the required two consecutive
    occurrences are completed, the sequence does not match.


  ============================================================
                    REPETITION IN THIS PROPERTY
  ============================================================

        property p1;
          start[*2] |-> ##2 transfer;
        endproperty

  - The sequence:

        start[*2]

    requires start to be true for two consecutive clocking
    events.

  - After the successful completion of start[*2], the
    implication requires transfer after a delay of 2 clocking
    events.

  - Therefore:

        start[*2] → start is true for 2 consecutive clocks

        ##2      → transfer is checked 2 clocks later


  ============================================================
                       TIMING EXAMPLE
  ============================================================

        Clock:       C1       C2       C3       C4

        start:        1        1        -        -

                      |<--[*2]-->|
                              
        transfer:     -        -        -        1
                                     
                                  |<-- ##2 -->|


  ============================================================
                    OTHER REPETITION VALUES
  ============================================================

        a[*2]
            → a must be true for 2 consecutive clocking events.

        a[*3]
            → a must be true for 3 consecutive clocking events.

        a[*4]
            → a must be true for 4 consecutive clocking events.

  - Therefore:

        [*n] → n consecutive repetitions


  ============================================================
                    REPETITION vs ## 
  ============================================================

        a[*2]

            → a is true for 2 consecutive clocking events.

        a ##1 b

            → a occurs, then b occurs one clock later.

  - Therefore:

        [*] → Repeats an expression.

        ##  → Specifies a delay between sequence expressions.


  ============================================================
                         KEY POINT
  ============================================================

        start[*2] |-> ##2 transfer

        start[*2]
            → start must be true for 2 consecutive clocks.

        |->
            → Overlapping implication.

        ##2
            → transfer is checked 2 clocking events after the
              completion of the antecedent sequence.

  ============================================================
*/

module consecutive_repetition_ex;
  bit start,transfer;
  bit clk;

  always #5 clk = ~clk; 

  initial clk = 0;

  initial begin 
    start = 1;
    @(posedge clk);
    start = 0;
    @(posedge clk);
        start = 1;
    @(posedge clk);
    transfer = 1;
    @(posedge clk);
    @(posedge clk); 
    @(posedge clk); 
    @(posedge clk);
        transfer = 0;
  end 

 
  property p1;
    start[*2] |-> ## 2 transfer ; 
  endproperty

  l1:assert property(@(posedge clk) p1)
    $display("assertion sucess [%0t] start=%0d,transfer=%0d",$time,start,transfer);
  
  
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 

  initial 
    #200 $finish;

endmodule





