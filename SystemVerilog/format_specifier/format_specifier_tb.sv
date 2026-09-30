/*
  ============================================================
                    FORMAT SPECIFIERS
  ============================================================

  %d → Displays the value in decimal format.

  %b → Displays the value in binary format.

  %o → Displays the value in octal format.

  %h → Displays the value in hexadecimal format.

  %s → Displays the value as a string.

  %t → Displays the simulation time.

  %p → Displays the complete contents of aggregate or
       structured data.

  ============================================================
                         %p IN DEPTH
  ============================================================

  - %p is used to display the contents of an entire aggregate
    or structured data item.

  - It can be used with arrays, memories, queues, structures,
    and class objects.

  - Instead of displaying each element separately, %p displays
    the complete contents together.

  - For an array, %p displays all the elements of the array.

  - For a memory, %p displays the values stored at the
    different memory locations.

  - For a class object, %p displays the values of the class
    properties.

  - Therefore, %p is useful when we want to see the complete
    contents of a data structure at once.

  ============================================================
*/

class Transaction;
  int id = 42;
  bit [3:0] payload = 4'hA;
  string status = "PENDING";
endclass

module format_specifier_tb;
  initial begin
    Transaction tr = new();
    
    // Printing the class object using %p
    $display("Class contents: %p", tr);
    // Output: Class contents: '{id:42, payload:10, status:"PENDING"}
  end
endmodule
