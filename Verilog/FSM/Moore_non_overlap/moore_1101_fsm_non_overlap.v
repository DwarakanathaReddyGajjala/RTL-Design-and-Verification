// Code your design here
module moore_1101_fsm_non_overlap(input in, clk, rst,
                                  output reg out);

  /*
  ============================================================
              MOORE 1101 FSM — NON-OVERLAPPING
  ============================================================

  - A Moore FSM is a finite state machine in which the output
    depends only on the current state.

  - This FSM detects the sequence 1101 in the serial input
    stream.

  - The output becomes HIGH when the FSM reaches the state
    representing the complete 1101 sequence.

  - Since it is a non-overlapping sequence detector, the
    detected sequence is not reused as part of the next
    sequence.

  - The FSM is implemented using states to track the progress
    of the input sequence.

  - Therefore:

        Current State → Output

        Current State + Input → Next State

  ============================================================
*/

  parameter s0 = 3'b000, s1 = 3'b001, s2 = 3'b010, s3 = 3'b011, s4 = 3'b100;

  reg [2:0] current_state;


  always @(posedge clk) begin 
    if(rst) begin  
      out           <= 0;
      current_state    <= 0;
    end 
    else 
      case (current_state) 
        s0: begin 
          out           <= 0;
          if(in) begin 
            current_state    <= s1;
          end 
          else begin 
            current_state    <= s0;
          end 
        end 

        s1: begin 
          out           <= 0;
          if(in) begin 
            current_state    <= s2;
          end 
          else begin 
            current_state    <= s0;
          end 
        end 

        s2: begin 
          out           <= 0;
          if(~in) begin 
            current_state    <= s3;
          end 
          else begin 
            current_state    <= s2;
          end 
        end 

        s3: begin 
          out           <= 0;
          if(in) begin 
            current_state    <= s4;
          end 
          else begin 
            current_state    <= s0;
          end 
        end 

        s4: begin 
          out           <= 1;
          if(in) begin 
            current_state    <= s1;
          end 
          else begin 
            current_state    <= s0;
          end 
        end 
      endcase 
  end 

endmodule 





