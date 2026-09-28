// Code your testbench here 
// or browse Examples
module moore_1101_fsm_non_overlap_tb;
  
  reg in,clk,rst;
  wire out;
  
  moore_1101_fsm_non_overlap DUT 
  (
   .clk (clk ),
   .rst (rst ),
   .in  (in  ),
   .out (out )
  );
  
  always #5 clk = ~clk;
    
  initial begin 
    clk = 0; rst = 1;
    @(posedge clk);
    #1; rst = 0; in = 1;
    @(posedge clk);
    #1; in = 1;
    @(posedge clk);
    #1; in = 0;
    @(posedge clk);
    #1; in = 1;
    #100 $finish;
  end 
  
  
//   initial begin 
//     clk = 0; rst = 1;
//     @(posedge clk);
//     #1; rst = 0; 
//     repeat(100) begin
//       @(posedge clk);
//       #1; in = $random;
//     end 
//     #100 $finish;
//   end 
  
   initial begin 
     $dumpfile("moore_1101_fsm_non_overlap.vcd");
     $dumpvars(0,moore_1101_fsm_non_overlap_tb);
  end 
  
endmodule

      
