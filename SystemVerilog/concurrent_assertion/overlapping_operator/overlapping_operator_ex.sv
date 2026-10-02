/*
  ============================================================
             OVERLAPPING IMPLICATION OPERATOR (|->)
  ============================================================

  - The overlapping implication operator is written as: |->

  - It is used in concurrent assertions to specify a
    relationship between an antecedent and a consequent.

  - When the antecedent is true at a clocking event, the
    consequent is checked at the same clocking event.

  - Example:    a |-> b;

  - This means:

        If a is true at the current clock edge,
        b must also be true at the same clock edge.

  ==================================================================
                    TIMING OF |-> 
  ==================================================================

        Current Clock Edge
               │
               ▼
        a = 1       b = 1
        Antecedent  Consequent

  - Both the antecedent and consequent are associated with the
    same clocking event.

  - Therefore, the antecedent and consequent overlap in time.

  - This is why |-> is called the overlapping implication operator.

  ==================================================================
                  EXAMPLE WITH CLOCK
  ==================================================================

        property p1;
          @(posedge clk)
          a |-> b;
        endproperty

  - At every positive edge of clk, the assertion checks: a → b

  - If:

        a = 1 and b = 1

    at the same clocking event, the assertion passes.

  - If:

        a = 1 and b = 0

    at the same clocking event, the assertion fails.

  - If a is false, the implication is not required to check
    the consequent for that occurrence.


  ============================================================
              |-> WITH SIMULATION REGIONS
  ============================================================

  - At the clocking event, concurrent assertion values are
    sampled in the Preponed region.

  - The property is evaluated in the Observed region.

  - Therefore:

        PREPONED
            → Sample values

        OBSERVED
            → Evaluate assertion

  - For:

        a |-> b

    the antecedent and consequent are associated with the same
    clocking event.


  ============================================================
              OVERLAPPING vs NON-OVERLAPPING
  ============================================================

  - The two implication operators are:

        |->  → Overlapping implication

        |=>  → Non-overlapping implication


  ============================================================
                  OVERLAPPING IMPLICATION (|->)
  ============================================================

        a |-> b

        Current Clock Edge
             │
             ├── a = 1
             └── b = 1

  - If a is true at the current clock edge, b must be true at
    the same clock edge.


  ============================================================
                NON-OVERLAPPING IMPLICATION (|=>)
  ============================================================

        a |=> b

        Current Clock Edge          Next Clock Edge
             │                          │
             ├── a = 1 ───────────────→ └── b = 1

  - If a is true at the current clock edge, b must be true at
    the next clock edge.


  ============================================================
                         DIFFERENCE
  ============================================================

        |->  → Same clocking event

        |=>  → Next clocking event

        |->  → Overlapping

        |=>  → Non-overlapping

  - Therefore:

        a |-> b
            → If a is true now, b must be true now.

        a |=> b
            → If a is true now, b must be true at the next
              clocking event.

  ============================================================
*/


module overlapping_operator_ex;
  bit a,b;
  bit clk;

  always #5 clk = ~clk;

  initial clk = 0;

  initial begin 
    repeat(20) begin 
//       @(negedge clk);
      @(posedge clk);
      a = $random();
      b = $random();
    end 
  end 
  
//   initial begin 
//       @(negedge clk);
//       a = 1; b = 1;
//       @(negedge clk);
//       a = 0;
//   end 


  property p1;
    @(posedge clk)
    a |-> b;
  endproperty

  l1:assert property(p1)
    $display("assertion sucess [%0t],a=%0d,b=%0d",$time,a,b);
    
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 

  initial #200 $finish;
  
endmodule
