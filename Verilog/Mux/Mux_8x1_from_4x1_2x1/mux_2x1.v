// Code your design here

module mux_2x1(input  [1:0] in ,
               input        sel,
               output       out);
   
// data flow modelling (ternary opertor)
  assign out = sel ? in[1] : in[0];
                                
endmodule
