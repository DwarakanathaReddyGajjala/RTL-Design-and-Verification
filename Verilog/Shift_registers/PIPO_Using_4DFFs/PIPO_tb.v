// Code your testbench here
// or browse Examples
module PIPO_tb;

  reg   [3:0] in      ;
  reg         clk,rst ;
  wire  [3:0] out     ; 

  PIPO inst (
    .parallel_in   ( in    ),
    .clk           ( clk   ),
    .rst           ( rst   ),
    .parallel_out  ( out  )  
  );

  initial
    forever #5 clk = ~clk;

  initial begin 
    $dumpfile ("PIPO.vcd");
    $dumpvars (0,PIPO_tb);
  end 

  initial begin 
     clk = 0; rst = 1;
    @(posedge clk);#1;
    rst = 0 ; in =1;
    @(posedge clk);
    in = 2;
    @(posedge clk);
    in = 3;
    @(posedge clk);
    in = 7;
     @(posedge clk);
    in = 6;
    @(posedge clk);
    in = 5; 
    @(posedge clk);
    in = 0;
    @(posedge clk);
    in = 4;
    @(posedge clk);
    in = 0;
    #100 $finish  ;
  end
   
endmodule   
