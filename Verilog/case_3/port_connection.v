// Code your design here
module port_connection(input  [2:0] a_in,b_in,
                       output [2:0] c_out,d_out);
  
  assign c_out = a_in & b_in;
  assign d_out = a_in | b_in;
  
endmodule 
  
