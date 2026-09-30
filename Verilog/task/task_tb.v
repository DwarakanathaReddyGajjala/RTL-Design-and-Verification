// Code your testbench here
// or browse Examples


/*
  ============================================================
                           TASKS
  ============================================================

  - A task is a reusable block of statements used to perform
    a specific operation.

  - A task can contain timing controls such as #, @, wait,
    posedge, and negedge.

  - A task can have input, output, and inout arguments.

  - A task does not have a direct return value, but values can
    be passed back using output or inout arguments.

  ============================================================
*/


module task_tb;

  integer a1, a2;


  /*
    ============================================================
                    CODE 1 — BASIC TASK
    ============================================================

    - The task accepts input arguments b and c and provides
      the result through the output argument d.

    - The output argument is used to pass the calculated value
      back to the calling block.

    - The task does not have a direct return value like a
      function.

    - A task executes in the same simulation time when no
      timing control is present.

    ============================================================
  */


  task add;
    input integer b, c;
    output integer d;
    begin
      d = b + c;
    end
  endtask


  initial begin
    add(100,200,a1);
    $monitor("a1 = %0d", a1);
  end



  /*
    ============================================================
              CODE 2 — TASK WITH TIME DELAY
    ============================================================

    - A task can contain timing controls such as # delay.

    - The task execution is suspended for the specified
      simulation time.

    - The output argument receives its value after the delay
      is completed.

    - Multiple calls to a task execute sequentially when they
      are made from the same procedural block.

    ============================================================
  */


  // task add;
  //   input integer b, c;
  //   output integer d;
  //   begin
  //     #5 d = b + c;
  //   end
  // endtask


  // initial begin
  //   add(100,200,a1);
  //   add(150,250,a2);
  // end


  // initial
  //   $monitor($time,
  //            "a1=%d,a2=%d",
  //            a1,a2);



  /*
    ============================================================
          CODE 3A — STATIC TASK WITH PARALLEL CALLS
    ============================================================

    - A task is static by default, so its local variables are
      shared between active invocations.

    - The fork...join statement starts both task calls
      concurrently.

    - Both task calls contain a #5 delay and therefore remain
      active at the same time.

    - This allows us to observe the behavior of a static task
      when multiple calls are active together.

    ============================================================
  */


  // task add;
  //   input integer b, c;
  //   output integer d;
  //   begin
  //     #5 d = b + c;
  //   end
  // endtask


  // initial begin
  //   fork
  //     add(100,200,a1);
  //     add(150,250,a2);
  //   join
  // end


  // initial
  //   $monitor($time,
  //            "a1=%d,a2=%d",
  //            a1,a2);



  /*
    ============================================================
        CODE 3B — AUTOMATIC TASK WITH PARALLEL CALLS
    ============================================================

    - The task is declared as automatic, so each active task
      invocation gets its own storage.

    - The fork...join statement starts both task calls
      concurrently.

    - Each invocation therefore has separate storage for its
      local variables.

    - Automatic tasks are useful when multiple invocations
      must operate independently.

    ============================================================
  */


  // task automatic add;
  //   input integer b, c;
  //   output integer d;
  //   begin
  //     #5 d = b + c;
  //   end
  // endtask


  // initial begin

  //   fork
  //     add(100,200,a1);
  //     add(150,250,a2);
  //   join

  // end


  // initial
  //   $monitor($time,
  //            "a1=%d,a2=%d",
  //            a1,a2);



  /*
    ============================================================
          CODE 3C — STATIC TASK WITH REVERSED CALL ORDER
    ============================================================

    - The task is static by default, so its local variables are
      shared between active invocations.

    - The fork...join statement starts both task calls
      concurrently.

    - The order of the task calls is reversed compared with
      Code 3A.

    - This experiment helps observe the effect of concurrent
      calls on a static task.

    ============================================================
  */


  // task add;
  //   input integer b, c;
  //   output integer d;
  //   begin
  //     #5 d = b + c;
  //   end
  // endtask


  // initial begin
  //   fork
  //     add(150,250,a2);
  //     add(100,200,a1);
  //   join
  // end


  // initial
  //   $monitor($time,
  //            "a1=%d,a2=%d",
  //            a1,a2);



  /*
    ============================================================
              CODE 4 — STATIC TASK LOCAL VARIABLE
    ============================================================

    - A task is static by default when the automatic keyword
      is not specified.

    - The local variable i therefore uses shared storage for
      the task.

    - Multiple calls to the task use the same static variable.

    - This example demonstrates the default static nature of
      a task.

    ============================================================
  */


  // initial display();
  // initial display();
  // initial display();
  // initial display();


  // task display();
  //   integer i = 0;
  //   begin
  //     i = i + 1;
  //     $display("i=%0d", i);
  //   end
  // endtask



  /*
    ============================================================
                    TASK — KEY POINTS
    ============================================================

    - A task can contain timing controls such as #, @, wait,
      posedge, and negedge.

    - A task can have input, output, and inout arguments.

    - A task does not have a direct return value, but output
      and inout arguments can be used to pass values back.

    - A task is static by default and becomes automatic when
      the automatic keyword is specified.

    - Multiple statements can be written directly between
      task and endtask without using begin...end.

    ============================================================
  */


endmodule
