// Code your testbench here
// or browse Examples
module PISO_tb;

  reg   [3:0]  in           ;
  reg          clk, rst,load;
  wire         out          ; 

  PISO inst (
    .clk           ( clk   ),
    .rst           ( rst   ),
    .load          ( load  ),
    .parallel_in   ( in    ),
    .serial_out    ( out   )  
  );

  initial
    forever #5 clk = ~clk;

  initial begin 
    $dumpfile ("PISO.vcd");
    $dumpvars (0,PISO_tb);
  end 

  initial begin 
     clk = 0; rst = 1;
    @(posedge clk);
    #1;
    
    rst = 0 ; in = 4'b1011; load = 1;
    @(posedge clk);
    @(posedge clk);#1;
    load = 0;
    #60;
    
    in = 4'b1001  ; load = 1;
    @(posedge clk);
    @(posedge clk);#1;
    load = 0;
    #100 $finish  ;
  end
   
endmodule   
