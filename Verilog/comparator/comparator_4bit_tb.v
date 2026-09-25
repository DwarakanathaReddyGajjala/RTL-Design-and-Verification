// Code your testbench here
// or browse Examples
module comparator_4bit_tb;
  
  reg  [3:0] a,b;
  reg  equal,greter,lesser;
  
  comparator_4bit inst (.a      (a     ),
                        .b      (b     ),
                        .equal  (equal ),
                        .greter (greter),
                        .lesser (lesser));
  
// By default, the number format is decimal.
  initial begin 
       a = 4'b1011; b = 4'b1000; 
    #1 a = 4'b1001; b = 4'b1110; 
    #1 a = 4'b1100; b = 4'b1100; 
    #1 a = 4'b1110; b = 4'b1001; 
	#1 a = 4'b1010; b = 4'b1011; 
    #1 a = 4'b1000; b = 4'b1000; 
    #1 a = 4'b1110; b = 4'b1011; 
  end
  
  initial
  $monitor($time,"a=%b,b=%b,equal=%b,greter=%b,lesser=%b",
  a,b,equal,greter,lesser);
  
endmodule   
