/*
  ====================================================================
                 SYSTEMVERILOG SIMULATION REGIONS
  ====================================================================

  - SystemVerilog divides simulation into multiple scheduling regions.

  - These regions define the order in which different simulation 
    activities are executed within a simulation time slot.

  - Understanding simulation regions is important for understanding:

        - RTL execution
        - Non-blocking assignments
        - Testbench execution
        - Concurrent assertions
        - Assertion sampling and evaluation
        - Race conditions


  ====================================================================
                  MAIN SIMULATION REGIONS
  ====================================================================

  - The important simulation regions are:

        1. Preponed
        2. Active
        3. Inactive
        4. NBA
        5. Observed
        6. Reactive
        7. Re-Inactive
        8. Re-NBA
        9. Postponed

  - SystemVerilog also provides the Read-Only Synchronization
    region for observing stable simulation values.

  ====================================================================
                    PREPONED REGION
  ====================================================================

  - Preponed region occurs at the beginning of a simulation time slot.

  - It occurs before the Active region.

  - Concurrent assertions sample signal values in the Preponed
    region at their clocking event.

  - Therefore, values used by a concurrent assertion are sampled before 
    the signal updates that occur later in the same simulation time slot.

  - Example:

        @(posedge clk)
        a |=> b;

  - At the clocking event, the assertion samples the required
    values in the Preponed region.

  - Therefore:

        Preponed → Sample values for concurrent assertions

  ====================================================================
                     ACTIVE REGION
  ====================================================================

  - In Active region normal procedural simulation activity is executed.

  - Examples include:

        - Blocking assignments
        - Continuous assignment updates
        - always blocks
        - initial blocks
        - Module-based procedural activity

  - blocking assignment updates its LHS in the Active region.

  - Multiple processes can execute in the Active region, & their relative 
    ordering is generally not something the designer should rely on.

  ============================================================
                   INACTIVE REGION
  ============================================================

  - The Inactive region is used for processes that are
    scheduled using a zero-delay control.

  - For example:

        #0;

  - A process containing #0 is suspended from the Active region
    and resumes in the Inactive region.

  - Simulation time does not advance when #0 is used.

  ====================================================================
                       NBA REGION
  ====================================================================

  - NBA stands for Non-Blocking Assignment.

  - Non-blocking assignments (<=) schedule updates in the NBA region.

  - The right-hand side of a non-blocking assignment is
    evaluated when the statement executes.

  - The left-hand side is updated later in the NBA region.

  - Example:

        a <= b;

  - Therefore:

        RHS evaluation → when the statement executes
        LHS update     → NBA region

  - NBA region is important for understanding sequential RTL behavior 

  ====================================================================
                    OBSERVED REGION
  ====================================================================

  - The Observed region occurs after the NBA region.

  - Concurrent assertions are evaluated in the Observed region.

  - The values used for the assertion were sampled earlier in
    the Preponed region.

  - Therefore:

        Preponed → Sample
        Observed → Evaluate assertion

  - Example:

        property p1;
          @(posedge clk)
          a |=> b;
        endproperty

  - The assertion samples the required values at the clocking
    event and evaluates the property in the Observed region.

  ====================================================================
                    REACTIVE REGION
  ====================================================================

  - The Reactive region is associated mainly with program
    blocks and assertion action blocks.

  - When an assertion has an action block, the action can be
    executed in the Reactive region.

  - Example:

        assert property(p1)
          $display("PASS");
        else
          $display("FAIL");

  - Therefore:

        Observed  → Assertion evaluation
        Reactive → Assertion action


  ====================================================================
                  RE-INACTIVE REGION
  ====================================================================

  - Re-Inactive region is the counterpart of the Inactive region.

  - It is used for #0 delays originating from the Reactive region.

  - It is mainly associated with program-block and reactive
    testbench activity.

  ============================================================
                     RE-NBA REGION
  ============================================================

  - The Re-NBA region is the counterpart of the NBA region.

  - Non-blocking assignments generated from the Reactive
    region are scheduled for the Re-NBA region.

  - It is mainly associated with reactive testbench activity.

  ============================================================
                   POSTPONED REGION
  ============================================================

  - The Postponed region occurs at the end of the simulation
    time slot.

  - It is used for activities that must observe the final
    values for that time slot.

  - SystemVerilog system tasks such as $strobe and $monitor
    are associated with end-of-time-slot observation.

  - Therefore, the Postponed region is useful when the final
    settled values of the current time slot need to be observed.


  ============================================================
                 SIMULATION REGION FLOW
  ============================================================

  - A simplified flow of the main regions is:

        PREPONED
            ↓
        ACTIVE
            ↓
        INACTIVE
            ↓
        NBA
            ↓
        OBSERVED
            ↓
        REACTIVE
            ↓
        RE-INACTIVE
            ↓
        RE-NBA
            ↓
        POSTPONED


  ============================================================
                  ASSERTION-IMPORTANT REGIONS
  ============================================================

  - For concurrent assertions, the most important regions are:

        PREPONED
            ↓
        Sample assertion values
            ↓
        ACTIVE / INACTIVE / NBA
            ↓
        OBSERVED
            ↓
        Evaluate concurrent assertion
            ↓
        REACTIVE
            ↓
        Execute assertion action


  ============================================================
                  ASSERTION TIMING EXAMPLE
  ============================================================

        property p1;
          @(posedge clk)
          a |=> b;
        endproperty

  - At the positive edge of clk:

        1. Preponed
           → Assertion samples the required values.

        2. Active
           → RTL procedural statements execute.

        3. Inactive
           → #0 scheduled activity executes.

        4. NBA
           → Non-blocking assignments update their LHS.

        5. Observed
           → Concurrent assertion is evaluated.

        6. Reactive
           → Assertion action block can execute.


  ============================================================
                    IMPORTANT SUMMARY
  ============================================================

        PREPONED
            → Sample values for concurrent assertions.

        ACTIVE
            → Execute normal procedural activity.

        INACTIVE
            → Execute #0 delayed activity.

        NBA
            → Update non-blocking assignments.

        OBSERVED
            → Evaluate concurrent assertions.

        REACTIVE
            → Execute assertion action blocks and reactive
              testbench activity.

        RE-INACTIVE
            → Handle #0 activity from the Reactive region.

        RE-NBA
            → Handle non-blocking assignments from the
              Reactive region.

        POSTPONED
            → Observe final values at the end of the
              simulation time slot.


  ============================================================
                  KEY POINT TO REMEMBER
  ============================================================

        PREPONED → SAMPLE

        OBSERVED → EVALUATE

  ============================================================
*/


