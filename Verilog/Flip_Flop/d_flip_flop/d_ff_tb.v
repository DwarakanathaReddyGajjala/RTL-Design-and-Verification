// Code your testbench here
// or browse Examples
module d_ff_tb;

  reg  din ;
  reg  clk ;
  reg  rst ;
  wire qout;

  d_ff inst (
    .din   ( din   ),
    .clk   ( clk   ),
    .rst   ( rst   ),
    .qout  ( qout  ),
    .qbar  (       )
  );

  
  always  #5 clk = ~clk;

  initial begin 
    $dumpfile ("d_ff.vcd");
    $dumpvars (0,d_ff_tb);
  end 

  initial begin 
       clk = 0; rst = 1;
    @(posedge clk);  
    #2 rst = 0; din = 1;
  end
  
  initial begin 
    @ (posedge clk) din = 0;  
    @ (posedge clk) din = 1;  
    @ (posedge clk) din = 0;  
    @ (posedge clk) din = 1;  
    #10 $finish;
  end 

endmodule   
