// Code your design here 
module SIPO(input       in,clk, rst,
            output reg  [3:0] out  );
   
  
  /*
  ============================================================
              SIPO SHIFT REGISTER — (Right shift)
  ============================================================

  - A SIPO (Serial-In Parallel-Out) shift register accepts
    data serially through the input.

  - The data shifts through the register one bit at a time
    on each active clock edge.

  - The stored data is available simultaneously at the
    parallel outputs.

  - The SIPO shift register is implemented using behavioral
    modeling with an if-else statement inside a
    non-blocking always block.

  - Non-blocking assignments are used to model the
    simultaneous update of the register bits at the
    active clock edge.
     in-->out3--->out2-->out1-->out0
  ============================================================
*/
  always @ (posedge clk)  
    if (rst)  
      out <= 0;
    else begin   
       out[3] <=  in    ;
       out[2] <=  out[3];
       out[1] <=  out[2];
       out[0] <=  out[1];
     end 
  
endmodule
