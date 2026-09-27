// Code your design here 
`include "d_flipflop.v"
`include "mux2x1.v"

module PISO(input  [3:0] parallel_in  , 
            input        clk, rst, load,
            output       serial_out    );
  
  wire  d1,d2,d3,d4   ;
  wire  m0,m1,m2,m3;
  
  /*
  ============================================================
            4-BIT PISO SHIFT REGISTER — USING D FLIP-FLOPS
                         AND MUXES
  ============================================================

  - A 4-bit PISO shift register can be designed using four
    D flip-flops and four 2:1 MUXes.

  - The MUXes select between parallel input data and the
    shifted data based on the control signal.

  - In parallel-load mode, the parallel input data is loaded
    into the D flip-flops simultaneously.

  - In shift mode, the stored data shifts one bit at a time
    toward the serial output.

  - Therefore:

        Parallel In → MUXes → DFFs → Serial Out

  ============================================================
*/
  
  
  reg serial;
  
   mux_2x1 m_inst0 
  (
    .sel  ( load            ),
    .in0  ( 1'b0            ),
    .in1  ( parallel_in[3]  ),
    .out  ( m0              )
  );
  
  d_ff d_inst1 
  (
    .clk  ( clk             ),
    .rst  ( rst             ),
    .din  ( m0              ),
    .qout ( d3              )
  );
  
  mux_2x1 m_inst1 
  (
    .sel  ( load            ),
    .in0  ( d3              ),
    .in1  ( parallel_in[2]  ),
    .out  ( m1              )
  );
  

 d_ff d_inst2
  (
    .clk  ( clk             ),
    .rst  ( rst             ),
    .din  ( m1              ),
    .qout ( d2              )
  );
  
  mux_2x1  m_inst2
  (
    .sel  ( load            ),
    .in0  ( d2              ),
    .in1  ( parallel_in[1]  ),
    .out  ( m2              )
  );
  
   d_ff d_inst3 
  (
    .clk  ( clk             ),
    .rst  ( rst             ),
    .din  ( m2              ),
    .qout ( d1              )
  );
  
  mux_2x1 m_inst3 
  (
    .sel  ( load            ),
    .in0  ( d1              ),
    .in1  ( parallel_in[3]  ),
    .out  ( m3              )
  );
   
   d_ff d_inst4 
  (
    .clk  ( clk             ),
    .rst  ( rst             ),
    .din  ( m3              ),
    .qout ( d0              )
  );
  
  
  
  always@(posedge clk)  
    if(load || rst)  
      serial <= 1'b0;
    else
      serial <= d0;
  
  assign serial_out = serial;


endmodule
