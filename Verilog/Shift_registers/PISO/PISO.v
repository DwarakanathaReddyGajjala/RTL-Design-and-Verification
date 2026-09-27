// Code your design here 

module PISO(input  [3:0] parallel_in  , 
            input       clk, rst, load,
            output  reg serial_out    );
  
  /*
  ============================================================
                  4-BIT PISO SHIFT REGISTER
  ============================================================

  - A 4-bit PISO shift register first loads data in parallel
    and then shifts the stored data serially toward the output.

  - The parallel data is loaded simultaneously into the
    register on the active clock edge.

  - After loading, the stored data is shifted one bit at a time
    on each active clock edge.

  - The final output is provided serially.

  - Therefore:

        Parallel In → PIPO → SISO → Serial Out

  ============================================================
*/
  
  reg [3:0] temp_reg;
  
  always @(posedge clk) 
    if(rst) begin 
      temp_reg   <= 4'b0000;
      serial_out <= 0;
    end 
    else if (load)
      temp_reg <= parallel_in ;
    else begin
      temp_reg   <= {1'b0,temp_reg[3:1]};// right shift
      serial_out <= temp_reg[0];
    end 
    
endmodule
