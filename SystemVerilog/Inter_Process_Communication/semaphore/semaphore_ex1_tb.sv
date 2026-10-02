/*
  ============================================================
                         SEMAPHORE
  ============================================================

  - A semaphore is a SystemVerilog IPC mechanism used to
    control access to a shared resource.

  - A semaphore contains a number of keys.

  - A process must obtain the required number of keys before
    accessing the shared resource.

  - If enough keys are not available, the process waits until
    the required keys are returned.


  ============================================================
                    SEMAPHORE DECLARATION
  ============================================================

        semaphore sema = new(1);

  - new(1) creates a semaphore with 1 key.

  - Initially:

        Available keys = 1


  ============================================================
                       GETTING KEYS
  ============================================================

        sema.get(1);

  - get() is used to obtain keys from the semaphore.

  - If the requested number of keys is available, the process
    gets the keys and continues execution.

  - If enough keys are not available, the process waits.


  ============================================================
                       RETURNING KEYS
  ============================================================

        sema.put(2);

  - put() is used to return keys to the semaphore.

  - The specified number of keys is added back to the
    semaphore.

  - The returned keys can then be obtained by waiting
    processes.


  ============================================================
                  SEMAPHORE IN THIS EXAMPLE
  ============================================================

  - The semaphore initially contains 1 key.

        sema = new(1);

  - first() requests 1 key after 10 time units.

        #10 sema.get(1);

  - second() requests 2 keys after 9 time units.

        #9 sema.get(2);

  - third() requests 3 keys immediately.

        sema.get(3);

  - A task continues only when the requested number of keys
    becomes available.

  - Therefore, the semaphore controls when each task can
    proceed based on the number of available keys.


  ============================================================
                         KEY POINT
  ============================================================

  - get()  → Obtains keys.

  - put()  → Returns keys.

  - If enough keys are unavailable, get() waits.

  - Semaphore is useful when multiple processes need controlled
    access to a shared resource.

  ============================================================
*/

class one;
  semaphore sema = new(1);
  task first();
    #10 sema.get(1);
    $display("[%0t] first task",$time);
    sema.put(2);
  endtask

  task second();
    #9 sema.get(2); 
    $display("[%0t] Second task",$time);
    sema.put(3);
  endtask

  task third();
    sema.get(3);
    $display("[%0t] Third task",$time);
    sema.put(3);
  endtask
endclass

module semaphore_ex1_tb;
  one one_h = new();
  initial begin 
    fork
      one_h.first();
      one_h.second();
      one_h.third();
    join 
  end 
endmodule 
