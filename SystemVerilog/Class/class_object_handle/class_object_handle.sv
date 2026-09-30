// Code your testbench here
// or browse Examples
/*
  ============================================================
                 CLASS — OBJECT AND HANDLE
  ============================================================

  - A class is a user-defined data type that can contain
    properties and methods.

  - An object of a class is created using the new() keyword.

  - A class variable is a handle that refers to a class object.

  - Multiple handles can refer to the same class object.

  - If two handles refer to the same object, changing a
    property through one handle is visible through the other
    handle.

  ============================================================
*/

class transaction;
  int data;
endclass

module class_object_handle;
  transaction tr1,tr2;
  
  
  /*
  ============================================================
          CODE 1A — TWO HANDLES SHARING ONE OBJECT
  ============================================================

  - tr1 and tr2 are class handles of the transaction class.

  - tr1 = new() creates one class object.

  - tr2 = tr1 makes tr2 point to the same object referenced
    by tr1.

  - Therefore, both handles refer to the same memory/object.

  - When tr1.data is changed to 10, tr2.data also shows 10.

  - When tr2.data is changed to 20, tr1.data also shows 20.

  - Therefore:

        tr1 ─────┐
                 ├──→ Same Object
        tr2 ─────┘

  ============================================================
*/

  initial begin 
    tr1 = new();
    tr2 = tr1;
    tr1.data = 10;
    $display("tr1.data=%0d",tr1.data);
    $display("tr2.data=%0d",tr2.data);
    tr2.data = 20;
    $display("tr1.data=%0d",tr1.data);
    $display("tr2.data=%0d",tr2.data);
  end
  
  /*
  ============================================================
          CODE 1B — TWO HANDLES WITH DIFFERENT OBJECTS
  ============================================================

  - tr1 = new() creates one object.

  - tr2 = new() creates another separate object.

  - Therefore, tr1 and tr2 refer to different memory locations.

  - Changing tr1.data does not affect tr2.data.

  - Changing tr2.data does not affect tr1.data.

  - Therefore:

        tr1 ───→ Object 1

        tr2 ───→ Object 2

  ============================================================
*/

//   initial begin 
//     tr1 = new();
//     tr2 = new();
//     tr1.data = 10;
//     $display("tr1.data=%0d",tr1.data);
//     $display("tr2.data=%0d",tr2.data);
//     tr2.data = 20;
//     $display("tr1.data=%0d",tr1.data);
//     $display("tr2.data=%0d",tr2.data);
//   end
  
endmodule 
  
  
