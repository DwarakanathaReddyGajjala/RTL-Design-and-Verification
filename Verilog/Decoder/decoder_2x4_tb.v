// Code your testbench here
// or browse Examples
module decoder_2x4_tb;
  
  reg  [1:0] in ;
  reg        en ;
  reg  [3:0] out;

  decoder_2x4 inst (.in   ( in  ),
                    .en   ( en  ),
                    .out  ( out ));
  
  initial begin 
       in = 2'b00; en = 1; 
    #1 in = 2'b01; en = 1; 
    #1 in = 2'b10; en = 1; 
    #1 in = 2'b11; en = 1; 
	#1 in = 2'b00; en = 0; 
    #1 in = 2'b01; en = 0; 
    #1 in = 2'b10; en = 0; 
    #1 in = 2'b11; en = 0; 
  end
  
  initial
    $monitor($time,"in=%b,en=%b,out=%b",in,en,out);
  
endmodule   
