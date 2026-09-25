// Code your testbench here
// or browse Examples
module port_connection_tb;
  
//   tb   .... design 
//   wire  -->  wire 
//   wire <--  wire 
  
  reg  [2:0] a, b;
  wire [2:0] a_1, b_1;
  wire [2:0] c, d;
  
  assign a_1 = a;
  assign b_1 = b;
  
  port_connection inst (.a_in   (a_1),
                        .b_in   (b_1),
                        .c_out  (c  ),
                        .d_out  (d  ));
  
  /* #0 is used to avoid the race condition between the display statement
    (Active region) and the design assignment statement (Active region), 
    as #0 moves the display statement to the Inactive region.*/
  initial begin 
    a = 3; b = 5;
    #0 $display($time,"a=%b,b=%b,c=%b,d=%b",a,b,c,d);
    #10 a = 2; b = 6;
    #0 $display($time,"a=%b,b=%b,c=%b,d=%b",a,b,c,d);
    #10 a = 4; b = 5;
    #0 $display($time,"a=%b,b=%b,c=%b,d=%b",a,b,c,d);
  end
  
endmodule
   
  
  
  
