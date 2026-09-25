// Code your testbench here
// or browse Examples
module sim_regions_tb;
  reg   [2:0] a, b;
  wire  [2:0] c, d;
  
  
 /*Continuous assignments:
   Whenever 'a' or 'b' changes, the corresponding continuous 
   assignment is triggered and the output is updated.
   The update is scheduled as an Active-region event.*/
  assign c = a;
  assign d = b;
  
  /*
  Simulation Regions in Verilog
  -----------------------------
  Verilog simulation is divided into different scheduling regions.
  The order in which statements are executed within the same simulation
  time determines the observed result.

  1. Active Region:
     - Initial blocks, always blocks, continuous assignments, and
       $display statements are executed in the Active region.
     - Blocking assignments are also updated in the Active region.
     - Multiple Active-region events at the same simulation time can
       execute in an indeterminate order, which can lead to race conditions.

  2. Inactive Region:
     - The Inactive region is considered part of the Active region.
     - Statements using #0 are scheduled in the Inactive region and are
       executed at the end of the Active region at the same simulation time.
     - Example: #0 $display(...)

  3. Non-Blocking Assignment (NBA) Region:
     - The update of a non-blocking assignment (<=) is scheduled in the
       NBA region.
     - This allows the right-hand side to be evaluated first, while the
       actual update is performed later in the NBA region.

  4. Monitor Region:
     - $monitor displays the values when any of its arguments change.
     - It is used to continuously observe signal changes during simulation.

  These examples help understand how Verilog schedules and executes
  different statements at the same simulation time.
*/
  
 /*
  Code 1:
  - 'b' is updated in the Inactive region because of #0.
  - The change in 'b' triggers the continuous assignment 'd = b',
    which is scheduled as an Active-region event.
  - The $display statement is also in the Active region.
  - Therefore, the Active-region events caused by the change in 'b'
    are processed before the $display executes.
*/
  
  initial begin  // code1 
    $dumpvars(0,sim_regions_tb);
    $display($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    a = 3; #0 b = 5; 
    $display($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    a = 2; #0 b = 6;
    $display($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    a = 4; #0 b = 5; 
    $display($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
    $monitor($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
  end

  /*
  Code 2:
  - 'b' is updated in the Inactive region because of #0.
  - The change in 'b' triggers the continuous assignment 'd = b',
    which is scheduled as an Active-region event.
  - The #0 before $display moves the $display statement to the
    Inactive region.
  - Therefore, the Active-region update of 'd' occurs before the
    $display in the Inactive region.
*/
  
//   initial begin //code2
//     $dumpvars(0,sim_regions_tb);
//     a = 3; #0 b = 5; 
//     #0 $display($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
//     a = 2; #0 b = 6;
//     #0 $display($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
//     a = 4; #0 b = 5; 
//     #0 $display($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
//     $monitor($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
//   end
  
  
// Code 3: $display executes in the Active region and displays the current values at that point in simulation.

//   initial begin //code3
//     $dumpvars(0,sim_regions_tb);
//     a = 3; #0 b = 5; 
//     $display($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
//   end
  
  
// Code 4: $monitor continuously observes signal changes and reports the updated values after the corresponding changes occur.
  
//   initial begin //code4
//     $dumpvars(0,sim_regions_tb);
//     a = 3; #0 b = 5;
//     $monitor($time,"a=%0d,b=%0d,c=%0d,d=%0d",a,b,c,d);
//   end

endmodule
   
