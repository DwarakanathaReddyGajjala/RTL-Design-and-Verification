// Code your testbench here
// or browse Examples
module full_adder_tb;
  
  reg  a, b, c ;
  wire sum, carry;
  
  full_adder inst (.a_in      (a    ),
                   .b_in      (b    ),
                   .c_in      (c    ),
                   .sum_out   (sum  ),
                   .carry_out (carry));
  initial begin 
    $monitor($time,"a=%0b,b=%0b,c=%0b,sum=%0b,carry=%0b",a,b,c,sum,carry);
    a = 0; b = 0; c = 0;
    #5 a = 0; b = 0; c = 1;
    #5 a = 0; b = 1; c = 0;
    #5 a = 0; b = 1; c = 1;
    #5 a = 1; b = 0; c = 0;
    #5 a = 1; b = 0; c = 1;
    #5 a = 1; b = 1; c = 0;
    #5 a = 1; b = 1; c = 1;
    #5 $finish ;
    
  end
  
endmodule
