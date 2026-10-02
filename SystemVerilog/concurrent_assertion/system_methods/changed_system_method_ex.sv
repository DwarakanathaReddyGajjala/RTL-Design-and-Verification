// Code your testbench here
// or browse Examples
/*
  ============================================================
                       $changed SYSTEM METHOD
  ============================================================

  $changed() is a SystemVerilog Assertion system method used
  to check whether a signal has changed between the current
  and previous clocking events.

  1. BASIC SYNTAX
  ------------------------------------------------------------
  $changed(signal)

  $changed(signal) returns TRUE when the current sampled value
  of the signal is different from its previous sampled value.


  2. HOW $changed() WORKS
  ------------------------------------------------------------
  - The signal is sampled at the clocking event.
  - The current sampled value is compared with the previous
    sampled value.
  - If the values are different, $changed() returns TRUE.
  - If the values are the same, $changed() returns FALSE.


  3. EXAMPLE
  ------------------------------------------------------------
  property p1;
    @(posedge clk)
    $changed(a) |=> b;
  endproperty

  Meaning:

  If 'a' changes between the previous and current clocking
  events, then 'b' must be TRUE at the next clocking event.

  $changed(a) → Checks whether 'a' changed
  |=>         → Checks the consequent at the next clock


  4. EXAMPLE OF SAMPLED VALUES
  ------------------------------------------------------------

  Previous sampled value    Current sampled value
          0                         1
          ↓                         ↓
                $changed(a) = TRUE


  Previous sampled value    Current sampled value
          1                         0
          ↓                         ↓
                $changed(a) = TRUE


  Previous sampled value    Current sampled value
          1                         1
          ↓                         ↓
                $changed(a) = FALSE


  Previous sampled value    Current sampled value
          0                         0
          ↓                         ↓
                $changed(a) = FALSE


  5. $changed() WITH IMPLICATION
  ------------------------------------------------------------
  $changed(a) |-> b

  If 'a' changes, 'b' must be TRUE at the SAME clock.

  $changed(a) |=> b

  If 'a' changes, 'b' must be TRUE at the NEXT clock.


  6. IMPORTANT POINT
  ------------------------------------------------------------
  $changed() detects BOTH types of transitions:

  0 → 1  → Changed
  1 → 0  → Changed

  Therefore:

  $rose()   → Only 0 → 1
  $fell()   → Only 1 → 0
  $changed()→ 0 → 1 OR 1 → 0
  $stable() → No change


  7. RELATED SYSTEM METHODS
  ------------------------------------------------------------
  $rose()    → Detects a rising transition (0 → 1)
  $fell()    → Detects a falling transition (1 → 0)
  $stable()  → Checks whether a value remains unchanged
  $changed() → Checks whether a value changed
  $past()    → Gets a value from a previous clocking event

  ============================================================
*/
module changed_system_method_ex;
  bit a,b; 
  bit clk;
  
  always #5 clk = ~clk;
 
  initial begin 
    a = 1; b = 1; clk = 0;
    @(posedge clk);//#5
    a = 0;
    @(posedge clk);//#15
    a = 1;
    @(posedge clk);//#25
    a = 0;
    @(posedge clk);//#35
    a = 1;
    @(posedge clk);//45
    a = 0;
    @(posedge clk);//#55
    a = 1;
    @(posedge clk);//#65
    a = 0;
    @(posedge clk);//#75
    a = 1;
    @(posedge clk);//85
    #10 $finish;
  end 
  
  property p1;
    @(posedge clk) $changed(a) |=> b;
  endproperty
  
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 
  
  A1: assert property(p1) $display($time,"assertion pass");
    
endmodule 
