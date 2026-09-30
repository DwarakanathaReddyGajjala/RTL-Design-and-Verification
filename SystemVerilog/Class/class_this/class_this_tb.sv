// Code your testbench here
// or browse Examples


/*
  ============================================================
                         THIS KEYWORD
  ============================================================

  - The this keyword is used inside a class method to refer
    to the current class object.

  - this.data refers to the data property of the current
    class object.

  - When a function argument and a class property have the
    same name, this can be used to clearly refer to the class
    property.

  - Therefore:

        this.data → class property
        data      → function argument

  ============================================================
*/


/*
  ============================================================
              CODE 1 — WITHOUT USING THIS
  ============================================================

  - The function argument and the class property both have
    the name data.

  - In:

        data = data;

    both the LHS and RHS data refer to the function argument.

  - Therefore, the class property is not modified.

  - this.data is used in the display statement to access the
    class property of the current object.

  ============================================================
*/


// class transaction;
//   int data;
//   function void display(int data);
//     data = data;
//     $display("function argument data=%0d",data);
//     $display("class property data=%0d",this.data);
//   endfunction
// endclass



/*
  ============================================================
              CODE 2 — USING THIS KEYWORD
  ============================================================

  - this.data refers to the class property of the current
    object.

  - data on the RHS refers to the function argument.

  - Therefore:

        this.data = data;

    copies the function argument into the class property.

  - The value of the class property is therefore updated
    when the function is called.

  ============================================================
*/


class transaction;
  int data;
  function void display(int data);
    this.data = data;
    $display("function argument data=%0d",data);
    $display("class property data=%0d",this.data);
  endfunction
endclass



module class_this_tb;
  transaction transaction_h;

  initial begin
    transaction_h = new();
    transaction_h.display(200);
    $display("Transaction class data=%0d",transaction_h.data);
    transaction_h.display(100);
    $display("Transaction class data=%0d",transaction_h.data);
  end
endmodule
