// Code your design here
module SISO(input       serial_in,clk, rst,
            output reg  serial_out        );
  
  reg [3:0] siso_shift_reg;
  
  /*
  ============================================================
                  4-BIT SISO SHIFT REGISTER
  ============================================================

  - A 4-bit SISO shift register shifts serial data through
    the register one bit at a time on each active clock edge.

  - The LSB of the register is used as the serial output.

  - The register is implemented using behavioral modeling.

  ============================================================
*/
  
  always @ (posedge clk)  
    if (rst)   
      siso_shift_reg <= 0;
    else     
      siso_shift_reg <= {serial_in,siso_shift_reg[3:1]};
  
  assign serial_out = siso_shift_reg[0];
 
endmodule
