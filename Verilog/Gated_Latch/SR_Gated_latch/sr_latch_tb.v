// Code your testbench here
// or browse Examples
module sr_latch_tb;
  
  reg  s,r       ;
  reg  en,resetn ;
  wire q,qbar;

  sr_latch inst (.s       ( s      ),
                 .r       ( r      ),
                 .en      ( en     ),
                 .resetn  ( resetn ),
                 .q       ( q      ),
                 .qbar    ( qbar   ));
  
  
  initial begin 
       resetn = 0;
    #2 resetn = 1;s = 0; r = 0;
    
    #2 en = 1; s = 0; r = 0;
    #2 s = 0; r = 1;
    #2 s = 1; r = 0;
    #2 s = 1; r = 1;
    #2 s = 1; r = 0;
    #2 s = 0; r = 1;
    #2 s = 0; r = 0;
    
    #2 en = 0; s = 1; r = 1;
    #2 s = 0; r = 1;
    #2 s = 1; r = 0;
    #2 s = 0; r = 0;
    
    #2 en = 1;s = 1; r = 1;
    #2 s = 0; r = 0;
    #2 s = 1; r = 0;
    #2 s = 0; r = 0;
  end
  

  initial begin  
    $monitor($time,"s=%b,r=%b,en=%b,resetn=%b,q=%0b,qbar=%0b",s,r,en,resetn,q,qbar);
    #33 $finish ;
  end
 
  
endmodule   
