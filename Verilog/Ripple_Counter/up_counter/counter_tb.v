// Code your testbench here
// or browse Examples
module counter_tb;

  reg        clk_i,rst_i;
  wire [3:0] count_o    ;
  
  counter inst (
    .i_clock  ( clk_i    ),
    .i_reset  ( rst_i    ),
    .o_count  ( count_o  )
  );

  initial
    forever #5 clk_i = ~clk_i;

  initial begin 
    $dumpfile ("counter.vcd");
    $dumpvars (0,counter_tb);
  end 

  initial begin 
     clk_i = 0; rst_i = 1;
    @(negedge clk_i);
    #1 rst_i = 0;
    #200 $finish  ;
  end
  
endmodule   
