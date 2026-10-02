/*
  ============================================================
                    EVENT CONTROL
  ============================================================

  - Event control is used to wait for a change or a specific
    event on a signal.

  - @(clk) is triggered whenever clk changes value.

  - @(posedge clk) is triggered only when clk changes from 0
    to 1.

  - Therefore:

        @(clk)
            → Both 0 → 1 and 1 → 0 transitions

        @(posedge clk)
            → Only 0 → 1 transition


  ============================================================
                    #0 WITH EVENT CONTROL
  ============================================================

  - #0 delays a statement without advancing simulation time.

  - Example:

        initial #0 clk = 1;

  - The assignment still occurs at time 0, but it is moved to
    a later scheduling region.

  - This allows another process to reach @(clk) before clk
    changes.

  - Therefore, the first @(clk) can detect the change at
    time 0.

  - Without #0:

        initial clk = 1;

    the clk assignment can occur before the other process
    reaches @(clk).

  - Therefore, the first @(clk) waits for the next clock
    transition at 5 ns.


  ============================================================
                    @(clk) vs @(posedge clk)
  ============================================================

        @(clk)
            → Triggered on every change of clk.

        @(posedge clk)
            → Triggered only on the rising edge of clk.


  ============================================================
                    IMPORTANT DIFFERENCE
  ============================================================

        With #0:
            → First @(clk) can execute at t = 0.

        Without #0:
            → First @(clk) waits for the next clk change,
              which occurs at t = 5 ns.

  ============================================================
*/



// module event_control_tb;//code1a
//   reg  [1:0]  a ;
//   reg        clk;
//   wire [1:0]   y;
  
//   design1 inst(a,clk,y);
   
//   always #5 clk = ~clk;

//   initial #0 clk =1;
  
//   initial begin 
//     @( clk) a = 2'b00;
//     @( clk) a = 2'b01;
//     @( clk) a = 2'b10;
//     @( clk) a = 2'b11;
//   end
    
//   initial begin 
//     $monitor("[%0t]a=%0d,y=%0d",$time,a,y);
//     #100 $finish;
//   end 
  
//   initial begin
//     $dumpfile("waveform.vcd"); // Specifies the output file name
//     $dumpvars(0, tb);   // Dumps all variables in and under 'testbench' (level 0)
// end
// endmodule 



// module event_control_tb1;//code1b
//   reg  [1:0]  a ;
//   reg        clk;
//   wire [1:0]   y;
  
//   design1 inst(a,clk,y);
   
//   always #5 clk = ~clk;
  
//   initial  clk =1; 
  
//   initial begin 
//     @( clk) a = 2'b00;
//     @( clk) a = 2'b01;
//     @( clk) a = 2'b10;
//     @( clk) a = 2'b11;
//   end
 
//   initial begin 
//     $monitor("[%0t]a=%0d,y=%0d",$time,a,y);
//     #100 $finish;
//   end 
    
//   initial begin
//     $dumpfile("waveform.vcd"); // Specifies the output file name
//     $dumpvars(0, tb);   // Dumps all variables in and under 'testbench' (level 0)
// end
// endmodule 



// module event_control_tb2;//code1c
//   reg  [1:0]  a ;
//   reg        clk;
//   wire [1:0]   y;
  
//   design1 inst(a,clk,y);
   
//   always #5 clk = ~clk;

//   initial #0 clk =1;
  
//   initial begin 
//     @(posedge clk) a = 2'b00;
//     @(posedge clk) a = 2'b01;
//     @(posedge clk) a = 2'b10;
//     @(posedge clk) a = 2'b11;
//   end
    
//   initial begin 
//     $monitor("[%0t]a=%0d,y=%0d",$time,a,y);
//     #100 $finish;
//   end 
  
//   initial begin
//     $dumpfile("waveform.vcd"); // Specifies the output file name
//     $dumpvars(0, tb);   // Dumps all variables in and under 'testbench' (level 0)
// end
// endmodule 


module event_control_tb3;//code1d
  reg  [1:0]  a ;
  reg        clk;
  wire [1:0]   y;
  
  design1 inst(a,clk,y);
   
  always #5 clk = ~clk;

  initial clk =1;
  
  initial begin 
    @(posedge clk) a = 2'b00;
    @(posedge clk) a = 2'b01;
    @(posedge clk) a = 2'b10;
    @(posedge clk) a = 2'b11;
  end
    
  initial begin 
    $monitor("[%0t]a=%0d,y=%0d",$time,a,y);
    #100 $finish;
  end 
  
  initial begin
    $dumpfile("waveform.vcd"); // Specifies the output file name
    $dumpvars(0, tb);   // Dumps all variables in and under 'testbench' (level 0)
end
endmodule 
