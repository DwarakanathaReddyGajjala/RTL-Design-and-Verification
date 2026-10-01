// Code your testbench here
// or browse Examples

/*
  ============================================================
          MULTI-LEVEL INHERITANCE AND POLYMORPHISM
  ============================================================

  - Multi-level inheritance means a class inherits from another
    derived class.

        parent
           ↓
        child
           ↓
        grand_child

  - A grand_child object is created using:

        grand_child_h = new();

  - A grand_child handle can be assigned to a child handle.

        child_h = grand_child_h;

  - A child handle can be assigned to a parent handle.

        parent_h = child_h;

  - These assignments do not create new objects.

  - Therefore, grand_child_h, child_h, and parent_h can point
    to the same grand_child object.

  ============================================================
                         VIRTUAL
  ============================================================

  - virtual allows a parent-class handle to use a child-class
    method.

  - Without virtual, the method is selected using the handle
    type.

  - With virtual, the method is selected using the actual
    object type.

  - virtual is used to achieve runtime polymorphism.

  ============================================================
                    METHOD OVERRIDING
  ============================================================

  - When a child class defines a method with the same name as
    a method in the parent class, the child provides its own
    version of that method.

  - This is called method overriding.

  - In this example, child and grand_child both provide their
    own version of display().

        parent       → display()
        child        → display()
        grand_child  → display()

  ============================================================
                  RUNTIME POLYMORPHISM
  ============================================================

  - Runtime polymorphism allows the method to be selected based
    on the actual object when a virtual method is called.

  - In this example, display() is virtual in child.

  - Therefore, grand_child can override the virtual display()
    method.

  - child_h points to the grand_child object.

        child_h = grand_child_h;

  - Therefore:

        child_h.display();

    calls the grand_child display() method.

  - grand_child_h directly points to the grand_child object, so:

        grand_child_h.display();

    also calls the grand_child display() method.

  - However, display() is NOT virtual in the parent class in
    this example.

  - Therefore:

        parent_h.display();

    calls the parent display() method.

  - To demonstrate runtime polymorphism through parent_h,
    display() must be declared virtual in the parent class.

  ============================================================
*/

class parent;
   function void display();
    $display("Parent class");
  endfunction 
endclass

class child extends parent;
  int a;
  virtual function void display();
    $display("Child class ");
  endfunction 
endclass

class grand_child extends child;
  int a;
  virtual function void display();
    $display("grand_child class ");
  endfunction 
endclass
  
module method_overriding_tb;
  grand_child grand_child_h; 
  child child_h;
  parent parent_h;
  
  initial begin
    grand_child_h = new(); 
    child_h =  grand_child_h;
    parent_h = child_h;
    parent_h.display();
    child_h.display();
    grand_child_h.display();
  end 

endmodule
