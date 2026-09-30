// Code your testbench here
// or browse Examples

/*
  ============================================================
                         SUPER KEYWORD
  ============================================================

  - The super keyword is used inside a child class to access
    members of the parent class.

  - super can be used to access a parent class property.

        super.a

  - super can also be used to call a parent class method.

        super.display();

  - When the child and parent class have properties or methods
    with the same name, super can be used to explicitly access
    the parent class member.

  - Therefore:

        child member  → a
        parent member → super.a

  ============================================================
*/

class parent;
  int a = 50;
  function void display();
    $display("This is parent class");
  endfunction 
endclass

class child extends parent;
  int a = 60;
  function void display();
    $display("This is child class a=%0d",super.a);
    super.a = 70;
    $display("This is child class a=%0d",super.a);
    super.display();
  endfunction 
endclass

module class_inheritance_super_tb;
  child  child_h      ;
  
  initial begin
    child_h       = new();
    $display(" child.a=%0d",child_h.a);
    child_h.display();
    child_h.a     = 10   ;
    $display("child.a=%0d",child_h.a);
  end 
  
endmodule



