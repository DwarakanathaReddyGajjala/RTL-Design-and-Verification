// Code your testbench here
// or browse Examples
module procedural_non_blocking_tb;
  
  reg  [1:0] a,b,c,d ;
  
  /*
  ============================================================
          BLOCKING ASSIGNMENT AND DELAY TYPES
  ============================================================

  1. Blocking Assignment (=):
     - A blocking assignment updates the LHS immediately.
     - Statements inside the same procedural block execute
       sequentially.
     - The next statement will execute only after the current
       statement, including any timing control in that statement,
       is completed.
     - Therefore, if a blocking statement contains a delay,
       the procedural block waits until that statement is
       completed before moving to the next statement.

  2. Inter-Assignment Delay:
     - The delay is placed before the assignment.

         #3 a = b;

     - The procedural block waits for 3 time units and then
       performs the assignment.
     - The delay occurs before the assignment is executed.

  3. Intra-Assignment Delay:
     - The delay is placed inside the assignment.

         b = #2 a;

     - The RHS value is evaluated first.
     - The procedural block then waits for 2 time units.
     - After the delay, the evaluated value is assigned to
       the LHS.
     - The next statement executes only after this assignment
       is completed.

  4. Important Difference:

     Inter-Assignment:
         #3 a = b;

         Wait → Assignment

     Intra-Assignment:
         b = #2 a;

         Evaluate RHS → Wait → Assignment

  5. Non-Blocking Assignment with Delay:
     - In a statement such as:

         c <= #4 d;

       the RHS value is evaluated immediately.
     - The update of the LHS is scheduled for 4 time units
       later.
     - Similarly, the delay determines when the LHS is updated.

  6. Sequential Execution Within a Procedural Block:
     - Statements inside an initial or always block execute
       sequentially.
     - A timing control suspends that procedural block.
     - The block resumes only after the timing control is
       completed and then continues with the next statement.

  7. Concurrent Execution of Separate Blocks:
     - Separate initial and always blocks are concurrent
       processes.
     - A delay in one procedural block does not stop other
       procedural blocks from executing.
     - Each procedural block follows its own sequence of
       statements and timing controls.

  8. Simulation Time:
     - Delays do not necessarily mean that the whole simulation
       stops.
     - They suspend only the procedural block in which the
       delay occurs.
     - Other concurrent processes can continue executing while
       that block is suspended.

  ============================================================
*/
  always @ (a,b) begin  
    $display($time," entered the blocking statemets always block");
    $display($time," display1: sblocking statemets always block a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    #3 a = b;
    b = #2 a;
    $display($time," display2:blocking statemets always block a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    $display($time," end of the blocking statemets always block");
  end 
  
  always @ (*) begin 
    $display($time," entered the non blocking statemets always block");
    $display($time," display1:non blocking statemets always block a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    c <= #4 d;
    d <= #6 c;
    $display($time," display2:non blocking statemets always block a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    $display($time," end of the non blocking statemets always block");
    #7;
  end 
  
  initial begin 
    a = 0; b = 1; c = 2; d = 3;
  end
  
  initial  
    $monitor($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
  
endmodule   
