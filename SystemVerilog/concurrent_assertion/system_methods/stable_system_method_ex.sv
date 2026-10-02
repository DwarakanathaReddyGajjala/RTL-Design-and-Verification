// Code your testbench here
// or browse Examples
/*
  ============================================================
                        $stable SYSTEM METHOD
  ============================================================

  $stable() is a SystemVerilog Assertion system method used to
  check whether a signal has remained unchanged between the
  current and previous clocking events.

  1. BASIC SYNTAX
  ------------------------------------------------------------
  $stable(signal)

  $stable(signal) returns TRUE when the current sampled value
  of the signal is the same as its previous sampled value.


  2. HOW $stable() WORKS
  ------------------------------------------------------------
  - The signal is sampled at the clocking event.
  - The current sampled value is compared with the previous
    sampled value.
  - If both values are the same, $stable() returns TRUE.
  - If the values are different, $stable() returns FALSE.


  3. EXAMPLE
  ------------------------------------------------------------
  property p1;
    @(posedge clk)
    $stable(a) |=> b;
  endproperty

  Meaning:

  If 'a' remains unchanged between the previous and current
  clocking events, then 'b' must be TRUE at the next
  clocking event.

  $stable(a) → Checks whether 'a' remained unchanged
  |=>        → Checks the consequent at the next clock


  4. EXAMPLE OF SAMPLED VALUES
  ------------------------------------------------------------

  Previous sampled value    Current sampled value
          1                         1
          ↓                         ↓
                $stable(a) = TRUE


  Previous sampled value    Current sampled value
          0                         1
          ↓                         ↓
                $stable(a) = FALSE


  Previous sampled value    Current sampled value
          0                         0
          ↓                         ↓
                $stable(a) = TRUE


  5. $stable() WITH IMPLICATION
  ------------------------------------------------------------
  $stable(a) |-> b

  If 'a' is stable, 'b' must be TRUE at the SAME clock.

  $stable(a) |=> b

  If 'a' is stable, 'b' must be TRUE at the NEXT clock.


  6. IMPORTANT POINT
  ------------------------------------------------------------
  $stable() checks the sampled value at the current clock
  against the sampled value at the previous clock.

  It does not mean that the signal must always remain at
  the same value throughout the entire simulation.


  7. RELATED SYSTEM METHODS
  ------------------------------------------------------------
  $rose()    → Detects a rising transition (0 → 1)
  $fell()    → Detects a falling transition (1 → 0)
  $stable()  → Checks whether a value remains unchanged
  $changed() → Checks whether a value changed
  $past()    → Gets a value from a previous clocking event

  ============================================================
*/
module stable_system_method_ex;
  bit a,b;
  bit clk; 
  
  always #5 clk = ~clk;
 
  initial begin 
    a = 0; b = 1; clk = 0;
    @(posedge clk);//#5
    a = 1;
    @(posedge clk);//#15
    a = 1;
    @(posedge clk);//#25
    a = 0;
    @(posedge clk);//#35
    a = 0;
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
    @(posedge clk) $stable(a) |=> b;
  endproperty
  
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 
  
  A1: assert property(p1) $display($time,"assertion pass");
    
endmodule 
