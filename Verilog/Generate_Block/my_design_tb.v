// Code your testbench here
// or browse Examples
// Code your testbench here
// or browse _Examples
module my_design_tb;
  
  parameter N = 10;
  reg  [N-1] a,b;
  wire [N-1] c,s;
  
  my_design #(10) DUT (a,b,c,s);
  
  initial begin 
    $monitor("a=%b,b=%b,s=%b,c=%b",a,b,s,c);
  end 
  
  initial begin 
    a = 'b11_0011_1010; b = 'b10_1100_1100; 
  end 

endmodule   
