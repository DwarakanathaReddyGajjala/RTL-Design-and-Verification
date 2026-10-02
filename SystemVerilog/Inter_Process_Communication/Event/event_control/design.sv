//code1a,1b
// module design1(input  [1:0]  a,     
//                input clk,
//                output reg [1:0] y);
 
//   always_ff @( clk) begin 
//     y = a;
//   end 
  
// endmodule 


//code1c,1d
module design1(input  [1:0]  a,
               input clk,
               output reg [1:0] y);
  
  always_ff @(posedge clk) begin 
    y = a;
  end 
endmodule 




    


