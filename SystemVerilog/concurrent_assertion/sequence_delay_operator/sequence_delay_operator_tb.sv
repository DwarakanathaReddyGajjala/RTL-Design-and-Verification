/*
  ============================================================
                  SEQUENCE DELAY OPERATOR (##)
  ============================================================

  - The ## operator is used in a concurrent assertion sequence
    to specify a delay between sequence expressions.

  - The number after ## specifies the number of clocking
    events between the sequence expressions.


  ============================================================
                       ##1 OPERATOR
  ============================================================

  - In this example:

        sequence seq1;
          a ##1 b;
        endsequence

  - ##1 means that b must occur one clocking event after a.

  - Therefore:

        Current Clock Edge
             │
             │  a = 1
             ↓
        Next Clock Edge
             │
             │  b = 1
             ↓
        Sequence succeeds


  ============================================================
                  SEQUENCE IN THE PROPERTY
  ============================================================

        property p1;
          @(posedge clk)
          seq1;
        endproperty

  - The sequence is evaluated at every positive edge of clk.

  - When a is true at a positive edge, the sequence expects b
    to be true at the next positive edge.

  - Therefore:

        a ##1 b

        a → Current clock
        b → Next clock


  ============================================================
                  SEQUENCE DELAY VALUES
  ============================================================

  - The number after ## specifies the number of clocking
    events between the sequence expressions.

  - Examples:

        a ##1 b

    → b is checked one clock later.

        a ##2 b

    → b is checked two clocks later.

        a ##3 b

    → b is checked three clocks later.

  - Therefore:

        ##1 → One clocking event later
        ##2 → Two clocking events later
        ##3 → Three clocking events later


  ============================================================
                  ## WITH SEQUENCE EXPRESSIONS
  ============================================================

  - The ## operator can be used to connect multiple sequence
    expressions with specific clocking delays.

  - Example:

        a ##1 b ##2 c

  - This describes a sequence in which:

        a → Starting clock
        b → One clock later
        c → Two clocks after b

  - Therefore, ## is used to describe the timing relationship
    between sequence expressions.


  ============================================================
                    SEQUENCE vs IMPLICATION
  ============================================================

  - ## is a sequence delay operator.

  - |-> and |=> are implication operators.

  - A sequence describes how expressions occur over clocking
    events.

  - An implication specifies what must happen when an
    antecedent occurs.


  ============================================================
                 |-> vs |=> vs ##1
  ============================================================

        a |-> b
            → Overlapping implication
            → a and b at the same clock

        a |=> b
            → Non-overlapping implication
            → a now, b at the next clock

        a ##1 b
            → Sequence delay
            → a now, b one clock later


  ============================================================
                      TIMING COMPARISON
  ============================================================

        |->

        Clock 1
           │
           ├── a
           └── b


        |=>

        Clock 1              Clock 2
           │                    │
           ├── a ─────────────→└── b


        ##1

        Clock 1              Clock 2
           │                    │
           ├── a ── ##1 ─────→ └── b


  ============================================================
                         KEY POINT
  ============================================================

        |->  → Same clock

        |=>  → Next clock

        ##1  → One clock later in a sequence

  - Therefore, |-> and |=> are implication operators, while
    ## is a sequence delay operator.

  ============================================================
*/



module sequence_delay_operator_tb;
  bit a,b;
  bit clk;

  always #5 clk = ~clk;

  initial clk = 0; 

  initial begin 
    repeat(20) begin 
      //@(negedge clk);
      @(posedge clk);
      a = $random();
      b = $random();
    end
  end 
  
//   initial begin 
//       a = 1; b = 1;
//       //@(negedge clk);
//       @(posedge clk);
//       a = 0;
//   end 


  sequence seq1;
    a ##1 b;
  endsequence 

  property p1;
    @(posedge clk)
    seq1;
  endproperty

  l1:assert property(p1)
    $display("assertion sucess [%0t] a=%0d,b=%0d",$time,a,b);
    
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,sequence_delay_operator_tb);
  end 

  initial 
    #200 $finish;

endmodule
