// Code your testbench here
// or browse Examples
/*
  ============================================================
                  STATIC CLASS PROPERTY
  ============================================================

  - A static property is a class variable that has only one
    shared copy for the entire class.

  - The static property is not created separately for each
    object.

  - All handles of the class refer to the same static property.

  - Therefore, when the static property is modified through
    one handle, the updated value is visible through all other
    handles.

  - A static property can also be accessed using the class
    scope resolution operator (::).

        transaction::static_data

  - The static property can be accessed through a class handle
    as well.

        tr1.static_data

  - The class name can be used directly with ::, but the
    static property cannot be accessed directly by its name
    outside the class.

        transaction::static_data     → Valid
        static_data                  → Not valid outside class

  ============================================================
*/


/*
  ============================================================
              STATIC PROPERTY — SHARED BY ALL HANDLES
  ============================================================

  - static_data is declared using the static keyword.

        static int static_data;

  - There is only one copy of static_data for the
    transaction class.

  - tr1, tr2, and tr3 do not have separate copies of
    static_data.

  - Therefore:

        tr1 ─────┐
        tr2 ─────┼──→ One shared static_data
        tr3 ─────┘

  ============================================================
*/


/*
  ============================================================
              ACCESSING STATIC PROPERTY USING HANDLE
  ============================================================

  - A static property can be accessed using a class handle.

        tr1.static_data

  - Since static_data is shared by the class, accessing it
    through tr1, tr2, or tr3 refers to the same variable.

  - Therefore, changing the value using one handle changes
    the value seen through the other handles.

  ============================================================
*/


/*
  ============================================================
              ACCESSING STATIC PROPERTY USING ::
  ============================================================

  - The scope resolution operator :: can be used to access
    a static class property directly through the class name.

        transaction::static_data

  - This makes it clear that static_data belongs to the
    transaction class rather than to an individual object.

  - This is the direct class-level way of accessing a
    static property.

  ============================================================
*/


/*
  ============================================================
                    IMPORTANT POINT
  ============================================================

  - A normal class property has a separate copy for each
    object.

  - A static class property has only one shared copy for
    the entire class.

        Normal property:
        Object 1 → separate copy
        Object 2 → separate copy

        Static property:
        Object 1 ─┐
        Object 2 ─┼→ One shared copy
        Object 3 ─┘

  ============================================================
*/
class transaction;
  static int static_data;
endclass

module static_class_property_tb;
  transaction tr1,tr2,tr3;
  
  initial begin 

    $display("tr1.static_data=%0d",tr1.static_data);
    $display("tr2.static_data=%0d",tr2.static_data);
    $display("tr3.static_data=%0d",tr3.static_data);
    
    tr1.static_data = 20;
    $display("tr1.static_data=%0d",transaction::static_data);
    $display("tr2.static_data=%0d",tr2.static_data);
    $display("tr3.static_data=%0d",tr3.static_data);
    
    transaction::static_data = 30;//Accessing static variable using transaction::static_data.
    $display("tr1.static_data=%0d",tr1.static_data);
    $display("tr2.static_data=%0d",transaction::static_data);
    $display("tr3.static_data=%0d",tr3.static_data);
    
    tr3.static_data = 40;// Accessing static variable using handle
    $display("tr1.static_data=%0d",tr1.static_data);
    $display("tr2.static_data=%0d",tr2.static_data);
    $display("tr3.static_data=%0d",transaction::static_data);
  end
  
endmodule 

  
