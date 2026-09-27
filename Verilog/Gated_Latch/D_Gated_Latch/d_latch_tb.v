// Code your testbench here
// or browse Examples
module d_latch_tb;
  
  reg  d, en, resetn;
  wire q, qbar       ;

  d_latch inst (.d       ( d      ),
                .en      ( en     ),
                .resetn  ( resetn ),
                .q       ( q      ),
                .qbar    ( qbar   ));
  
  initial begin 
    resetn = 0; en = 0; d = 0;
    #2 resetn = 1; d = 1;
    #2 en = 1;
    repeat (4) #2 d = ~d;
    #2 en = 0;
    repeat (4) #2 d = ~d;
  end
  
  initial begin    $monitor($time,"d=%b,en=%b,resetn=%b,q=%0b,qbar=%0b",d,en,resetn,q,qbar);
    #22 $finish ;
  end
 
endmodule   
