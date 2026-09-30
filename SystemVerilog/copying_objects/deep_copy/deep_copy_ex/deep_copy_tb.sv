/*
  ============================================================
             DEEP COPY — USING A DEEP_COPY METHOD
  ============================================================

  - A deep copy creates an independent copy of the object
    and its nested class object.

  - In this example, transaction contains a class handle:

        error_trans err_tr;

  - The error_trans object is created when the transaction
    object is created.

  - First, a separate transaction object is created for tr2:

        tr2 = new();

  - The deep_copy() method is then called:

        tr2.deep_copy(tr1);

  - Inside deep_copy(), the simple properties are copied:

        this.data = tr.data;
        this.id   = tr.id;

  - The properties of the nested error_trans object are also
    copied:

        this.err_tr.err_data = tr.err_tr.err_data;
        this.err_tr.error    = tr.err_tr.error;

  - Therefore, tr1 and tr2 have different transaction objects
    and different error_trans objects.

        tr1 ──→ Transaction Object 1
                  |
                  | err_tr
                  ↓
              Error Object 1


        tr2 ──→ Transaction Object 2
                  |
                  | err_tr
                  ↓
              Error Object 2

  - Changing data or id through tr1 does not affect tr2.

  - Changing err_data or error through tr1.err_tr does not
    affect tr2.err_tr.

  - Similarly, changing the properties through tr2 does not
    affect tr1.

  - The following code would NOT perform a deep copy:

        this.err_tr = tr.err_tr;

  - This only copies the err_tr handle.

  - After that assignment, both transaction objects would have
    err_tr handles pointing to the same error_trans object.

  - Therefore, in this example, copying the nested object's
    properties separately is what keeps the nested objects
    independent.

  ============================================================
*/


class error_trans;  
  bit [31:0] err_data;
  bit error;
  
  function new(bit [31:0] err_data, bit error);
    this.err_data = err_data;
    this.error = error;
  endfunction
endclass
// 
class transaction;
  bit [31:0] data;
  int id;
  error_trans err_tr;
  
  function new();
    data = 100;
    id = 1;
    err_tr = new(32'hFFFF_FFFF, 1);
  endfunction
  
  function void display();
    $display("transaction: data = %0d, id = %0d", data, id);
    $display("error_trans: err_data = %0h, error = %0d", err_tr.err_data, err_tr.error);
  endfunction
  
  function void deep_copy(transaction tr);
    this.data = tr.data;
    this.id = tr.id;
    this.err_tr.err_data = tr.err_tr.err_data;
    this.err_tr.error = tr.err_tr.error;
//     this.err_tr = tr.err_tr;// this copies the err_tr handle (reference), not the object data.
//     Therefore, tr1.err_tr and tr2.err_tr point to the same err_tr object memory.
  endfunction
endclass

module deep_copy_example;
  transaction tr1, tr2;
  
  initial begin
    tr1 = new();
    tr1.display();
    
    tr2 = new();
    tr2.deep_copy(tr1);
    tr2.display();
    
    tr1.data = 200;
    tr1.id = 2;
    tr1.err_tr.err_data = 32'h1234;
    tr1.err_tr.error = 0;
    
    tr1.display();
    tr2.display();
    
    
    tr2.data = 300;
    tr2.id = 3;
    tr2.err_tr.err_data = 32'h3234;
    tr2.err_tr.error = 1;
    
    tr1.display();
    tr2.display();
    
  end
endmodule
