// Code your testbench here
// or browse Examples
module port_connection_tb;
  
//   tb   .... design 
//   reg  -->  wire 
//   wire <--  reg 

  reg  [2:0] a, b;
  wire [2:0] c, d;
  
  port_connection inst (.a_in   (a),
                        .b_in   (b),
                        .c_out  (c),
                        .d_out  (d));

  /* #0 is used to avoid the race condition between the display 
     statement(Active region) and the design always block, 
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
   
  
  
  
