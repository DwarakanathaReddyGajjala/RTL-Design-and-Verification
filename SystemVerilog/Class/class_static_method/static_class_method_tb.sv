// Code your testbench here
// or browse Examples

/*
  ============================================================
                    STATIC CLASS METHOD
  ============================================================

  - A static function belongs to the class rather than to an
    individual class object.

  - A static function can be called using the class name and
    scope resolution operator.

        transaction::incre_static_count();

  - A static function can directly access static class
    properties.

  - A static function cannot directly access non-static class
    properties because non-static properties belong to
    individual objects.

  - A non-static function can access both static and
    non-static class properties.

  ============================================================
              STATIC FUNCTION — SHARED PROPERTY
  ============================================================

  - static_count is a static class property, so only one
    copy exists for the entire transaction class.

  - incre_static_count() is also a static function.

  - Therefore, incre_static_count() can directly access
    static_count.

  - The function increments the same shared static_count
    whenever it is called.

  ============================================================
              NON-STATIC FUNCTION
  ============================================================

  - incre_count() is a non-static function.

  - It can access both static and non-static class properties.

  - static_count is shared by all objects.

  - count is a non-static property, so every object has its
    own separate copy of count.

  - Therefore, each object has its own count, while all objects
    share the same static_count.

  ============================================================
*/



class transaction;
  static int static_count;
         int count       ;
  static function void incre_static_count();
    static_count++;
//     count++; //Illegal: static function cannot access non-static class properties directly.
  endfunction 
  function void incre_count();
    static_count++           ;
    count++                  ; 
  endfunction 
endclass

module static_class_method_tb;
  
/*
  ============================================================
                    OBJECT ARRAY
  ============================================================

  - tr[5] is a fixed-size array of five class handles.

  - The array initially contains null handles.

  - The foreach loop creates an object for each handle using
    new().

        tr[0] → Object 0
        tr[1] → Object 1
        tr[2] → Object 2
        tr[3] → Object 3
        tr[4] → Object 4

  - Each object has its own non-static count.

  - All five objects share the same static_count.

  ============================================================
*/
  transaction tr[5];//Creating 5 class objects using a fixed array of handles.
  
  initial begin 
    foreach(tr[i]) begin 
      tr[i] = new();
      transaction::incre_static_count();
      $display("tr[%0d].static_count=%0d,tr[%0d].count=%0d",i,transaction::static_count,i,tr[i].count);
    end 
    
    tr[0].static_count = '0;
    
    foreach(tr[i]) begin
      tr[i].incre_count();
      $display("tr[%0d].static_count=%0d,tr[%0d].count=%0d",i,tr[i].static_count,i,tr[i].count);
    end 
  end  
endmodule  
