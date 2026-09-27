// Code your design here
module SISO(input       in,clk, rst,
            output reg  out  );
  
  reg w1,w2,w3;
  
  /*
  ============================================================
                  SISO SHIFT REGISTER
  ============================================================

  - A SISO shift register accepts data serially through the
    input and shifts the data one stage at a time on every
    active clock edge.

  - The data passes through each register stage before
    appearing at the serial output.

  - With non-blocking assignments, all register stages are
    updated simultaneously, which matches the intended
    hardware behavior of a SISO shift register.

  - With blocking assignments in the same sequential block,
    the updated value propagates immediately through the
    stages during the same clock event.

  - Therefore, the order of statements can affect whether
    the RTL behavior matches the intended SISO hardware.
    
    
  - For sequential logic, non-blocking assignments are preferred
    because they model the simultaneous operation of flip-flops
    at a clock edge.

  - Therefore, non-blocking assignments should be used to describe
    clocked sequential hardware such as shift registers.

  ============================================================ */
  
  
  /* =================================================================
     1. Non-Blocking Assignment
     =================================================================

   - Non-blocking assignments represent the intended SISO behavior.

   - All stages receive their new values at the same clock
     edge.

        w1  <= in;
        w2  <= w1;
        w3  <= w2;
        out <= w3;

   - Each stage receives the previous value of the stage before it.

   - Therefore, the data shifts by one stage on each clock edge.

   =====================================================================
*/

  
   always @ (posedge clk)  
    if (rst) begin  
      w1  <= 0;
      w2  <= 0;
      w3  <= 0;
      out <= 0;
    end 
    else begin   
      w1  <=  in;
      w2  <=  w1;
      w3  <=  w2;
      out <=  w3;
    end 
  
  
  
  /* ============================================================
   2. Blocking Assignment — Incorrect Ordering
   ============================================================

   - Blocking assignments update the registers immediately.

   - If the statements are written as:

        w1  = in;
        w2  = w1;
        w3  = w2;
        out = w3;

   - The new input value propagates through all stages during
   the same clock event.

   - Therefore, the data does not shift one stage per clock
     cycle as required by the SISO functionality.

   - The RTL behavior does not match the intended SISO
     functionality.

   ============================================================
*/


//   always @ (posedge clk)  
//     if (rst) begin  
//       w1  <= 0;
//       w2  <= 0;
//       w3  <= 0;
//       out <= 0;
//     end 
//     else begin         
//       w1  =  in;
//       w2  =  w1;
//       w3  =  w2;
//       out =  w3;
//     end 
  
  
  
  
  /* ============================================================
   3. Blocking Assignment — Correct Ordering
   ============================================================

   - Blocking assignments execute sequentially within the
     procedural block.

   - The statements are written in reverse order so that the
     previous values propagate correctly:

        out = w3;
        w3  = w2;
        w2  = w1;
        w1  = in;

   - With this ordering, the behavior can match the intended
     SISO shift operation.

   ============================================================
*/
  
  
//    always @ (posedge clk)  
//     if (rst) begin  
//       w1  <= 0;
//       w2  <= 0;
//       w3  <= 0;
//       out <= 0;
//     end 
//     else begin
//       out =  w3;
//       w3  =  w2;
//       w2  =  w1;
//       w1  =  in;
//     end 
  
endmodule
      
      
     

 
