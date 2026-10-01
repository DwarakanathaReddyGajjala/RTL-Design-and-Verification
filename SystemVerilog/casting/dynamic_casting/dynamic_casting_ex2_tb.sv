/*
  ============================================================
            DYNAMIC CASTING — INCOMPATIBLE CLASSES
  ============================================================

  - trascation1 and trascation2 are two different and
    unrelated class types.

  - Direct assignment:

        tr2 = tr1;

    gives a compile-time error because the class types are
    incompatible.

  - Dynamic casting:

        $cast(tr2, tr1);

    checks the compatibility at runtime.

  - Since tr1 points to a trascation1 object and tr2 is a
    trascation2 handle, the dynamic cast fails.

  - $cast() does not make two incompatible class types
    compatible.

  - Therefore:

        Direct assignment → Compile-time error
        $cast()           → Runtime cast failure

  ============================================================
*/


class trascation1;
  int data1 = 100;
  int id1=10;
  function void display();
    $display("trascation1 class data1=%0d,id1=%0d",data1,id1);
  endfunction
endclass

class trascation2;
  int data2=200;
  int id2=20;
  function void display();
    $display("trascation2 class data2=%0d,id2=%0d",data2,id2);
  endfunction
endclass

module dynamic_casting_ex2_tb;
  trascation1 tr1;
  trascation2 tr2;
  
  initial begin 
    tr1 = new();
    tr2 = new();
//     tr2 = tr1;  //Compile-time error: Illegal class assignment (incompatible class types)
    $cast(tr2,tr1);// Runtime error: Dynamic cast failed due to incompatible (type-mismatched) class objects
    tr1.display();
    tr2.display(); 
  end 
  
endmodule 
