// Code your testbench here
// or browse Examples

/*
  ============================================================
                      $sampled SYSTEM METHOD
  ============================================================

  $sampled() is a SystemVerilog Assertion system method used
  to access the value of an expression sampled by a concurrent
  assertion.

  1. BASIC SYNTAX
  ------------------------------------------------------------
  $sampled(expression)

  It returns the value of the expression that was sampled at
  the assertion's clocking event.

  The sampling of concurrent assertions occurs in the
  PREPONED region.


  2. HOW $sampled() WORKS
  ------------------------------------------------------------
  At the assertion's clocking event:

      Preponed Region
             ↓
      Signal is sampled
             ↓
      $sampled(expression)
             ↓
      Returns the sampled value


  3. EXAMPLE
  ------------------------------------------------------------
  property p1;
    @(posedge clk)
    $sampled(a) |=> (b == a);
  endproperty

  Meaning:

  - 'a' is sampled at the current clocking event.
  - $sampled(a) gives the sampled value of 'a'.
  - |=> checks the consequent at the next clocking event.
  - At the next clock, 'b' must be equal to the sampled value
    of 'a' from the previous clock.


  4. $sampled() IN ACTION BLOCKS
  ------------------------------------------------------------
  $sampled() can also be used in assertion action blocks.

  Example:

    A1: assert property(p1)
      $display("sampled a = %0d", $sampled(a));

  Here, $sampled(a) gives the value of 'a' that was sampled
  by the assertion at its clocking event.


  5. $sampled() AND PREPONED VALUE
  ------------------------------------------------------------
  For a concurrent assertion:

    $sampled(a)

  → Gives the value of 'a' sampled at the assertion's
    clocking event.

  → The sampling occurs in the PREPONED region.

  Therefore, it represents the value of 'a' seen by the
  assertion during Preponed sampling.


  6. IMPORTANT POINT
  ------------------------------------------------------------
  $sampled() does not mean the current value of the signal
  after all updates in the current time step.

  It gives the value that was sampled by the assertion at
  its clocking event.


  7. KEY POINT
  ------------------------------------------------------------
  $sampled() → Accesses the value sampled by the assertion.

  Concurrent assertion sampling
  → Occurs in the PREPONED region.

  Therefore:

  PREPONED
      ↓
  Signal sampled
      ↓
  $sampled(expression)
      ↓
  Returns the sampled value

  ============================================================
*/
module sampled_system_method_ex;
  bit a,b;
  bit clk;
  
  always #5 clk = ~clk;
 
//   initial begin 
//     a = 1; b = 1; clk = 0; 
//     @(posedge clk);
//     @(posedge clk);a = 0;  b = 0;
//     @(posedge clk);
//     @(posedge clk);
//     @(posedge clk);a = 1;  b = 1;
//     @(posedge clk);
//     @(posedge clk);
//     @(posedge clk);a = 0;  b = 0;
//     #10 $finish;
//   end 
  
  initial begin 
    clk = 0; 
    repeat(25) begin
      a = $random();
      b = $random();
      @(posedge clk);
    end 
    #10 $finish;
  end 
  
  property p1;
    @(posedge clk) $sampled(a) |=> (b==a);
  endproperty
  
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 
  
  initial begin 
    $monitor($time,"monitor:sampled value $sampled(a)=%0d",$sampled(a)); 
    repeat(20) begin 
    $display($time,"display:sampled value $sampled(a)=%0d",$sampled(a)); 
    @(posedge clk);
    end 
  end 

  
  A1: assert property(p1) $display($time,"assertion pass");
    
endmodule 
