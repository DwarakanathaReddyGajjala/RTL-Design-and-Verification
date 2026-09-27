// Code your testbench here
// or browse Examples
module t_latch_tb;
  
  reg  t,resetn;
  wire q,qbar;

  t_latch inst (.resetn (resetn),
                .t      ( t    ),
                .q      ( q    ),
                .qbar   ( qbar ));
  
  initial begin 
       resetn = 0; t = 0;
    #3 resetn = 1; t = 1;
    #3 t = 0;
    #3 t = 1;
    #3 resetn = 0; t = 0;
    #3 resetn = 1; t = 0;
    #3 t = 1;
  end
  
  
  initial  
    $monitor($time,"t=%0b,q=%0b,qbar=%0b",t,q,qbar);
 
endmodule   
