// Code your testbench here
// or browse Examples
module parameterized_counter_tb;

  reg        clk_i,rst_i;
  wire [5:0] count_o    ;
  
  
  parameterized_counter #(.COUNTER_WIDTH(6))
    inst (
    .i_clock  ( clk_i    ),
    .i_reset  ( rst_i    ),
    .o_count  ( count_o  )
  );

  initial
    forever #5 clk_i = ~clk_i;

  initial begin 
    $dumpfile ("counter.vcd");
    $dumpvars (0,parameterized_counter_tb);
  end 

 
  initial begin 
    clk_i = 0; rst_i = 1;
    $display($time,"Before the 1st posedge clock rst = %0d",rst_i);
    @(posedge clk_i); 
    $display($time,"after the 1st posedge clock before the rst update rst = %0d",rst_i);

    #1;
    rst_i = 0;
    $display($time,"after the 1st posedge clock aafter the rst update rst = %0d",rst_i);

    #400 $finish  ;
  end
  
endmodule   
