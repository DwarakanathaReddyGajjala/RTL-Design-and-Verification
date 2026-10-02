/*
  ============================================================
                    SYSTEMVERILOG EVENTS
  ============================================================

  - An event is used to synchronize different processes.

  - An event is declared using the event keyword:

        event a;

  - An event can be triggered using:

        -> a;

  - Two common ways to wait for an event are:

        @(a);
        wait(a.triggered);


  ============================================================
                       EVENT TRIGGER
  ============================================================

  - An event is triggered using the -> operator.

        -> a;

  - The event trigger wakes up the processes that are waiting
    for the event.

  - Therefore:

        event a;              → Event declaration
        -> a;                 → Event trigger


  ============================================================
                         EVENT CONTROL
  ============================================================

  - Both @(a) and wait(a.triggered) are used as event-control
    mechanisms to synchronize a process with an event.

        @(a);
        wait(a.triggered);


  ============================================================
                            @(a)
  ============================================================

  - @(a) waits for the event a to be triggered.

        @(a);

  - If the event is triggered before @(a) starts waiting, the
    trigger can be missed.

  - Therefore, the timing of the event trigger and @(a) is
    important.


  ============================================================
                    wait(a.triggered)
  ============================================================

  - wait(a.triggered) waits for the triggered status of the
    event.

        wait(a.triggered);

  - The triggered status can be detected in the same
    simulation time slot.

  - Therefore, it can handle a same-time-step event trigger
    that may be missed by @(a).


  ============================================================
                  @(a) vs wait(a.triggered)
  ============================================================

        @(a)
            → Waits for the event trigger.
            → Can miss the trigger if it occurs before
              @(a) starts waiting.

        wait(a.triggered)
            → Waits for the event's triggered status.
            → Can detect the trigger in the same simulation
              time slot.


  ============================================================
                         SUMMARY
  ============================================================

        event a;
            → Event declaration

        -> a;
            → Event trigger

        @(a);
            → Event control
            → Waits for event trigger

        wait(a.triggered);
            → Event control
            → Waits for triggered status

  ============================================================
*/
// module blocking_event_trigger_ex1;//code1a
//   event a;
//   initial begin
//     ->a;
//     $display("event a triggered");
//     @(a);
//     $display("wait for event trigger");
//     wait(a.triggered);
//     $display("wait for event triggered");
//   end
// endmodule


// module blocking_event_trigger_ex2;//code1b
//   event a;
//   initial begin
//     -> a;
//     $display("event a triggered");
//     wait(a.triggered);
//     $display("wait for event triggered");
//     @(a);
//     $display("wait for event trigger");
//   end
// endmodule
 

// module blocking_event_trigger_ex3;//code2a
//   event a;
//   initial begin
//     #0 -> a;
//     $display("event a triggered");
//   end

//   initial begin
//     $display(" thred2 waiting  for event trigger");
//     @(a);
//     $display("wait over for  thred2 event triggered ");
//   end 
   
//   initial begin
//     $display(" thread3 waiting  for event trigger");
//     wait(a.triggered);
//     $display("wait over for  thred3  event triggered ");
//   end
// endmodule




module blocking_event_trigger_ex4;//code2b
  event a;
  initial begin
    -> a;
    $display("event a triggered");
  end

  initial begin
    $display(" thred2 waiting  for event trigger");
    @(a);
    $display("wait over for  thred2 event triggered ");
  end 
   
  initial begin
    $display(" thread3 waiting  for event trigger");
    wait(a.triggered);
    $display("wait over for  thred3  event triggered ");
  end
endmodule




// module blocking_event_trigger_ex5;//code2c
//   event a;
//   initial begin
//     $display(" thred2 waiting  for event trigger");
//     @(a);
//     $display("wait over for  thred2 event triggered ");
//   end 
 
//   initial begin
//     -> a;
//     $display("event a triggered");
//   end
   
//   initial begin
//     $display(" thread3 waiting  for event trigger");
//     wait(a.triggered);
//     $display("wait over for  thred3  event triggered ");
//   end
// endmodule
