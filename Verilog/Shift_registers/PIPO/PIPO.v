// Code your design here
  
module PIPO(input   [3:0]  parallel_in ,
            input          clk, rst    ,
            output  reg [3:0]  parallel_out );
  
  /*
  ================================================================
                  4-BIT PIPO SHIFT REGISTER
  ================================================================

  - A 4-bit PIPO shift register accepts data in parallel through 
    the input and provides the data in parallel at the output.

  - All four input bits are loaded simultaneously on the
    active clock edge.

  - The stored data is available simultaneously at the
    parallel outputs.

  - The register is implemented using behavioral modeling.

  - Data flow: parallel_in[3:0] → PIPO → parallel_out[3:0]

  =================================================================
*/
  
  always @(posedge clk) 
    if(rst) 
      parallel_out <= 4'b0000;
    else 
      parallel_out <= parallel_in;
  
endmodule 
