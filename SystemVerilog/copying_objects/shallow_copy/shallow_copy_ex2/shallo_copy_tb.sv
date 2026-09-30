// Code your testbench here
// or browse Examples
/*
  ============================================================
              SHALLOW COPY — NESTED CLASS HANDLE
  ============================================================

  - Shallow copy creates a new object and copies the contents
    of the existing object.

  - In this example:

        one_h2 = new one_h1;

    creates a new object for one_h2 and copies the contents
    of one_h1 into it.

  - one_h1 and one_h2 therefore point to two different
    objects of class one.

  - The data1 and addr1 properties are copied into the new
    class one object.

  - The two_h property is a class handle that points to an
    object of class two.

  - During shallow copy, the two_h handle is copied, but a new
    class two object is not created.

  - Therefore, the two_h handle inside one_h1 and the two_h
    handle inside one_h2 point to the same class two object.

        one_h1 ──→ Object 1 (class one)
                       |
                       | two_h
                       ↓
                  Object A (class two)
                       ↑
                       | two_h
                       |
        one_h2 ──→ Object 2 (class one)

  - Therefore:

        one_h1        → Different class one object
        one_h2        → Different class one object

        one_h1.two_h  → Same class two object
        one_h2.two_h  → Same class two object

  - Changing data1 or addr1 through one handle does not affect
    the other class one object.

  - However, changing data2 or addr2 through one_h1.two_h or
    one_h2.two_h changes the same class two object.

  - Therefore, shallow copy creates a new outer object, but
    nested class handles still point to the same object.

  ============================================================
*/
typedef class two;  

  class one;
    int data1;
    int addr1; 
    two two_h = new();
    //     two two_h ;
  endclass

  class two;
    int data2;
    int addr2; 
  endclass


  module shallo_copy_tb;
    one one_h1,one_h2;
    //shallow copy
    initial begin
      one_h1 = new();
      one_h1.data1 = 100;
      one_h1.addr1 = 10 ;
      one_h2 = new one_h1;// Creates a new object(memory) for transaction_h2 and copies the contents of transaction_h1.
      $display("class one handle one consists of=%p",one_h1);
      $display("class one handle two consists of=%p",one_h2);
      one_h1.data1 = 200;
      one_h1.addr1 = 20 ;
      one_h1.two_h.data2 = 300;
      one_h1.two_h.addr2 = 30;
      one_h2.two_h.data2 = 400;
      one_h2.two_h.addr2 = 40;
      one_h2.data1 = 500;
      one_h2.addr1 = 50 ;
      $display("class one handle one consists of=%p",one_h1);
      $display("class one handle two consists of=%p",one_h2);
    end 
  endmodule
