/*
  ============================================================
                    RUNTIME POLYMORPHISM
  ============================================================

  - A parent-class handle can point to an object of a child
    class.

  - Different parent handles can point to objects of different
    child classes.

        p_A = c_A;
        p_B = c_B;
        p_C = c_C;

  - No new objects are created by these assignments.

  - Therefore:

        p_A → child_A object
        p_B → child_B object
        p_C → child_C object

  - The display() method is declared virtual in the parent
    class.

  - Each child class provides its own version of display().
    This is called method overriding.

  - When display() is called through a parent handle, the
    method of the actual child object is executed.

        p_A.display() → child_A display()
        p_B.display() → child_B display()
        p_C.display() → child_C display()

  - Therefore, the same parent handle type can be used to
    access different child-class methods.

  - This behavior is called runtime polymorphism.

  ============================================================
*/


class parent;
  bit [31:0] data;
  int id;
  
  virtual function void display();
     $display("Base: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

class child_A extends parent;
  function void display();
    $display("Child_A: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

class child_B extends parent;
  function void display();
    $display("Child_B: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

class child_C extends parent;
  function void display();
    $display("Child_C: Value of data = %0d, id = %0d", data, id);
  endfunction
endclass

module runtime_polymorphism_ex_tb;
  initial begin
    parent p_A, p_B, p_C;
    child_A c_A = new();
    child_B c_B = new();
    child_C c_C = new();
    
    c_A.data = 200;
    c_A.id   = 2;
    
    c_B.data = 300;
    c_B.id   = 3;
    
    c_C.data = 400;
    c_C.id   = 4;
     
    p_A = c_A;
    p_B = c_B;
    p_C = c_C;
    
    p_A.data = 100;
    p_A.id   = 1;
    
    p_A.display();
    p_B.display(); 
    p_C.display();
  end
endmodule
