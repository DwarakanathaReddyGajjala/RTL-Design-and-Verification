// Code your testbench here
// or browse Examples
module half_adder_tb;
  
  reg  a, b ;
  wire sum, carry;
  
  half_adder inst (.a_in      (a    ),
                   .b_in      (b    ),
                   .sum_out   (sum  ),
                   .carry_out (carry));
  initial begin 
    $monitor($time,"a=%0b,b=%0b,sum=%0b,carry=%0b",a,b,sum,carry);
    a = 0; b = 0;
    #5 a = 0; b = 1;
    #5 a = 1; b = 0;
    #5 a = 1; b = 1;
    #5 $finish;
  end
  
endmodule