module non_overlapping_opertor_concurrent_assertion_ex;
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
  /*
  ====================================================================
             NON-OVERLAPPING IMPLICATION OPERATOR (|=>)
  ====================================================================

  - The non-overlapping implication operator is written as: |=>


  ====================================================================
                    MEANING OF |=> 
  ====================================================================

  - |=> operator specifies that when the antecedent is true at the 
    current clocking event, the consequent must be true 
    at the next clocking event.

  - Example:

        a |=> b;

  - This means:

        If a is true at the current clock edge,
        b must be true at the next clock edge.


  ============================================================
                    TIMING OF |=> 
  ============================================================

        Current Clock Edge          Next Clock Edge
               │                          │
               ▼                          ▼
             a = 1  ------------------>  b = 1
          Antecedent                  Consequent

  - The antecedent is checked at the current clocking event.

  - The consequent is checked at the next clocking event.

  - Therefore, the antecedent and consequent do not overlap
    on the same clocking event.

  - This is why |=> is called the non-overlapping implication
    operator.


  ============================================================
                  EXAMPLE WITH CLOCK
  ============================================================

        property p1;
          @(posedge clk)
          a |=> b;
        endproperty

  - At one positive edge of clk:

        a = 1

  - At the next positive edge of clk:

        b = 1

  - The assertion passes.

  - If b is not true at the next positive edge, the assertion
    fails.


  ============================================================
              |=> WITH SIMULATION REGIONS
  ============================================================

  - At the clocking event, concurrent assertion values are
    sampled in the Preponed region.

  - The property is evaluated in the Observed region.

  - For:

        a |=> b

    the assertion establishes the relationship between the
    current clocking event and the next clocking event.

  - Therefore:

        PREPONED
            → Sample assertion values

        OBSERVED
            → Evaluate the assertion

        NEXT CLOCKING EVENT
            → Check the consequent required by |=>


  ============================================================
                         KEY POINT
  ============================================================

        |=> → Non-overlapping implication

        Current clock → Antecedent
        Next clock    → Consequent

        a |=> b

        "If a is true now, b must be true at the next
         clocking event."

  ============================================================
*/


  property p1;
    @(posedge clk)
    a |=> b;
  endproperty

  l1:assert property(p1)
    $display("assertion sucess [%0t],a=%0d,b=%0d",$time,a,b);
    
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 

  initial #200 $finish;
  
endmodule





