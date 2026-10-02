/*
  ============================================================
              NON-BLOCKING EVENT TRIGGER (->>)
  ============================================================

  - The non-blocking event trigger is used to trigger an event
    using the ->> operator.

        ->> e1;

  - Unlike ->, the event is not triggered immediately.

  - ->> schedules the event trigger for the non-blocking
    region of the same simulation time slot.

  - This allows processes that reach @(e1) in the same time
    slot to start waiting before the event is triggered.

  - Therefore, ->> helps avoid the missed-event problem that
    can occur with -> and @(event) when both happen at the
    same simulation time.

  - Therefore:

        ->  → Event is triggered immediately
        ->> → Event trigger is scheduled for later in the
              same simulation time slot

  ============================================================
*/

// module tb;//code1a

//   // Create an event variable that processes can use to trigger and wait
//   event event_a;

//   // Thread1: Triggers the event using "->" operator
//   initial begin
//     #20 ->event_a;
//     $display ("[%0t] Thread1: triggered event_a", $time);
//   end

//   // Thread2: Waits for the event using "@" operator
//   initial begin
//     $display ("[%0t] Thread2: waiting for trigger ", $time);
//     @(event_a);
//     $display ("[%0t] Thread2: received event_a trigger ", $time);
//   end

//   // Thread3: Waits for the event using ".triggered"
//   initial begin
//     $display ("[%0t] Thread3: waiting for trigger ", $time);
//     wait(event_a.triggered);
//     $display ("[%0t] Thread3: received event_a trigger", $time);
//   end
// endmodule
 




// module tb;//code1b

//   // Create an event variable that processes can use to trigger and wait
//   event event_a;

//   // Thread1: Triggers the event using "->" operator at 20ns
//   initial begin
//     #20 ->event_a;
//     $display ("[%0t] Thread1: triggered event_a", $time);
//   end

//   // Thread2: Starts waiting for the event using "@" operator at 20ns
//   initial begin
//     $display ("[%0t] Thread2: waiting for trigger ", $time);
//     #20 @(event_a);
//     $display ("[%0t] Thread2: received event_a trigger ", $time);
//   end

//   // Thread3: Starts waiting for the event using ".triggered" at 20ns
//   initial begin
//     $display ("[%0t] Thread3: waiting for trigger ", $time);
//     #20 wait(event_a.triggered);
//     $display ("[%0t] Thread3: received event_a trigger", $time);
//   end
// endmodule





// module tb;//code1c

//   // Create an event variable that processes can use to trigger and wait
//   event event_a;

//   // Thread2: Starts waiting for the event using "@" operator at 20ns
//   initial begin
//     $display ("[%0t] Thread2: waiting for trigger ", $time);
//     #20 @(event_a);
//     $display ("[%0t] Thread2: received event_a trigger ", $time);
//   end
  
  
//   // Thread1: Triggers the event using "->" operator at 20ns
//   initial begin
//     #18 ->event_a;
//     $display ("[%0t] Thread1: triggered event_a", $time);
//   end

//   // Thread3: Starts waiting for the event using ".triggered" at 20ns
//   initial begin
//     $display ("[%0t] Thread3: waiting for trigger ", $time);
//     #22 wait(event_a.triggered);
//     $display ("[%0t] Thread3: received event_a trigger", $time);
//   end
// endmodule



module non_blocking_event_trigger_ex();
  event e1;

  task process_A();
    $display("@%0t: process_A: Before triggering event e1 using ->>", $time);
    ->>e1;
    $display("@%0t: process_A: After triggering event e1 using ->>", $time);
  endtask
  
  task process_B();
    $display("@%0t: process_B: waiting for the event e1", $time);
    @(e1.triggered);
    $display("@%0t: process_B: event e1 is triggered", $time);
  endtask

  initial begin
    fork
      process_A();
      process_B();
    join
  end
endmodule
