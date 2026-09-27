// Code your testbench here
// or browse Examples
module t_ff_tb;

  reg  t_i     ;
  reg  clock_i ;
  reg  reset_i ;
  wire q_o     ;
  wire qbar_o  ;

  

  t_ff inst (
    .i_t      ( t_i      ),
    .i_clock  ( clock_i  ),
    .i_reset  ( reset_i  ),
    .o_q      ( q_o      ),
    .o_qbar   ( qbar_o   )
  );

  
  always  #5 clock_i = ~clock_i;

  initial begin 
    $dumpfile ("t_ff.vcd");
    $dumpvars (0,t_ff_tb);
  end 

  initial
    $monitor($time,"t_i=%d,,clock_i=%d,reset_i=%d,q_o=%d,qbar_o=%d",t_i,clock_i,reset_i,q_o,qbar_o);

  initial begin 
    clock_i = 0;reset_i = 1;
    #7 reset_i = 0;
  end
  
  initial begin 
    #10 t_i = 1; 
    #10 t_i = 0;
    #10 t_i = 1; 
    #10 t_i = 0;
    #10 t_i = 1; 
    #10 t_i = 0;
    #10 t_i = 1; 
    #10 t_i = 0; 
    #10 t_i = 1; 
    #20 $finish;
  end 

endmodule   
