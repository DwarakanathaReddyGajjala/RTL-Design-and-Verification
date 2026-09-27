// Code your testbench here
// or browse Examples
module SIPO_tb;

  reg   in,clk,rst;
  wire  [3:0] out ; 

  SIPO inst (
    .in   ( in    ),
    .clk  ( clk   ),
    .rst  ( rst   ),
    .out  ( out  )  
  );
  

  initial
    forever #5 clk = ~clk;

  initial begin 
    $dumpfile ("SIPO.vcd");
    $dumpvars (0,SIPO_tb);
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
