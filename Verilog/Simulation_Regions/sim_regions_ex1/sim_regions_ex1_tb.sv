module sim_regions_ex1_tb;
  reg clk;
  reg  [9:0] a;
  wire [9:0] b;
  
  test dut (clk,a,b);
  
  always #5 clk =~clk;
  
  initial clk = 0;
  
  initial begin 
//     @(posedge clk)  a = 5;
//     @(posedge clk)  a = 10;
//     @(posedge clk)  a = 15;
//     @(posedge clk)  a = 20;
    @(posedge clk); #0;  a = 5;
    @(posedge clk); #0;  a = 10;
    @(posedge clk); #0;  a = 15;
    @(posedge clk); #0;  a = 20;
  end 

  initial
    $monitor("[%0t]clk=%0d,a=%0d,b=%0d",$time,clk,a,b);
  
//    initial
//     repeat(4) 
//       begin
//         @(posedge clk);  
//         $display("[%0t]clk=%0d,a=%0d,b=%0d",$time,clk,a,b); 
//       end
  
  initial #55 $finish;
  
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,sim_regions_ex1_tb);
  end 
  
endmodule 

                   
                                 
                         
                         


    
