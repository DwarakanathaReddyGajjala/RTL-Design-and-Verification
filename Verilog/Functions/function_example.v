// Code your testbench here
// or browse Examples


/*
  ============================================================
                         FUNCTIONS
  ============================================================

  - A function is a reusable block of statements used to
    perform a specific operation.

  - A function executes in zero simulation time and cannot
    contain timing controls such as #, @, or wait.

  - A function can accept input arguments and can return a
    value to the calling statement.

  - The function name acts as the return variable when using
    the traditional function return mechanism.

  ============================================================
*/


module function_example;

  reg [9:0] a;


  /*
    ============================================================
                    CODE 1 — NEW STYLE
    ============================================================

    - The function arguments are declared directly in the
      function declaration.

    - The function uses void because it does not return a
      value.

    - The input arguments can be directly passed when the
      function is called.

    - The function can be called multiple times with
      different input values.

    ============================================================
  */


  // function void compare(input int a, b);
  //   begin
  //     if(a > b)
  //       $display("a is greater than b");
  //     else if(a < b)
  //       $display("a is less than b");
  //     else
  //       $display("a is equal to b");
  //   end
  // endfunction


  // initial begin
  //   compare(10,10);
  //   compare(5,9);
  //   compare(9,5);
  // end



  /*
    ============================================================
              CODE 1B —  OLD STYLE
    ============================================================

    - The function arguments are declared separately after
      the function declaration.

    - The input arguments are declared using the input keyword.

    - Multiple statements can be written directly between
      function and endfunction.

    - The outer begin...end is not required for the complete
      function body.

    ============================================================
  */


  // function void compare;
  //   input int a,b;
  //   $display("inside function");
  //   if(a > b)
  //     $display("a is greater than b");
  //   else if(a < b)
  //     $display("a is less than b");
  //   else
  //     $display("a is equal to b");
  // endfunction


  // initial begin
  //   compare(10,10);
  //   compare(5,9);
  //   compare(9,5);
  // end



  
  /*
    ============================================================
            CODE 2A — INTEGER FUNCTION
    ============================================================

    - The function is declared with integer as its return type.

    - The function name add acts as the return variable.

    - The calculated value is assigned to add inside the
      function.

    - The returned value can be assigned to a variable in the
      calling block.

    ============================================================
  */


   function integer add;
     input reg [7:0] b;
     begin
       add = b + 100;
     end
   endfunction


   initial begin
     a = add(100);
     $monitor(a);
   end



  /*
    ============================================================
        CODE 2B — LOCAL VARIABLE AND RETURN VALUE
    ============================================================

    - The function has an integer return value through the
      function name add.

    - The local variable c is used for an intermediate
      calculation inside the function.

    - The return statement returns the value of c from the
      function.

    - In this example, c becomes 300 and the function returns
      300 to the calling statement.

    ============================================================
  */


  // function integer add;

  //   input reg [7:0] b;
  //   integer c;
  //   begin
  //     $display("inside: b=%0d,c=%0d,add=%0d",b,c,add);
  //     add = b + 100;
  //     $display("after add: b=%0d,c=%0d,add=%0d",b,c,add);
  //     c = add + 100;
  //     $display("after c: b=%0d,c=%0d,add=%0d",b,c,add);
  //     return c;
  //   end
  // endfunction


  // initial begin
  //   a = add(100);
  //   $monitor(a);
  // end


/*
  ============================================================
                  FUNCTION — KEY POINTS
  ============================================================

  - A function can be declared using OLD or NEW
    argument declaration styles.

  - A function can have a specified return type such as
    integer, or a default 1-bit reg return value.

  - The function name can be used as the return variable.

  - Local variables can be declared inside a function for
    intermediate calculations.

  - The returned value can be affected by the width of the
    variable receiving the function result.

  ============================================================
*/

endmodule
