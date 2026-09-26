// Code your testbench here
// or browse Examples
module procedural_blocking_tb;
  
  reg  [1:0] a,b,c,d ;
  
  /*
  ============================================================
              PROCEDURAL BLOCKING ASSIGNMENT
  ============================================================

  1. always @(*):
     - The always block is triggered when any signal present on
       the RHS of a statement inside the block changes.

  2. Blocking Assignment (=):
     - Executes one statement at a time.
     - The value is updated immediately.
     - The next statement sees the updated value.

       Example:
         a = b;
         b = a;

       First, a gets the value of b.
       Then, b gets the new value of a.

  3. #2:
     - Pauses the initial block for 2 simulation time units.
     - After 2 time units, the initial block continues.

  4. $display:
     - Prints the values when the statement is executed.
     - Each $display prints only once when it is reached.

  5. $monitor:
     - Continuously watches the given signals.
     - Prints when any of the watched signals changes.
     - Only one $monitor can be active at a time.
     - A new $monitor replaces the previous one.

  6. Execution Flow:
     - The initial block starts and assigns a = 0.
     - The change in a triggers the always block, but the always
       block does not execute immediately because the initial block
       is still executing.
     - The initial block continues with b = 1, c = 2, and d = 3.
     - It then reaches #2 and suspends.
     - The triggered always block now executes.
     - Inside the always block, a = b and b = a are executed
       using blocking assignments, so the values change immediately.
     - If a, b, c, or d changes, the always block is triggered again.
     - After the always block completes, the newly triggered
       always block gets its turn.
     - Once there are no more changes to a, b, c, or d, the
       always block stops executing.
     - The initial block resumes after #2 and follows the same
       process for the next group of assignments.

  ============================================================
*/

  always @ (*) begin  
    $display ("Start of always block");
    $monitor($time,"monitor_always : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    $display($time,"display : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    a = b;
    b = a;
    c = d;
    d = c;
    $display($time,"display : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    $display ("end of always block");

  end 
  
  initial begin 
       $display ("active region at=[%0t] of  intial block",$time);
       a = 0; b = 1; c = 2; d = 3;
       $display ("end of active region at=[%0t] of  intial block",$time);
    #2;
       $display ("active region at=[%0t] of  intial block",$time);
       a = 2; b = 3; c = 0; d = 1;
       $display ("end of active region at=[%0t] of  intial block",$time);
    #2;
       $display ("active region at=[%0t] of  intial block",$time);
       a = 0; b = 2; c = 1; d = 3;
       $display ("end of active region at=[%0t] of  intial block",$time);
    #2;
       $display ("active region at=[%0t] of  intial block",$time);
       a = 1; b = 3; c = 0; d = 2;
       $display ("end of active region at=[%0t] of  intial block",$time);
    #2;
       $display ("active region at=[%0t] of  intial block",$time);
       a = 3; b = 0; c = 2; d = 1;
       $display ("end of active region at=[%0t] of  intial block",$time);
  end
  
  initial  
    $monitor($time,"monitor_initial : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
     
endmodule   
