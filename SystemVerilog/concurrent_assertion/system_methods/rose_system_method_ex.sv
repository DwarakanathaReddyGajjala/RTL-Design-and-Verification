// Code your testbench here
// or browse Examples
/*
  ============================================================
                         $rose SYSTEM METHOD
  ============================================================

  $rose() is a SystemVerilog Assertion system method used to
  detect a rising edge of a signal.

  1. BASIC SYNTAX
  ------------------------------------------------------------
  $rose(signal)

  $rose(signal) returns TRUE when the sampled value of the
  signal changes from 0 to 1 compared with the previous
  clocking event.


  2. HOW $rose() WORKS
  ------------------------------------------------------------
  - The signal is sampled at the clocking event.
  - The current sampled value is compared with the previous
    sampled value.
  - If the previous value was 0 and the current value is 1,
    $rose() returns TRUE.
  - Otherwise, $rose() returns FALSE.


  3. EXAMPLE
  ------------------------------------------------------------
  property p1;
    @(posedge clk)
    $rose(a) |=> b;
  endproperty

  Meaning:

  If 'a' changes from 0 to 1 at the current clocking event,
  then 'b' must be TRUE at the next clocking event.

  $rose(a) → Detects 0 → 1 transition of 'a'
  |=>      → Checks the consequent at the next clock


  4. IMPORTANT POINT
  ------------------------------------------------------------
  $rose() works with SAMPLED values.

  It does not simply check whether the signal is currently 1.

  Example:

  Previous sampled value    Current sampled value
          0                         1
          ↓                         ↓
                  $rose(a) = TRUE


  Previous sampled value    Current sampled value
          1                         1
          ↓                         ↓
                  $rose(a) = FALSE


  5. $rose() WITH IMPLICATION
  ------------------------------------------------------------
  $rose(a) |-> b

  If 'a' rises, 'b' must be TRUE at the SAME clock.

  $rose(a) |=> b

  If 'a' rises, 'b' must be TRUE at the NEXT clock.


  6. KEY POINT
  ------------------------------------------------------------
  $rose() → Detects a rising transition (0 → 1)
  $stable() → Checks whether a value remains unchanged
  $changed() → Checks whether a value changed
  $fell() → Detects a falling transition (1 → 0)
  $past() → Gets a value from a previous clocking event

  ============================================================
*/
module $rose_system_method_ex;
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
    @(posedge clk) $rose(a) |=> b;
  endproperty
  
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 
  
  A1: assert property(p1) $display($time,"assertion pass");
    
endmodule 
