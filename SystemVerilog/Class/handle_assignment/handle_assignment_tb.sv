// Code your testbench here
// or browse Examples

/*
  ============================================================
                  CLASS HANDLE ASSIGNMENT
  ============================================================

  - A class handle is used to access a class object.

  - The new() keyword creates a new class object.

  - When one class handle is assigned to another class handle,
    both handles point to the same object.

  - Assigning one handle to another does not create a new
    object.

  - A new object is created only when new() is called.

  ============================================================
*/

 
class transaction;
  int data;
  int addr; 
endclass

module handle_assignment_tb;
  transaction transaction_h1,transaction_h2;
  
  /*
  ============================================================
              CODE 1A — TWO HANDLES, ONE OBJECT
  ============================================================

  - transaction_h1 = new() creates one object.

  - transaction_h2 = transaction_h1 makes both handles point
    to the same object.

  - Therefore, both handles access the same object.

        transaction_h1 ──┐
                         ├──→ Same Object
        transaction_h2 ──┘

  ============================================================
*/
  
  //code1a
  initial begin
    transaction_h1 = new();
    transaction_h2 = transaction_h1;
    transaction_h1.data = 100;
    transaction_h1.addr = 10 ;
    $display("transaction_h1=%p",transaction_h1);
    $display("transaction_h2=%p",transaction_h2);
  end 
 
  
  
  
  /*
  ============================================================
              CODE 1B — TWO OBJECTS, THEN ONE OBJECT
  ============================================================

  - transaction_h1 = new() creates the first object.

  - transaction_h2 = new() creates the second object.

  - transaction_h2 = transaction_h1 makes both handles point
    to the same object.

  - The second object is no longer accessible because no
    handle points to it.

  ============================================================
*/
  
//code1b
//   initial begin
//     transaction_h1 = new();
//     transaction_h2 = new();
//     transaction_h2 = transaction_h1;
//     transaction_h1.data = 100;
//     transaction_h1.addr = 10 ;
//     $display("transaction_h1=%0p",transaction_h1);
//     $display("transaction_h2=%0p",transaction_h2);
//   end 
 

  
 /*
  ============================================================
              CODE 1C — TWO HANDLES, TWO OBJECTS
  ============================================================

  - transaction_h1 = new() creates the first object.

  - transaction_h2 = transaction_h1 makes both handles point
    to the same object.

  - transaction_h2 = new() creates a new object for
    transaction_h2.

  - Now transaction_h1 and transaction_h2 point to different
    objects.

        transaction_h1 ──→ Object 1

        transaction_h2 ──→ Object 2

  ============================================================
*/
   
//code1c
//   initial begin
//     transaction_h1 = new();
//     transaction_h2 = transaction_h1;
//     transaction_h2 = new();
//     transaction_h1.data = 100;
//     transaction_h1.addr = 10 ;
//     $display("transaction_h1=%0p",transaction_h1);
//     $display("transaction_h2=%0p",transaction_h2);
//   end 
 
  

  
/*
  ============================================================
              CODE 1D — TWO HANDLES, TWO OBJECTS
  ============================================================

  - transaction_h1 = new() creates one object.

  - transaction_h2 = new() creates another object.

  - Therefore, the two handles point to different objects.

        transaction_h1 ──→ Object 1

        transaction_h2 ──→ Object 2

  - A change made through one handle does not change the
    other object.

  ============================================================
*/
  
//code1d
//   initial begin
//     transaction_h1 = new();
//     transaction_h2 = new();
//     transaction_h1.data = 100;
//     transaction_h1.addr = 10 ;
//     $display("transaction_h1=%0p",transaction_h1);
//     $display("transaction_h2=%0p",transaction_h2);
//   end 
  
endmodule
