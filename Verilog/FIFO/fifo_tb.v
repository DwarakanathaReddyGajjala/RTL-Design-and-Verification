// Code your testbench here 
// or browse Examples
module fifo_tb;
  reg         clk,rst,wr_en,rd_en;
  reg   [7:0] data_in            ;
  wire  [7:0] data_out           ;
  wire        full,empty         ;
   
  fifo #(.FIFO_DEPTH(10),
         .FIFO_WIDTH(8))
  inst (
    .clk_i      (clk      ),
    .rst_i      (rst      ),
    .wr_en      (wr_en    ),
    .data_in    (data_in  ),
    .rd_en      (rd_en    ),
    .data_out   (data_out ),
    .full_o     (full     ),
    .empty_o    (empty    )
  );
  
  initial begin 
    $dumpfile("fifo.vcd");
    $dumpvars(0,fifo_tb);
  end 
  
  always #5 clk = ~clk;
  
  initial begin 
    clk = 0; rst = 1; wr_en = 0; rd_en = 0; data_in = 0;
    @(posedge clk); 
    #1 rst = 0; 
    repeat(5) begin 
      wr_en = 1;
      repeat(10) begin 
        #1;
        data_in = $random;
        @(posedge clk);
      end 
      #1;
      data_in = 0; wr_en = 0; rd_en = 1;
      repeat(10)  @(posedge clk);
      #1;
      rd_en = 0;
    end 
    #150 $finish;
  end 

endmodule   
