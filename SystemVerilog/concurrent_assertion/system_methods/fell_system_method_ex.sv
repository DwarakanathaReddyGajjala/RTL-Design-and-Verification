// Code your testbench here
// or browse Examples
/*
  ============================================================
                         $fell SYSTEM METHOD
  ============================================================

  $fell() is a SystemVerilog Assertion system method used to
  detect a falling edge of a signal.

  1. BASIC SYNTAX
  ------------------------------------------------------------
  $fell(signal)

  $fell(signal) returns TRUE when the sampled value of the
  signal changes from 1 to 0 compared with the previous
  clocking event.


  2. HOW $fell() WORKS
  ------------------------------------------------------------
  - The signal is sampled at the clocking event.
  - The current sampled value is compared with the previous
    sampled value.
  - If the previous value was 1 and the current value is 0,
    $fell() returns TRUE.
  - Otherwise, $fell() returns FALSE.


  3. EXAMPLE
  ------------------------------------------------------------
  property p1;
    @(posedge clk)
    $fell(a) |=> b;
  endproperty

  Meaning:

  If 'a' changes from 1 to 0 at the current clocking event,
  then 'b' must be TRUE at the next clocking event.

  $fell(a) → Detects 1 → 0 transition of 'a'
  |=>      → Checks the consequent at the next clock


  4. IMPORTANT POINT
  ------------------------------------------------------------
  $fell() works with SAMPLED values.

  It does not simply check whether the signal is currently 0.

  Example:

  Previous sampled value    Current sampled value
          1                         0
          ↓                         ↓
                  $fell(a) = TRUE


  Previous sampled value    Current sampled value
          0                         0
          ↓                         ↓
                  $fell(a) = FALSE


  5. $fell() WITH IMPLICATION
  ------------------------------------------------------------
  $fell(a) |-> b

  If 'a' falls, 'b' must be TRUE at the SAME clock.

  $fell(a) |=> b

  If 'a' falls, 'b' must be TRUE at the NEXT clock.


  6. KEY POINT
  ------------------------------------------------------------
  $rose()   → Detects a rising transition (0 → 1)
  $fell()   → Detects a falling transition (1 → 0)
  $stable() → Checks whether a value remains unchanged
  $changed()→ Checks whether a value changed
  $past()   → Gets a value from a previous clocking event

  ============================================================
*/
module fell_system_method_ex;
  bit a,b;
  bit clk; 
  
  always #5 clk = ~clk;
 
  initial begin 
    a = 0; b = 1; clk = 0;
    @(posedge clk);//#5
    a = 1;
    @(posedge clk);//#15
    a = 0;
    @(posedge clk);//#25
    a = 1;
    @(posedge clk);//#35
    a = 0;
    @(posedge clk);//45
    a = 1;
    @(posedge clk);//#55
    a = 0;
    @(posedge clk);//#65
    a = 1;
    @(posedge clk);//#75
    a = 0;
    @(posedge clk);//85
    #10 $finish;
  end 
  
  property p1;
    @(posedge clk) $fell(a) |=> b;
  endproperty

  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 
  
  A1: assert property(p1) $display($time,"assertion pass");
endmodule 
