// Code your testbench here
// or browse Examples

/*
  ============================================================
                    MAILBOX DATA ORDER
  ============================================================

  - A mailbox stores the data inserted into it using put().

  - When get() is used, the data is retrieved in the same
    order in which it was inserted.

  - In this example:

        mb.put(10);
        mb.put(20);

    The mailbox contains:

        10 → 20

  - The first get() retrieves 10.

        mb.get(b);

        b = 10

  - The second get() retrieves 20.

        mb.get(c);

        c = 20

  - Therefore, the mailbox follows FIFO ordering:

        First In → First Out


  ============================================================
                         DATA FLOW
  ============================================================

        put(10)
           ↓
      +---------+
      |   10    |
      +---------+
           ↓
        put(20)
           ↓
      +---------+
      | 10 | 20 |
      +---------+
         ↓   ↓
       get  get
         ↓   ↓
        b=10 c=20

  ============================================================
*/

module mailbox_ex2_tb;//code1a
  int a,b,c;
  mailbox mb ;
   
  initial begin 
    mb = new();
    a = 10;
    mb.put(a);
    a = 20;
    mb.put(a);
    mb.get(b);
    mb.get(c);
    $strobe("b = %0d c=%0d",b,c);
  end 
endmodule 


    
    
