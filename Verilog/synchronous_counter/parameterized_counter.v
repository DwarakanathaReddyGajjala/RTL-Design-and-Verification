// Code your design here
module parameterized_counter #(parameter COUNTER_WIDTH = 3)
              (input            i_clock, i_reset,
               output reg [COUNTER_WIDTH-1:0] o_count         );// parameterized module
  
  /*
  ============================================================
                    PARAMETERIZED COUNTER
  ============================================================

  - A parameterized counter allows the counter width to be
    changed without modifying the internal logic.

  - The counter width is defined using a parameter.

  - For example:

        parameter COUNTER_WIDTH = 3;

        output reg [COUNTER_WIDTH-1:0] o_count;

  - If COUNTER_WIDTH is changed, the width of the counter
    automatically changes accordingly.

  - Therefore, the same counter module can be used for
    different counter widths.

  - A parameter can be declared in the module parameter list
    or inside the module.

        module counter #(parameter COUNTER_WIDTH = 3);

        parameter WIDTH = 5;

  - A parameter is a constant value that can be overridden
    when the module is instantiated.

  - localparam is also a constant, but unlike parameter,
    its value cannot be overridden from outside the module.

  ============================================================
*/
  
  parameter WIDTH = 5;// parameter 
  reg [WIDTH-1] out;
  
  always@(posedge i_clock)  
    if(i_reset)  begin 
      $display($time,"entetd the if block rst=%0d,o_count=%0d,out=%0d",i_reset,o_count,out);

      o_count <= 0;
      out     <= 0;
    end 
    else  begin 
      $display($time,"entetd the else block rst=%0d,o_count=%0d,out=%0d",i_reset,o_count,out);

      o_count <= o_count + 1'b1;
      out     <= out + 1'b1;
    end 

endmodule 
