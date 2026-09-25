// Code your design here
module port_connection(input  [2:0] a_in,b_in,
                       output reg [2:0] c_out,d_out);
  

/*
  Using an initial block in the design can cause a race condition
  between the testbench initial block and the design initial block,
  because both execute in the Active region.

  Using always @(*) in the design avoids this race condition because
  the block is event-driven and is triggered when its input signals
  change after the testbench updates them.
*/
  
//   initial begin 
//     c_out = a_in & b_in;
//     d_out = a_in | b_in;
//   end
  
  
//   initial begin 
//     c_out = a_in & b_in;
//     #0 d_out = a_in | b_in;
//   end 
  
//   initial begin 
//     #0 c_out = a_in & b_in;
//     d_out = a_in | b_in;
//   end 
  
//   initial begin
//     #10 c_out = a_in & b_in;
//     #0 d_out = a_in | b_in;
//   end 
  
//   initial begin
//     #20 c_out = a_in & b_in;
//     #0 d_out = a_in | b_in;
//   end 
  
  always @ (*) begin 
    c_out = a_in & b_in;
    d_out = a_in | b_in;
  end
 
endmodule 
  
