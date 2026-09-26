// Code your testbench here
// or browse Examples
module procedural_blocking_tb1;
  
  reg  [1:0] a,b,c,d ;
  
  /*
  ============================================================
              PROCEDURAL BLOCKING ASSIGNMENT
  ============================================================


  1. always @(*):

     - The always block is triggered when any signal present on
       the RHS of a statement inside the block changes.

     - In this code, a and b are present on the RHS of:

         a = b;
         b = a;

       Therefore, change in a or b can trigger the always block.

     - When the always block is triggered, it is scheduled to
       execute. It does not immediately interrupt another
       procedural block that is currently executing.


  2. Blocking Assignment (=):

     - Blocking assignments execute one statement at a time.
     - The value is updated immediately.
     - The next statement sees the updated value.

       Example: a = b; b = a;

       If:   a = 0; b = 1;
       Then: a = b;    // a becomes 1 immediately
             b = a;    // b gets the new value of a, which is 1
       Final values: a = 1;b = 1;


  3. #0 Timing Control:

     - #0 does not advance the simulation time.
     - It suspends the current procedural block here and
       resumes it later.
     - The next statement is moved to the Inactive region.
     - This allows pending Active-region events, such as a
       triggered always block, to execute before the procedural
       block resumes.

       Example:

         a = 0; b = 1;
         #0;
         a = 2;b = 3;

       - The initial block first executes a = 0 and b = 1.
       - These changes trigger the always block.
       - The initial block continues until it reaches #0.
       - At #0, the initial block suspends.
       - The triggered always block gets a chance to execute.
       - After the pending Active-region events are completed,
         the initial block resumes and executes a = 2 and b = 3.


  4. Triggering and Execution:

     - A change in a signal present on the RHS can trigger the
       always block.
     - Triggering the always block does not mean that it executes
       immediately.
     - The triggered always block is scheduled to execute.
     - The currently executing procedural block continues until
       it reaches a timing control such as #0 or until it finishes.

       Therefore:

         RHS signal changes
                ↓
         always is triggered
                ↓
         always is scheduled
                ↓
         current procedural block continues
                ↓
         current block suspends or finishes
                ↓
         scheduled always block executes


  5. Blocking Assignment Can Trigger always Again:

     - The always block itself can change a signal that is present
       on the RHS of the always block.

       Example:

         a = b;
         b = a;

     - Suppose:

         a = 0;
         b = 1;

     - During the first execution:

         a = b;    // a changes from 0 to 1
         b = a;    // b remains 1

     - The change in a triggers the always block again.

     - The first execution finishes before the newly triggered
       execution gets its turn.

     - The second execution sees:

         a = 1;
         b = 1;

     - Therefore:

         a = b;    // no change
         b = a;    // no change

     - Since there is no further value change, the always block
       does not trigger again.


  6. First #0 Execution Flow:

     - The initial block starts.

     - It executes:

         a = 0;
         b = 1;

     - These changes trigger the always block.

     - The initial block continues executing because the triggered
       always block does not immediately interrupt it.

     - The initial block prints:

         before 1st inactive statement in intial block

     - It then reaches:

         #0;

     - The initial block suspends at #0.

     - The triggered always block gets its chance to execute.

     - It starts with:

         a = 0;
         b = 1;

     - It executes:

         a = b;    // a becomes 1
         b = a;    // b remains 1

     - The change in a triggers the always block again.

     - After the first execution finishes, the second execution
       runs with:

         a = 1;
         b = 1;

     - No further values change.


  7. Why always Does Not Immediately Execute with a = 2, b = 3:

     - After the first #0, the initial block resumes.

     - It executes:

         a = 2;
         b = 3;

     - These changes trigger the always block.

     - However, the initial block is still executing.

     - Therefore, the triggered always block does not immediately
       interrupt the initial block.

     - The initial block continues:

         $display("after 1st inactive statement...");
         $display("before 2nd inactive statement...");

         a = 0;
         b = 2;

     - These assignments also trigger the always block.

     - The initial block then reaches the second:

         #0;

     - The initial block suspends.

     - The pending always block now gets its chance to execute.

     - At this time, the current values are:

         a = 0;
         b = 2;

     - Therefore, the always block sees:

         a = 0;
         b = 2

       and not:

         a = 2;
         b = 3.


  8. $display:

      - $display prints the values when the statement is executed.
      - It executes only once for that particular statement.
      - It does not continuously monitor the signals.

      Example:

        $display($time,"display : a=%0d,b=%0d",a,b);

      - The current values of a and b are printed at the point
        where the statement is executed.


  9. $monitor:

      - $monitor continuously watches the signals given to it.
      - It prints when any of the monitored signals changes.
      - Only one $monitor can be active at a time.
      - A new $monitor replaces the previously active $monitor.

      In this code:

        initial
          $monitor($time,"display : a=%0d,b=%0d",a,b);

      - The monitor continuously watches a and b.
      - When their values change, it reports the updated values.


  ============================================================
                    MAIN POINTS TO REMEMBER
  ============================================================

  - always @(*) is triggered when a signal present on the RHS
    changes.

  - Triggering the always block does not mean that it executes
    immediately.

  - The triggered always block is scheduled to execute.

  - The currently executing procedural block continues executing.

  - #0 suspends the current procedural block here and resumes
    it later.

  - #0 allows pending events to execute before the procedural
    block continues.

  - A procedural block can also finish, after which pending
    events can execute.

  - Blocking assignment (=) updates the value immediately.

  - A value change caused inside the always block can trigger
    the same always block again.

  - Therefore, for this code:

      a = 2, b = 3
            ↓
      always is triggered
            ↓
      initial block continues
            ↓
      a = 0, b = 2
            ↓
      #0
            ↓
      initial block suspends
            ↓
      always executes
            ↓
      always sees a = 0, b = 2


  ============================================================
*/
  

   
  always @ (*) begin // code1b
    $display ("Start of always block");
    $monitor($time,"display : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    a = b; b = a;
    $monitor($time,"display : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    $display ("end of always block");
  end 
  
  initial begin 
    $display ("Start of initial block"); 
    a = 0; b = 1;
    $display ("before 1st inactive statement in intial block");
    #0;
    a = 2; b = 3; $display ("after 1st inactive statement in intial block"); 
    $display ("before 2nd inactive statement in intial block");
    a = 0; b = 2; 
    $display ("after 2nd inactive statement in intial block"); 
    $display ("before 3nd inactive statement in intial block");
    #0;
    a = 1; b = 3;
    $display ("after 3nd inactive statement in intial block");
    $display ("before 4nd inactive statement in intial block"); 
    a = 3; b = 0;
    $display ("after 4nd inactive statement in intial block"); 
    $display ("end of initial block"); 
  end 
  
  initial $monitor($time,"a=%0d,b=%0d",a,b);
   
    
endmodule   
