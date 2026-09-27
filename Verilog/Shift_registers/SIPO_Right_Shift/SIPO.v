// Code your design here 

module SIPO(input              serial_in,clk, rst,
            output  reg [3:0]  parallel_out      );
  /*
  ============================================================
              4-BIT SIPO RIGHT-SHIFT REGISTER
  ============================================================

  - A 4-bit SIPO right-shift register accepts serial data
    through the input and shifts the data one bit toward the
    right on each active clock edge.

  - The shifted data is available simultaneously at the
    parallel outputs.

  - Data flow:

        in → q3 → q2 → q1 → q0

  - The register is implemented using behavioral modeling.

  ============================================================
*/
  
  always @(posedge clk) 
    if(rst) 
      parallel_out <= 4'b0000;
    else 
      parallel_out <= {serial_in,parallel_out[3:1]};
  
endmodule
