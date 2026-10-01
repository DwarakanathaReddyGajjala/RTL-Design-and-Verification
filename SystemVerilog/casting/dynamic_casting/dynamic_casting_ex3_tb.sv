/*
  ============================================================
                         UPCASTING
  ============================================================


  - Upcasting means assigning a child-class handle to a
    parent-class handle.

        parent_h = child_h;

  - A child class inherits from the parent class, so a child
    object contains the members of the parent class.

  - Therefore, a child-class handle can be assigned to a
    parent-class handle without using $cast().

  - Upcasting is implicit. No special syntax or function is
    required.

  - No new object is created during upcasting.

  - Both handles point to the same child object.

        child_h  ──┐
                   ↓
              Child Object
                   ↑
                   |
        parent_h ──┘

  - The handle type determines which members can be accessed
    through that handle.

  - Therefore, a parent handle can access the members available
    in the parent class, but it cannot directly access
    child-specific members.

  - Upcasting is commonly used to allow different child objects
    to be accessed through a common parent-class handle.

  - Upcasting is also commonly used to achieve polymorphism.

  ============================================================
                        DOWNCASTING
  ============================================================

  - Downcasting in SystemVerilog is the process of assigning
    a parent-class handle to a child-class handle.

  - A normal assignment cannot be used for downcasting:

        child_h = parent_h;

  - SystemVerilog requires explicit dynamic casting using
    $cast():

        $cast(child_h, parent_h);

  - $cast() performs a runtime check to determine whether the
    object pointed to by the parent handle is compatible with
    the child type.

  - If the object is compatible with the child type, the cast
    succeeds.

  - If the object is not compatible with the child type, the
    cast fails.

  - Therefore:

        Parent handle → Child handle
                  ↓
                $cast()
                  ↓
             Runtime check

  - Downcasting does not create a new object.

  - If the parent handle already points to a child object,
    both handles can point to the same child object after
    successful downcasting.

        parent_h ──┐
                   ↓
              Child Object
                   ↑
                   |
        child_h ───┘

  ============================================================
              UPCASTING VS DOWNCASTING
  ============================================================

  UPCASTING
  ------------------------------------------------------------

        Child handle → Parent handle

        parent_h = child_h;

  - Implicit
  - No $cast() required
  - No runtime type check required
  - No new object is created


  DOWNCASTING
  ------------------------------------------------------------

        Parent handle → Child handle

        $cast(child_h, parent_h);

  - Explicit
  - $cast() is required
  - Runtime check is performed
  - No new object is created
  - Cast succeeds only when the actual object is compatible
    with the child type


  ============================================================
                    IMPORTANT EXAMPLE
  ============================================================

  class parent;
  endclass

  class child extends parent;
  endclass


  child_h = new();

  parent_h = child_h;

  - A child object is created.

  - parent_h is then assigned the child handle.

  - Now both handles point to the same child object.

        child_h  ──┐
                   ↓
              Child Object
                   ↑
                   |
        parent_h ──┘

  - This is upcasting.


  Now:

        $cast(child_h, parent_h);

  - $cast() checks the actual object pointed to by parent_h.

  - The actual object is a child object.

  - Therefore, the downcast succeeds.

  ============================================================


                    FAILED DOWNCAST
  ============================================================

  parent_h = new();

  $cast(child_h, parent_h);

  - Here, parent_h points to an actual parent object.

  - The actual object is not a child object.

  - Therefore, the runtime check performed by $cast() fails.

  - This shows that downcasting depends on the actual object
    being compatible with the child type.

  ============================================================
*/


class parent;
  int data1 = 100;
  int id1=10;
  function void display();
    $display("trascation1 class data1=%0d,id1=%0d",data1,id1);
  endfunction
endclass

class child extends parent;
  function void display();
    $display("trascation2 class data1=%0d,id1=%0d",data1,id1);
  endfunction
endclass

module dynamic_casting_ex3_tb;
  parent parent_h;
  child child_h;
  
  initial begin 
    child_h = new();
//     parent_h = new();
    parent_h = child_h;
//     $cast(parent_h,child_h);
//     child_h = parent_h;
    $cast(child_h,parent_h);
    parent_h.display();
    child_h.display();
  end 
endmodule  
