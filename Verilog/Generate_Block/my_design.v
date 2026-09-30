// Code your design here
`include "half_adder.sv"
module my_design #(parameter N = 0)(
  input  [N-1:0] a,b,
  output [N-1:0] c,s);
  
  
  /*
  ============================================================
                    GENERATE BLOCK
  ============================================================

  - A generate block is used to create multiple instances of
    hardware using a single piece of code.

  - The generate-for loop can be used when the same hardware
    structure needs to be repeated multiple times.

  - The genvar variable is used as the loop variable for the
    generate-for loop.

  - The loop is processed during elaboration to create the
    required hardware instances.

  - In this example, N half-adder instances are created.

  - Each half adder operates on one bit of the input vectors.

        a[0], b[0] → Half Adder → c[0], s[0]
        a[1], b[1] → Half Adder → c[1], s[1]
                    ...
        a[N-1], b[N-1] → Half Adder → c[N-1], s[N-1]

  - The named generate block "half_adder_block" provides a
    hierarchical name for the generated instances.

  - Therefore:

        N-bit Inputs + Generate-for → N Half Adders

  ============================================================
*/
  
//   genvar i;
//   generate 
//     for(i = 0; i < N; i=i+1) 
//       half_adder ha (a[i],b[i],c[i],s[i]); 
//   endgenerate 
  
  
  genvar i;
  generate 
    for(i = 0; i < N; i=i+1) begin: half_adder_block
      half_adder ha (a[i],b[i],c[i],s[i]);
    end 
  endgenerate 


endmodule
