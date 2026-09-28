// Code your testbench here
// or browse Examples
module mealy_1101_fsm__non_overlap_tb;
   
  reg in,clk,rst;
  wire out;
  
  mealy_1101_fsm__non_overlap DUT 
  (
   .clk (clk ),
   .rst (rst ),
   .in  (in  ),
   .out (out )
  );
  
  always #5 clk = ~clk;
    
//   initial begin 
//     clk = 0; rst = 1;
//     @(posedge clk);
//     #1; rst = 0; in = 1;
//     @(posedge clk);
//     #1; in = 1;
//     @(posedge clk);
//     #1; in = 0;
//     @(posedge clk);
//     #1; in = 1;
//     #100 $finish;
//   end 
  
  
  initial begin 
    clk = 0; rst = 1;
    @(posedge clk);
    #1; rst = 0; 
    repeat(100) begin
      @(posedge clk);
      #1; in = $random;
    end 
    #100 $finish;
  end 
  
   initial begin 
     $dumpfile("mealy_1101_fsm__non_overlap.vcd");
     $dumpvars(0,mealy_1101_fsm__non_overlap_tb);
  end 
  
endmodule

      
