// Code your testbench here
// or browse Examples

/*
  ============================================================
                 DYNAMIC CASTING — DOWNCASTING
  ============================================================

  - c_obj1 is used to create a child object.

  - p_obj is then assigned c_obj1, so p_obj points to the
    same child object.

        p_obj = c_obj1;

  - This is upcasting.

  - Since print() is virtual, p_obj.print() calls the child
    class print() method.

  - c_obj2 is another child-class handle and is initially null.

  - $cast(c_obj2, p_obj) checks the object pointed to by p_obj.

  - Since p_obj is pointing to a child object, the cast
    succeeds and c_obj2 also points to the same child object.

        $cast(c_obj2, p_obj);

  - No new object is created during downcasting.

  - If p_obj is made to point to a parent object using:

        p_obj = new();

    then the cast fails because p_obj is no longer pointing
    to a child object.

  - Therefore:

        Upcasting   → Child handle → Parent handle
        Downcasting → Parent handle → Child handle using $cast()

  ============================================================
*/
class parent;
    virtual task print();
        $display("calling from parent class");
    endtask
endclass

class child extends parent;
    task print();
        $display("calling from child class");
    endtask
endclass

module casting();
    initial
    begin
        int x;
        parent p_obj;
        child c_obj1, c_obj2;

        x = 45.23; // implict casting
        $display("x = %0d", x);

        x = int'("s"); //explicit casting
        $display("x = %0d", x);

        p_obj = new();
        c_obj1 = new();

        // legal assignment (upcasting)
        p_obj = c_obj1;
        p_obj.print();
      	
      	//////////////
      	// uncomment below line to see what happens when p_obj is not pointing to the target class before downcasting.
      	//p_obj = new();
      	//////////////

        // explicit dynamic casting (downcasting)
        if($cast(c_obj2,p_obj))
        begin
            $display("casting was successfull!!");
            c_obj2.print();
        end
        else
            $error("cast unsuccessfull!");
    end
endmodule
