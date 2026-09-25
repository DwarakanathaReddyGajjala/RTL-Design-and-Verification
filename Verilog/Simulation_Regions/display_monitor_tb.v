// Code your testbench here
// or browse Examples
module display_monitor_tb;
  
  reg [3:0] a, b;
  
 /*  
     ============================================================
     System Tasks for Display and Monitoring
     ============================================================

  - $display:
    Executes in the Active region and displays the values when the
    statement is executed. Each $display prints the output on a new line.

  - $write:
    Executes in the Active region and displays the values when the
    statement is executed. Unlike $display, $write does not move to
    a new line.

  - $monitor:
    Executes in the Monitor region and continuously monitors the
    specified variables. It prints the values whenever any of the
    monitored variables changes.

  - $strobe:
    Executes in the Monitor region. Similar to $monitor, it displays
    the values at the end of the current simulation time step.
    However, $strobe executes only once for that statement.
  */
  
  
  
//   initial begin //code1a....display 
//     a = 3; b = 5;
//     $display($time,"display",a,b);
//     #10 a = 7; b = 15;      
//     $display($time,"display",a,b);
//     #10 a = 9; b = 13;      
//     $display($time,"display",a,b);
//   end 
  
  
//   initial begin //code1b....write
//     a = 3; b = 5;
//     $write($time,"write",a,b);
//     #10 a = 7; b = 15;      
//     $write($time,"write",a,b);
//     #10 a = 9; b = 13;      
//     $write($time,"write",a,b);
//   end
  
//   initial begin //code1c....display vs write
//     a = 3; b = 5;
//     $display($time,"display",a,b);
//     $write($time,"write",a,b);
//     #10 a = 7; b = 15;      
//     $display($time,"display",a,b);
//     $write($time,"write",a,b);
//     #10 a = 9; b = 13;      
//     $display($time,"display",a,b);
//     $write($time,"write",a,b);
//   end
  
  
  
//   initial begin //code2a....monitor 
//     $monitor($time,"monitor",a,b);
//     a = 3; b = 5;
//     #10 a = 7; b = 15;      
//     #10 a = 9; b = 13;      
//   end 
  
//    initial begin //code2b....monitor 
//     $monitor($time,"monitor",a,b);
//     a = 3; b = 5;
//     a = 7; b = 15;      
//     a = 9; b = 13;      
//   end 
  
  
//   initial begin //code2c....monitor 
//     a = 3; b = 5;
//     $monitor($time,"monitor",a,b);
//     #10 a = 7; b = 15;      
//     #10 a = 9; b = 13;      
//   end 
  
//   initial begin //code2d....monitor 
//     a = 3; b = 5;
//     #10 a = 7; b = 15;      
//     $monitor($time,"monitor",a,b);
//     #10 a = 9; b = 13;      
//   end 
  
//   initial begin //code2e....monitor 
//     a = 3; b = 5;
//     #10 a = 7; b = 15;      
//     #10 a = 9; b = 13;      
//     $monitor($time,"monitor",a,b);
//   end 
  
  
//   initial begin //code3a....strobe 
//     $strobe($time,"strobe",a,b);
//     a = 3; b = 5;
//     a = 7; b = 15;      
//     a = 9; b = 13;      
//   end 
  
//   initial begin //code3b....strobe 
//     $strobe($time,"strobe",a,b);
//     a = 3; b = 5;
//     #10 a = 7; b = 15;      
//     #10 a = 9; b = 13;      
//   end 
  
//   initial begin //code3c....strobe
//     a = 3; b = 5;
//     $strobe($time,"strobe",a,b);
//     #10 a = 7; b = 15;      
//     #10 a = 9; b = 13;      
//   end 
  
//   initial begin //code3d....strobe 
//     a = 3; b = 5;
//     #10 a = 7; b = 15;      
//     $strobe($time,"strobe",a,b);
//     #10 a = 9; b = 13;      
//   end 
  
//   initial begin //code3e....strobe 
//     a = 3; b = 5;
//     #10 a = 7; b = 15;      
//     #10 a = 9; b = 13;      
//     $strobe($time,"strobe",a,b);
//   end 
  
//   initial begin //code3f....strobe 
//     a = 3; b = 5;
//     $strobe($time,"strobe",a,b);
//     #10 a = 7; b = 15;      
//     $strobe($time,"strobe",a,b);
//     #10 a = 9; b = 13;      
//     $strobe($time,"strobe",a,b);
//   end 
  
  
  initial begin //code3f....strobe 
    $monitor($time,"monitor",a,b);
    a = 3; b = 5;
    $strobe($time,"strobe",a,b);
    #10 a = 7; b = 15;      
    $strobe($time,"strobe",a,b);
    #10 a = 9; b = 13;      
    $strobe($time,"strobe",a,b);
  end 
 
endmodule
