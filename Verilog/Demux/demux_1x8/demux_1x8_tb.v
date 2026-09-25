// Code your testbench here
// or browse Examples
module demux_1x8_tb;
  
  reg        in ;
  reg  [2:0] sel;
  wire [7:0] out;
  
  demux_1x8 inst (.in  (in ),
                  .sel (sel),
                  .out (out));
  initial begin 
       $monitor($time,"in=%b,sel=%b,out=%b",in,sel,out);
       in = 0; sel = 3'b000;
    #1 in = 1; sel = 3'b001;
    #1 in = 0; sel = 3'b010;
    #1 in = 0; sel = 3'b011;
    #1 in = 1; sel = 3'b100;
    #1 in = 0; sel = 3'b101;
    #1 in = 0; sel = 3'b110;
    #1 in = 0; sel = 3'b111; 
    #2 in = 1; sel = 3'b000;
    #1 in = 1; sel = 3'b001;
    #1 in = 1; sel = 3'b010;
    #1 in = 1; sel = 3'b011;
    #1 in = 1; sel = 3'b100;
    #1 in = 1; sel = 3'b101;
    #1 in = 1; sel = 3'b110;
    #1 in = 1; sel = 3'b111; 
  end
endmodule   
