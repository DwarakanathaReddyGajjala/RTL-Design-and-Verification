module SIPO_tb;

  reg   in,clk,rst;
  wire  [3:0] out ; 

  SIPO inst (
    .serial_in     ( in    ),
    .clk           ( clk   ),
    .rst           ( rst   ),
    .parallel_out  ( out  )  
  );

  initial
    forever #5 clk = ~clk;

  initial begin 
    $dumpfile ("SIPO.vcd");
    $dumpvars (0,SIPO_tb);
  end 

  initial begin 
     clk = 0; rst = 1;
    $display($time,"before 1st posedge in=%0d",in); 
    @(posedge clk);#1;
    $display($time,"after 1st posedge before input update in=%0d",in); 
    rst = 0 ; in = 1;
    $display($time,"after 1st posedge after input update in=%0d",in); 
    
    $display($time,"before 2nd posedge in=%0d",in); 
    @(posedge clk);
    $display($time,"after 2st posedge before input update in=%0d",in); 
    in = 1;
    $display($time,"after 2st posedge after input update in=%0d",in); 

    $display($time,"before 3rd posedge in=%0d",in); 
    @(posedge clk);
    $display($time,"after 3rd posedge before input update in=%0d",in); 
    in = 0;
    $display($time,"after 3rd posedge after input update in=%0d",in); 

    $display($time,"before 4th posedge in=%0d",in); 
    @(posedge clk);
    $display($time,"after 4th posedge before input update in=%0d",in); 
    in = 1;
    $display($time,"after 4th posedge after input update in=%0d",in); 

    $display($time,"before 5th posedge in=%0d",in); 
    @(posedge clk);
    $display($time,"after 5th posedge before input update in=%0d",in); 
    in = 0;
    $display($time,"after 5th posedge after input update in=%0d",in); 


    $display($time,"before 6th posedge in=%0d",in); 
    @(posedge clk);
    $display($time,"after 6th posedge before input update in=%0d",in); 
    in = 1; 
    $display($time,"after 6th posedge after input update in=%0d",in); 

    $display($time,"before 7th posedge in=%0d",in); 
    @(posedge clk);
    $display($time,"after 7th posedge before input update in=%0d",in); 
    in = 1;
    $display($time,"after 7th posedge after input update in=%0d",in); 

    $display($time,"before 8th posedge in=%0d",in); 
    @(posedge clk);
    $display($time,"after 8th posedge before input update in=%0d",in); 
    in = 1;
    $display($time,"after 8th posedge after input update in=%0d",in); 

    $display($time,"before 9th posedge in=%0d",in); 
    @(posedge clk);
    $display($time,"after 9th posedge before input update in=%0d",in); 
    in = 0;
    $display($time,"after 9th posedge after input update in=%0d",in); 

    #100 $finish  ;
  end
   
endmodule   
