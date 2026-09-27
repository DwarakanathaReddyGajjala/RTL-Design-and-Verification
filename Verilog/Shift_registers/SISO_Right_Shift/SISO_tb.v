// Code your testbench here
// or browse Examples
module SISO_tb;

  reg   in,clk,rst;
  wire  out ; 

  SISO inst (
    .serial_in   ( in    ),
    .clk         ( clk   ),
    .rst         ( rst   ),
    .serial_out  ( out  )  
  );

  initial
    forever #5 clk = ~clk;

  initial begin 
    $dumpfile ("SISO.vcd");
    $dumpvars (0,SISO_tb);
  end 

  initial begin 
     clk = 0; rst = 1;
    @(posedge clk);#1;
    rst = 0 ; in = 1;
    @(posedge clk);
    in = 0;
    @(posedge clk);
    in = 1;
    @(posedge clk);
    in = 1;
     @(posedge clk);
    in = 0;
    @(posedge clk);
    in = 1; 
    @(posedge clk);
    in = 0;
    @(posedge clk);
    in = 1;
    @(posedge clk);
    in = 0;
    #100 $finish  ;
  end 
   
endmodule   
