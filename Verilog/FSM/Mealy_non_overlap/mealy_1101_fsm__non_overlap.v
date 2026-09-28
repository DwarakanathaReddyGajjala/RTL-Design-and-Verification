// Code your design here
module mealy_1101_fsm__non_overlap(input in, clk, rst,
                      output reg out);
  
  parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
  
  reg [1:0] current_state;
  
  /*
  ============================================================
              MEALY 1101 FSM — NON-OVERLAPPING
  ============================================================

  - A Mealy FSM is a finite state machine in which the output
    depends on both the current state and the input.

  - This FSM detects the sequence 1101 in the serial input
    stream.

  - The output becomes HIGH when the complete 1101 sequence
    is detected.

  - Since it is a non-overlapping sequence detector, the
    detected sequence is not reused as part of the next
    sequence.

  - The FSM is implemented using states to track the progress
    of the input sequence.

  - Therefore:

        Current State + Input → Next State + Output

  ============================================================
*/
  
  always @(posedge clk) begin 
    if(rst) begin  
      out           <= 0;
      current_state <= 0;
    end 
    else begin 
      case (current_state) 
       s0: begin 
             if(in) begin 
               out           <= 0;
               current_state <= s1;
             end 
             else begin 
               out           <= 0;
               current_state <= s0;
             end 
           end 
        
       s1: begin 
             if(in) begin 
               out           <= 0;
               current_state <= s2;
             end 
             else begin 
               out           <= 0;
               current_state <= s0;
             end 
           end 
        
       s2: begin 
             if(~in) begin 
               out           <= 0;
               current_state <= s3;
             end 
             else begin 
               out           <= 0;
               current_state <= s2;
             end 
           end 
        
       s3: begin 
             if(in) begin 
               out           <= 1;
               current_state <= s0;
             end 
             else begin 
               out           <= 0;
               current_state <= s0;
             end 
           end 
      endcase
    end 
  end 
endmodule 

 
        
      
  
  
