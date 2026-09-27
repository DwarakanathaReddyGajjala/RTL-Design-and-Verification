// Code your testbench here
// or browse Examples
module d_latch_tb;
  
  reg  d     ;
  wire q,qbar;

  d_latch inst (.d    ( d   ),
                .q    ( q   ),
                .qbar ( qbar));
  
  initial begin 
       d = 0; 
    #2 d = 1; 
    #2 d = 0;
    #2 d = 1; 
  end
  
  initial  
    $monitor($time,"d=%0b,q=%0b,qbar=%0b",d,q,qbar);
 
endmodule   
