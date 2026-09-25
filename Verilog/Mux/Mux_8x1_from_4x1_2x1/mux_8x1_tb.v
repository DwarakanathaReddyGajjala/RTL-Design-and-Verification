// Code your testbench here
// or browse Examples
module mux_8x1_tb;
  
  reg [7:0] in ;
  reg [2:0] sel; 
  wire      out;
  
  mux_8x1 inst (.in  (in ) ,
                .sel (sel) ,
                .out (out));
  initial begin 
       $monitor($time,"in=%b,sel=%b,out=%b",in,sel,out);
       in = 8'b1001_0100; sel = 3'b000;
    #5 in = 8'b1001_0101; sel = 3'b000;
    #5 in = 8'b1001_1101; sel = 3'b001;
    #5 in = 8'b1001_1111; sel = 3'b001;
    #5 in = 8'b0011_1010; sel = 3'b010;
    #5 in = 8'b0011_1110; sel = 3'b010;
    #5 in = 8'b1010_0111; sel = 3'b011;
    #5 in = 8'b1010_1111; sel = 3'b011;
    #5 in = 8'b1110_0000; sel = 3'b100;
    #5 in = 8'b1111_0000; sel = 3'b100;
    #5 in = 8'b1000_1100; sel = 3'b101;
    #5 in = 8'b1010_1100; sel = 3'b101;
    #5 in = 8'b1000_0111; sel = 3'b110;
    #5 in = 8'b1100_0111; sel = 3'b110;
    #5 in = 8'b0010_1111; sel = 3'b111;
    #5 in = 8'b1010_1111; sel = 3'b111;
  end
  
endmodule
