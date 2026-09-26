// Code your testbench here
// or browse Examples
module procedural_non_blocking_tb;

  reg  [1:0] a,b,c,d ;
  
  /*
  ============================================================
       NON-BLOCKING ASSIGNMENT (<=) — COMMON CONCEPT
  ============================================================

  1. Non-Blocking Assignment:
     - The RHS values are evaluated immediately, but the LHS
       signals are updated later in the NBA region.
     - Therefore, the statements

         a <= b;
         b <= a;
         c <= d;
         d <= c;

       exchange the values of a and b, and c and d after the
       NBA update.

  2. always @(*) Feedback:
     - The signals a, b, c, and d are present on the RHS of
       the always block.
     - Therefore, when their values change due to NBA updates,
       the always block is triggered again.

  3. $display and $strobe:
     - $display executes immediately in the Active region, so
       it sees the old values before the NBA update.
     - $strobe prints at the end of the current simulation
       time step, so it can observe the values after the NBA
       update.

  ============================================================
                     HUNG STATE — CODE 1A
  ============================================================

  - There is no timing control inside the always block.
  - NBA updates trigger the same always block again at the
    same simulation time.
  - The values keep alternating:

        a=0,b=1,c=2,d=3
                 ↓
        a=1,b=0,c=3,d=2
                 ↓
        a=0,b=1,c=2,d=3
                 ↓
                      ...

  - The signals never reach a stable value.
  - Continuous zero-time activity keeps the simulator busy
    at time 0.
  - Therefore, simulation time cannot advance.
  - The initial block cannot reach its #2 delay.
  - $strobe may not print because the current simulation time
    step never completes.

  ============================================================
                  NON-HUNG STATE — CODE 1B
  ============================================================

  - A #1 timing control is added at the end of the always block.
  - The #1 suspends the current procedural block here and
    resumes it 1 simulation time unit later.
  - Therefore, the repeated executions are separated by
    simulation time instead of continuously occurring at
    the same time.
  - The feedback still exists and the values may continue
    alternating, but the simulator can advance:

        time 0 → time 1 → time 2 → time 3 → ...

  - Since simulation time can advance, the initial block can
    also continue through its #2 delays.
  - The current simulation time step can complete, so $strobe
    gets a chance to print the values after the NBA update.

  ============================================================
*/
  
  // code1a--hung state
  always @ (*) begin  
    $display ("Start of always block");
    $display($time,"display before non_blocking statemts : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    a <= b;
    b <= a;
    c <= d;
    d <= c;
    $strobe ($time,"strobe  : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    $display($time,"display after non_blocking statemts : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    $display($time,"display : end of always block");
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


  //code1b..no hung state  
  //   always @ (*) begin  
  //     $display ("Start of always block");
  //     $display($time,"display before non_blocking statemts : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
  //     a <= b;
  //     b <= a;
  //     c <= d;
  //     d <= c;
  //     $strobe ($time,"strobe  : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
  //     $display($time,"display after non_blocking statemts : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
  //     #1;
  //     $display($time,"display : end of always block");
  //   end 
  //   initial begin 
  //        $display ("active region at=[%0t] of  intial block",$time);
  //        a = 0; b = 1; c = 2; d = 3;
  //        $display ("end of active region at=[%0t] of  intial block",$time);
  //     #2;
  //        $display ("active region at=[%0t] of  intial block",$time);
  //        a = 2; b = 3; c = 0; d = 1;
  //        $display ("end of active region at=[%0t] of  intial block",$time);
  //     #2;
  //        $display ("active region at=[%0t] of  intial block",$time);
  //        a = 0; b = 2; c = 1; d = 3;
  //        $display ("end of active region at=[%0t] of  intial block",$time);
  //     #2;
  //        $display ("active region at=[%0t] of  intial block",$time);
  //        a = 1; b = 3; c = 0; d = 2;
  //        $display ("end of active region at=[%0t] of  intial block",$time);
  //     #2;
  //        $display ("active region at=[%0t] of  intial block",$time);
  //        a = 3; b = 0; c = 2; d = 1;
  //        $display ("end of active region at=[%0t] of  intial block",$time);
  //   end

  //   initial  
  //     $monitor($time,"monitor_initial : a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);


endmodule   
