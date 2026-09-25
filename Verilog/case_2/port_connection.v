// Code your design here
module port_connection(input  [2:0] a_in,b_in,
                       output reg [2:0] c_out,d_out);
  

/*
  An initial block executes only once during simulation. Even if new
  input stimulus is applied from the testbench at a later time, the
  design initial block will not execute again to respond to those
  input changes.

  Using an initial block in the design can cause a race condition
  between the testbench initial block and the design initial block,
  because both execute in the Active region.

  The always @(*) block is event-driven and can execute multiple times
  whenever its input signals change. Therefore, it responds to every
  new input stimulus from the testbench.
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
  
