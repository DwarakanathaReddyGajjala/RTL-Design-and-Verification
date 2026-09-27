// Code your testbench here
// or browse Examples
module jk_latch_tb;
  
  reg  j,k   ;
  wire q,qbar;

  jk_latch inst (.j    ( j   ),
                 .k    ( k   ),
                 .q    ( q   ),
                 .qbar ( qbar));
  initial begin 
       j = 0; k = 1;// output 01
    #2 j = 0; k = 0;// output 01...hold
    #2 j = 1; k = 0;// output 10
    #2 j = 0; k = 0;// output 10...hold
    
    #2 j = 0; k = 1;// output 01...reset
    #2 j = 0; k = 0;// output 01
    #2 j = 0; k = 1;// output 01...reset

    #2 j = 1; k = 0;// output 10...set
    #2 j = 0; k = 0;// output 10
    #2 j = 1; k = 0;// output 10...set
    
    #2 j = 1; k = 1;// output Toggling
    #2 j = 0; k = 1;// output 01
    #2 j = 1; k = 1;// output Toggling
    
    #2 j = 0; k = 0;// output 
    #2 j = 1; k = 1;// output Toggling
    #2 j = 0; k = 0;// output 
    #2 j = 1; k = 1;//  output Toggling
    #2 j = 0; k = 0;// output 

  end
  
  initial  
    $monitor($time,"j=%0b,k=%0b,q=%0b,qbar=%0b",j,k,q,qbar);
 
endmodule   
