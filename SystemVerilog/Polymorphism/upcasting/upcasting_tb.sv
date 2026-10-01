// Code your testbench here
// or browse Examples
/*
  ============================================================
                 UPCASTING — PARENT HANDLE
  ============================================================

  - A child-class handle can be assigned to a parent-class
    handle because the child class inherits from the parent
    class.

        parent_h = child_h;

  - This is called upcasting.

  - No new object is created by this assignment.

  - Both handles point to the same child object.

        child_h  ──┐
                   ↓
              Child Object
                   ↑
                   |
        parent_h ──┘

  - The child object contains the parent part because the
    child class inherits from the parent class.

  - The parent handle can access only the members available
    through the parent class.

  - Therefore, parent_h cannot directly access the child-only
    property:

        parent_h.a

  - The child handle can access the child property:

        child_h.a = 100;

  - Since display() is not virtual in the parent class,
    parent_h.display() calls the parent class method.

  - child_h.display() calls the child class method.

  - Therefore, the output is:

        child_h.a = 100
        Parent class
        Child class

  ============================================================
*/

class parent;
  function void display();
    $display("Parent class");
  endfunction 
endclass

class child extends parent;
  int a;
  function void display();
    $display("Child class ");
  endfunction 
endclass
  
module upcasting_tb; 
  child child_h;
  parent parent_h;
  
  initial begin
    child_h = new(); 
    parent_h = child_h;// parent_h uses memory of the child_h and it exectes the parent method as the tool when sees the rhs and lhs it knows that both are having the relation so it wont act as the normal handle assignment in that case both displys results child class, child calss where as in this case it results the parent class and child class
    child_h.a = 100;
    $display("child_h.a=%0d",child_h.a);
    parent_h.display();
    child_h.display();
  end 

endmodule
