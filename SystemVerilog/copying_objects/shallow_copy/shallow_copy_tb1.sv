// Code your testbench here 
// or browse Examples

 /*
  ====================================================================
                     SHALLOW COPY
  ====================================================================

  - Shallow copy creates a new object and copies the contents
    of the existing object into the new object.

  - The syntax used for shallow copy is:

        new_handle = new existing_handle;

  - In this example:

        transaction_h2 = new transaction_h1;

    creates a new object for transaction_h2 and copies the
    contents of transaction_h1 into it.

  - After the copy, transaction_h1 and transaction_h2 point
    to different objects.

        transaction_h1 ──→ Object 1
                            data = 100
                            addr = 10

        transaction_h2 ──→ Object 2
                            data = 100
                            addr = 10

  - Since data and addr are simple properties, changing a
    property through one object does not change the other object.

  - Therefore:

        transaction_h1.data = 200;

    does not change:

        transaction_h2.data

  - Similarly, changing transaction_h2 does not change
    transaction_h1.

  ======================================================================
                  DIFFERENT CLASS TYPES
  ======================================================================

  - Object copying is allowed only between compatible class types.

  - transaction and transaction_1 are two different class types.

  - Therefore:

        transaction_1_h = new transaction_h1;

    is not allowed because transaction_h1 is an object of
    class transaction, while transaction_1_h is a handle of
    class transaction_1.

  - Therefore, objects of unrelated class types cannot be
    copied directly using this syntax.

  ========================================================================
*/
class transaction;
  int data;
  int addr; 
endclass

class transaction_1;
  int data;
  int addr; 
endclass

module shallow_copy_tb1;
  transaction transaction_h1,transaction_h2;
  transaction_1 transaction_1_h;
  
//shallow copy
  initial begin
    transaction_h1 = new();
    transaction_h1.data = 100;
    transaction_h1.addr = 10 ;
    transaction_h2 = new transaction_h1;// Creates a new object(memory) for transaction_h2 and copies the contents of transaction_h1.
    $display("transaction_h1=%p",transaction_h1);
    $display("transaction_h2=%p",transaction_h2);
    transaction_h1.data = 200;
    transaction_h1.addr = 20 ;
    transaction_h2.data = 300;
    transaction_h2.addr = 30 ;
    $display("transaction_h1=%p",transaction_h1);
    $display("transaction_h2=%p",transaction_h2);
  end 
endmodule
