// Code your testbench here
// or browse Examples
module sr_ff_tb;

  reg  s_i,r_i ;
  reg  clock_i ;
  reg  resetn_i;
  wire q_o     ;
  wire qbar_o  ;

//     localparam delay = 10;  
      parameter delay = 10; 


  sr_ff inst (
    .i_s      ( s_i      ),
    .i_r      ( r_i      ),
    .i_clock  ( clock_i  ),
    .i_resetn ( resetn_i ),
    .o_q      ( q_o      ),
    .o_qbar   ( qbar_o   )
  );

  
  always  #(delay/2) clock_i = ~clock_i;

  initial begin 
    $dumpfile ("sr_ff.vcd");
    $dumpvars (0,sr_ff_tb);
  end 

  initial
    $monitor($time,"s_i=%d,r_i=%d,clock_i=%d,resetn_i=%d,q_o=%d,qbar_o=%d",s_i,r_i,clock_i,resetn_i,q_o,qbar_o);

  initial begin 
    clock_i = 0;resetn_i = 0;
    #7 resetn_i = 1;
  end
  
  initial begin 
    #delay s_i = 1; r_i = 0;  
    #delay s_i = 0; r_i = 0;
    #delay s_i = 0; r_i = 1;
    #delay s_i = 0; r_i = 0;
    #delay s_i = 1; r_i = 1;
    #delay s_i = 0; r_i = 1;
    #delay s_i = 1; r_i = 0;
    #delay s_i = 0; r_i = 1;
    #1 $finish;
  end 

endmodule   
