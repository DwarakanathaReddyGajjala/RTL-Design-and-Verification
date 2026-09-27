// Code your design here
module d_ff(input       din     ,
             input      clk, rst,
             output reg qout    );
       
  always@(posedge clk)  
    if(rst)  
      qout <= 1'b0;
    else
      qout <= din;
                           
endmodule
