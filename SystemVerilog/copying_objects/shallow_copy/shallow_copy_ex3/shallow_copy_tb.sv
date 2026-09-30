/*
  ============================================================
          SHALLOW COPY — NESTED CLASS HANDLE EXAMPLE
  ============================================================

  - The transaction class contains a handle named err_tr,
    which points to an object of class error_trans.

  - When:

        tr2 = new tr1;

    is executed, a new transaction object is created for tr2.

  - The simple properties data and id are copied into the
    new transaction object.

  - The err_tr handle is also copied.

  - However, shallow copy does not create a new error_trans
    object for tr2.

  - Therefore, tr1 and tr2 point to different transaction
    objects, but their err_tr handles point to the same
    error_trans object.

        tr1 ──→ Transaction Object 1
                   |
                   | err_tr
                   ↓
              Error Object A
                   ↑
                   | err_tr
                   |
        tr2 ──→ Transaction Object 2

  - Changing tr1.data or tr1.id does not affect tr2.data or
    tr2.id because they belong to different transaction
    objects.

  - However, changing:

        tr1.err_tr.err_data
        tr1.err_tr.error

    also changes the values seen through tr2.err_tr because
    both err_tr handles point to the same error_trans object.

  - Therefore, shallow copy creates a new transaction object,
    but nested class handles still point to the same nested
    object.

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
    $display("error_trans: err_data = %0h, error = %0d\n", err_tr.err_data, err_tr.error);
  endfunction
endclass

module shallow_copy_tb;
  transaction tr1, tr2;
  
  initial begin
    tr1 = new();
    tr1.display();
    
    tr2 = new tr1;
    tr2.display();
    
    tr1.data = 200;
    tr1.id = 2;
    tr1.err_tr.err_data = 32'h1234;
    tr1.err_tr.error = 0;
    
    tr1.display();
    tr2.display();
    
  end
endmodule
