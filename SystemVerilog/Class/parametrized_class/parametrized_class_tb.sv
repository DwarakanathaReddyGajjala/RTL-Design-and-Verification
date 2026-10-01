/*
  ============================================================
                  PARAMETERIZED CLASS
  ============================================================

  - A parameterized class allows us to use the same class with
    different values or different data types.

  - In this example, the transaction class has two parameters:

        n
        data_type

  ============================================================
                       VALUE PARAMETER
  ============================================================

  - n is a value parameter.

        parameter n = 5

  - The default value of n is 5.

  - While creating the class handle, we can give a different
    value:

        transaction #(200) tr;

  - Therefore, for this object:

        n = 200

  - The value of n is used inside the class:

        data = n;

  - So, data becomes 200.

  ============================================================
                        TYPE PARAMETER
  ============================================================

  - data_type is a type parameter.

        type data_type = error_transaction

  - The default type of data_type is error_transaction.

  - It is used to declare the err_transac handle:

        data_type err_transac;

  - Since no different type is provided during instantiation,
    data_type remains error_transaction.

  - Therefore, this is equivalent to:

        error_transaction err_transac;

  - The error_transaction object is then created using:

        tr.err_transac = new();

  ============================================================
                    CLASS INSTANTIATION
  ============================================================

        transaction #(200) tr;

  - Here, 200 is given to the first parameter n.

  - The second parameter data_type is not changed, so its
    default type error_transaction is used.

  - Therefore:

        n         → 200
        data_type → error_transaction

  ============================================================
*/



class error_transaction;
  bit [31:0] data1=100;
  bit [31:0] id1=10;
endclass

class transaction #( parameter n=5, type data_type = error_transaction);
  bit [31:0] data;
  data_type err_transac;

  function void display();
    data = n;
    $display("trasaction class:data=%0d",data);
    $display("error transaction class: err_transac.data1=%0d,err_transac.id1=%0d",err_transac.data1,err_transac.id1);
  endfunction 
endclass

/*
  ============================================================
          PARAMETERIZED CLASS vs PARAMETERIZED MODULE
  ============================================================

  - Both classes and modules can have parameters.

  - The main difference is where they are used.

  ============================================================
                  PARAMETERIZED CLASS
  ============================================================

  - A parameterized class is used mainly to create reusable
    class-based objects with different values or data types.

  - Parameters are provided when creating the class handle.

        transaction #(200) tr;

  - The parameters can be:

        Value parameter → n
        Type parameter  → data_type

  - A parameterized class is commonly used in SystemVerilog
    testbenches, especially for reusable transactions and
    verification components.


  ============================================================
                 PARAMETERIZED MODULE
  ============================================================

  - A parameterized module is used to create reusable hardware
    with different parameter values.

  - Parameters are provided when the module is instantiated.

        counter #(8) dut (...);

  - The parameter can be used to change the hardware
    characteristics, such as width, depth, or size.

  - A parameterized module is used for RTL/design hardware.


  ============================================================
                    MAIN DIFFERENCE
  ============================================================

  Parameterized Class
  ------------------------------------------------------------
  - Used for class objects.
  - Mainly used in testbenches and verification.
  - Can use value and type parameters.
  - Example:

        transaction #(200) tr;


  Parameterized Module
  ------------------------------------------------------------
  - Used for hardware modules.
  - Mainly used in RTL/design.
  - Commonly uses value parameters to change hardware size
    or configuration.
  - Example:

        counter #(8) dut (...);


  ============================================================
*/

module parametrized_class_tb;
  transaction #(200)tr ;
  initial begin
    tr             = new();    
    tr.err_transac = new();
    tr.display() ;
  end
endmodule 
