// Code your testbench here
// or browse Examples
module t_latch_tb;
  
  reg  t, en, resetn;
  wire q, qbar       ;

  t_latch inst (.t       ( t      ),
                .en      ( en     ),
                .resetn  ( resetn ),
                .q       ( q      ),
                .qbar    ( qbar   ));
  
  initial begin 
    resetn = 0; en = 0; t = 0;
    #2 resetn = 1; t = 1;
    #2 en = 1;
    repeat (4) #2 t = ~t;
    #2 en = 0;
    repeat (4) #2 t = ~t;
  end
  
  initial begin   $monitor($time,"t=%b,en=%b,resetn=%b,q=%0b,qbar=%0b",t,en,resetn,q,qbar);
    #22 $finish ;
  end
 
endmodule   
