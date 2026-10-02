// Code your testbench here
// or browse Examples
/*
  ============================================================
                        $past SYSTEM METHOD
  ============================================================

  $past() is a SystemVerilog Assertion system method used to
  access the sampled value of a signal from a previous
  clocking event.

  1. BASIC SYNTAX
  ------------------------------------------------------------
  $past(expression)

  $past(expression, number_of_clocks)

  - $past(expression) returns the value sampled at the
    previous clocking event.
  - $past(expression, N) returns the value sampled N clocking
    events earlier.


  2. HOW $past() WORKS
  ------------------------------------------------------------
  The value is taken from the assertion's sampled values.

  Example:

  Current clock       → $past(a,1) → value of 'a' one clock ago
  Current clock       → $past(a,2) → value of 'a' two clocks ago
  Current clock       → $past(a,4) → value of 'a' four clocks ago


  3. EXAMPLE
  ------------------------------------------------------------
  property p1;
    @(posedge clk)
    a |=> $past(!a,4);
  endproperty

  Meaning:

  If 'a' is TRUE at the current clocking event, then at the
  next clocking event, the value of '!a' sampled four clocks
  earlier must be TRUE.


  4. $past() WITH AN EXPRESSION
  ------------------------------------------------------------
  $past(!a,4)

  Here, the expression is:

      !a

  and the sampling delay is:

      4 clocking events

  Therefore, it checks the sampled value of '!a' from
  four clocks earlier.


  5. IMPORTANT POINT
  ------------------------------------------------------------
  $past() uses SAMPLED VALUES.

  It does not directly read the current value of the signal
  from the RTL.

  The value is taken from a previous clocking event according
  to the specified number of clocks.


  6. DEFAULT DELAY
  ------------------------------------------------------------
  $past(a)

  is equivalent to:

  $past(a,1)

  Both access the sampled value of 'a' from one clocking
  event earlier.


  7. EXAMPLES
  ------------------------------------------------------------

  $past(a,1)
  → Value of 'a' one clock ago.

  $past(a,2)
  → Value of 'a' two clocks ago.

  $past(a,4)
  → Value of 'a' four clocks ago.


  8. KEY POINT
  ------------------------------------------------------------
  $past()   → Gets a value from a previous clocking event.
  $rose()   → Detects a rising transition (0 → 1).
  $fell()   → Detects a falling transition (1 → 0).
  $stable() → Checks whether a value remains unchanged.
  $changed()→ Checks whether a value changed.

  ============================================================
*/
module past_system_method_ex;
  bit a,b;
  bit clk;
  
  always #5 clk = ~clk;
 
  initial begin 
    clk = 0; 
    repeat(20) begin 
      a = $random(); 
      b = $random();
     @(posedge clk);
    end 
    #10 $finish;
  end 
  
  property p1;
    @(posedge clk) a |=> $past(!a,4);
  endproperty
  
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 
  
  A1: assert property(p1) $display($time,"assertion pass");
    
endmodule 
