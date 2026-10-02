/*
  ============================================================
                         MAILBOX
  ============================================================

  - A mailbox is a SystemVerilog IPC mechanism used to
    exchange data between different processes.

  - A mailbox provides a communication channel through which
    one process can put data and another process can get data.

  - The mailbox can be parameterized with a data type.

        mailbox #(int) mb;

  - This means the mailbox can store only int values.


  ============================================================
                    MAILBOX CREATION
  ============================================================

        mailbox #(int) mb = new();

  - new() creates a mailbox object.

  - The mailbox can then be shared between different classes
    or processes.

  - In this example, the same mailbox is passed to class1 and
    class2.

  - Therefore, both classes communicate through the same
    mailbox.


  ============================================================
                      PUT DATA INTO MAILBOX
  ============================================================

        mb.put(a);

  - put() is used to place data into the mailbox.

  - In this example, class1 puts the value of a into the
    mailbox.

  - The data remains in the mailbox until another process
    retrieves it.


  ============================================================
                     GET DATA FROM MAILBOX
  ============================================================

        mb.get(b);

  - get() is used to retrieve data from the mailbox.

  - In this example, class2 gets the data from the mailbox and
    stores it in b.

  - If the mailbox is empty, get() waits until data becomes
    available.


  ============================================================
                 MAILBOX COMMUNICATION FLOW
  ============================================================

        class1
           |
           | put(a)
           ↓
      +-----------+
      |  MAILBOX  |
      +-----------+
           |
           | get(b)
           ↓
        class2

  - class1 produces the data.

  - The mailbox stores the data.

  - class2 retrieves the data.

  - Therefore:

        Producer → Mailbox → Consumer


  ============================================================
                  TYPED MAILBOX
  ============================================================

        mailbox #(int) mb;

  - The mailbox is declared with int as its data type.

  - Therefore, the mailbox is used to transfer int data.

  - SystemVerilog also allows mailboxes to be declared with
    other data types.

        mailbox #(string) mb;
        mailbox #(transaction) mb;


  ============================================================
                         KEY POINTS
  ============================================================

  - Mailbox is used for communication between processes.

  - put() → Places data into the mailbox.

  - get() → Retrieves data from the mailbox.

  - An empty mailbox causes get() to wait until data is
    available.

  - A typed mailbox restricts the type of data transferred.

  - The same mailbox handle can be shared between multiple
    classes or processes.

  ============================================================
*/

class class1;
  int a;
//   mailbox #(string) mb;
  mailbox #(int) mb;

  
  function new(mailbox #(int) mb);
    this.mb = mb;
  endfunction 
 
  task one();
    a = 10;
    $display("inside classs1 before putiing data into mail_box=%0p",mb);
    mb.put(a);
    $display("put a=%0d",a);
  endtask
endclass

class class2;
  int b;
  mailbox#(int)mb;
  function new(mailbox #(int) mb);
    this.mb = mb;
  endfunction 
  task one();
    mb.get(b);
    $display("get b=%0d",b);
  endtask
endclass

module  mailbox_ex_tb;
  mailbox #(int)mb = new();
  class1 class1_h;
  class2 class2_h;
  initial begin 
    class1_h = new(mb);
    class2_h = new(mb);
    class1_h.one();
    class2_h.one();
  end 
endmodule





