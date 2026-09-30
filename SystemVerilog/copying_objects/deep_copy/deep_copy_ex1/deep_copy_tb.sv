// Code your testbench here
// or browse Examples
/*
  ============================================================
                  TYPEDEF CLASS — FORWARD DECLARATION
  ============================================================

  - A class can sometimes need to use another class before
    that class is fully declared.

  - In this example, class pkt1 uses pkt2:

        pkt2 pkt2_h = new();

  - But the complete declaration of pkt2 comes after pkt1.

  - Therefore, the compiler needs to know that pkt2 is a class
    before it reaches the declaration of pkt1.

  - This is done using a forward class declaration:

        typedef class pkt2;

  - It tells the compiler that pkt2 is a class type that will
    be fully declared later.

  - The complete definition of pkt2 is then provided later:

        class pkt2;
          ...
        endclass

  - Therefore:

        typedef class pkt2;
              ↓
        Tells compiler pkt2 is a class

        class pkt2;
          ...
        endclass
              ↓
        Provides the complete class definition

  - This allows pkt1 to contain a handle to pkt2 even though
    pkt2 is declared later in the code.

  ============================================================
*/
typedef class pkt2;  

  class pkt1;
    int data1;
    int addr1; 
    pkt2 pkt2_h = new();
    function pkt1 copy();
      copy = new();
      copy.data1 = this.data1;
      copy.addr1 = this.addr1;
      copy.pkt2_h = pkt2_h.copy();
      return copy;
    endfunction   
  endclass

  class pkt2;
    int data2;
    int addr2; 
    function pkt2 copy();
      copy = new();
      copy.data2 = this.data2;
      copy.addr2 = this.addr2;
      return copy;
    endfunction  
  endclass
  
/*
  ============================================================
                     DEEP COPY
  ============================================================

  - Deep copy creates a completely independent copy of an
    object and its nested class objects.

  - In this example, the copy() method is created in both
    pkt1 and pkt2 classes.

  - The pkt1 copy() method creates a new pkt1 object.

  - The data1 and addr1 properties are copied into the new
    pkt1 object.

  - pkt2_h is a class handle, so a new pkt2 object must also
    be created for a complete independent copy.

  - This is done using:

        copy.pkt2_h = pkt2_h.copy();

  - The pkt2 copy() method creates a new pkt2 object and
    copies data2 and addr2 into it.

  - Therefore, after:

        pkt1_h2 = pkt1_h1.copy();

    pkt1_h1 and pkt1_h2 point to different pkt1 objects.

  - Their pkt2_h handles also point to different pkt2 objects.

        pkt1_h1 ──→ pkt1 Object 1
                      |
                      | pkt2_h
                      ↓
                   pkt2 Object 1


        pkt1_h2 ──→ pkt1 Object 2
                      |
                      | pkt2_h
                      ↓
                   pkt2 Object 2

  - Changing data1 or addr1 through pkt1_h1 does not affect
    pkt1_h2.

  - Changing data2 or addr2 through pkt1_h1.pkt2_h does not
    affect pkt1_h2.pkt2_h.

  - Similarly, changing the nested pkt2 object through
    pkt1_h2 does not affect the nested pkt2 object of pkt1_h1.

  - Therefore, deep copy creates independent objects at every
    nested class level.

  ============================================================
*/  


  module deep_copy_tb;
    pkt1 pkt1_h1,pkt1_h2;
    initial begin
      pkt1_h1 = new();
      pkt1_h1.data1 = 100;
      pkt1_h1.addr1 = 101;
      $display(" 1st pkt1_h1 object consists of =%p",pkt1_h1);
      $display("pkt1_h1 pkt2_h object consists of =%p",pkt1_h1.pkt2_h);
      $display("pkt1_h1 copy method object consists of =%p",pkt1_h1.copy());
      $display("pkt1_h2 object consists of =%p",pkt1_h2);
     
      
      pkt1_h2 = pkt1_h1.copy();//deep copy 
      $display(" 2nd pkt1_h1 object consists of =%p",pkt1_h1);
      $display("pkt1_h1 pkt2_h object consists of =%p",pkt1_h1.pkt2_h);
      $display("pkt1_h1 copy method object consists of =%p",pkt1_h1.copy());
      $display("pkt1_h2 object consists of =%p",pkt1_h2);
      $display("pkt1_h2 pkt2_h object consists of =%p",pkt1_h2.pkt2_h);
      $display("pkt1_h2 copy method object consists of =%p",pkt1_h2.copy());


      
      pkt1_h1.data1 = 200;
      pkt1_h1.addr1 = 201;
      pkt1_h2.data1 = 300;
      pkt1_h2.addr1 = 301;
      $display(" 3rdnd pkt1_h1 object consists of =%p",pkt1_h1);
      $display("pkt1_h1 pkt2_h object consists of =%p",pkt1_h1.pkt2_h);
      $display("pkt1_h1 copy method object consists of =%p",pkt1_h1.copy());
      $display("pkt1_h2 object consists of =%p",pkt1_h2);
      $display("pkt1_h2 pkt2_h object consists of =%p",pkt1_h2.pkt2_h);
      $display("pkt1_h2 copy method object consists of =%p",pkt1_h2.copy());

      
      pkt1_h1.pkt2_h.data2 = 400;
      pkt1_h1.pkt2_h.addr2 = 401;
      $display(" 4th pkt1_h1 object consists of =%p",pkt1_h1);
      $display("pkt1_h1 pkt2_h object consists of =%p",pkt1_h1.pkt2_h);
      $display("pkt1_h1 copy method object consists of =%p",pkt1_h1.copy());
      $display("pkt1_h2 object consists of =%p",pkt1_h2);
      $display("pkt1_h2 pkt2_h object consists of =%p",pkt1_h2.pkt2_h);
      $display("pkt1_h2 copy method object consists of =%p",pkt1_h2.copy());

      pkt1_h2.pkt2_h.data2 = 500;
      pkt1_h2.pkt2_h.addr2 = 501;
      $display(" 5th pkt1_h1 object consists of =%p",pkt1_h1);
      $display("pkt1_h1 pkt2_h object consists of =%p",pkt1_h1.pkt2_h);
      $display("pkt1_h1 copy method object consists of =%p",pkt1_h1.copy());
      $display("pkt1_h2 object consists of =%p",pkt1_h2);
      $display("pkt1_h2 pkt2_h object consists of =%p",pkt1_h2.pkt2_h);
      $display("pkt1_h2 copy method object consists of =%p",pkt1_h2.copy());

    end 
  endmodule
