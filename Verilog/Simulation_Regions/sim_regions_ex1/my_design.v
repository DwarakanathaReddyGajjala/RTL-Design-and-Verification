// Code your design here
module my_design(input clk,
            input  [9:0] a,
            output reg [9:0] b);
  
  always@(posedge clk) 
    b <= a;
   
  
endmodule 
