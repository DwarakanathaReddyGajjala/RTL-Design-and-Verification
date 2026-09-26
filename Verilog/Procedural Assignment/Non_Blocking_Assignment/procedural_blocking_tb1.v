// Code your testbench here
// or browse Examples
module procedural_blocking_tb;
  
  reg  [1:0] a,b,c,d ;  
  
  /*
  ============================================================
       NON-BLOCKING ASSIGNMENT (<=) — NON-HUNG STATE
  ============================================================

  1. Initial Block:
     - Initially, a=0 and b=1.
     - #0 suspends the initial block temporarily.

  2. always @(*):
     - The always block starts with a=0 and b=1.
     - a <= b and b <= a schedule the values a=1 and b=0
       for the NBA region.

  3. $display:
     - $display executes immediately.
     - Therefore, it displays the old values a=0,b=1.

  4. #1 Timing Control:
     - #1 suspends the always block here.
     - It will resume after 1 simulation time unit.

  5. Initial Block Continues:
     - After #0, the initial block resumes.
     - It changes a=2 and b=3.
     - Then the initial block finishes.

  6. NBA Update:
     - The previously scheduled NBA assignments are applied:
           a=1, b=0
     - The updated values are seen by $monitor and $strobe.

  7. Time 1:
     - After #1, the suspended always block resumes.
     - It prints the "end of always block" message.

  ============================================================
*/
  
  always @ (*)  begin    // code1B
    $display ("Start of always block");
    $display($time,"display before non_blocking statemts : a=%0d,b=%0d",a,b);
    a <= b;
    b <= a;
    $strobe ($time,"strobe : a=%0d,b=%0d",a,b);
    $display($time,"display after non_blocking statemts : a=%0d,b=%0d",a,b); 
    #1;
    $display($time,"display : end of always block");
  end  
  
  initial begin
    $display ("Start of initial block");
    a = 0; b = 1; 
    $display ("before inactive statement in intial block");
    #0;
    $display($time,"after inactive statement in intial block a=%0d,b=%0d",a,b);
    a = 2; b = 3;
    $display($time,"after inactive statement in intial block a=%0d,b=%0d",a,b);
    $display ("end of initial block");
  end
  initial
    $monitor($time,"MONITOR:a=%0d,b=%0d",a,b);
  
endmodule   
