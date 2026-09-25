// Code your design here

module mux_8x1(input  [7:0] in ,
               input  [2:0] sel,
               output    out);
  
  /*
  ============================================================
                         MULTIPLEXER (MUX)
  ============================================================

  A MUX is a combinational circuit that selects one input from
  multiple inputs and sends the selected input to a single output.
  The selection is controlled by select lines.

  Real-Life Analogies:

  1. TV Input Selection:
     A TV can have multiple input sources such as HDMI 1, HDMI 2,
     USB, and AV. The input selector chooses one source and sends
     it to the TV screen.

  2. Car Audio Source Selection:
     A car audio system can have multiple sources such as FM,
     Bluetooth, USB, and AUX. The source selector chooses one
     source and sends it to the speakers.

  3. Data Source Selection:
     A system may have multiple data sources, such as different
     sensors or modules. A MUX selects one data source and sends
     its data to a common processing unit.

  ============================================================
*/
  
//1.Dataflow (indexing)
  assign out = in[sel];
  
  
  
// //2.data flow modelling (boolean expression using truth table)
//   assign out =  ~sel[2] & ~sel[1] & ~sel[0] & in[0] | ~sel[2] & ~sel[1] &  sel[0] & in[1] |
//                 ~sel[2] &  sel[1] & ~sel[0] & in[2] | ~sel[2] &  sel[1] &  sel[0] & in[3] |
//                  sel[2] & ~sel[1] & ~sel[0] & in[4] |  sel[2] & ~sel[1] &  sel[0] & in[5] |
//                  sel[2] &  sel[1] & ~sel[0] & in[6] |  sel[2] &  sel[1] &  sel[0] & in[7] ;
  
  
  
// //3.data flow modelling (ternary opertor)
//   assign out = sel[2] ? (sel[1] ? (sel[0] ? in[7] : in[6]) 
//                                 : (sel[0] ? in[5] : in[4])) 
//                       : (sel[1] ? (sel[0] ? in[3] : in[2]) 
//                                 : (sel[0] ? in[1] : in[0]));
  
  
    
// //4.gate level modelling
  
//   wire [7:0] x;
  
//   and a1(x[0],~sel[2],~sel[1],~sel[0],in[0]);
//   and a2(x[1],~sel[2],~sel[1], sel[0],in[1]);
//   and a3(x[2],~sel[2], sel[1],~sel[0],in[2]);
//   and a4(x[3],~sel[2], sel[1], sel[0],in[3]);
//   and a5(x[4], sel[2],~sel[1],~sel[0],in[4]);
//   and a6(x[5], sel[2],~sel[1], sel[0],in[5]);
//   and a7(x[6], sel[2], sel[1],~sel[0],in[6]);
//   and a8(x[7], sel[2], sel[1], sel[0],in[7]);
//   or  o1(out,x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7]);
  
  
// //5.Behavioral modeling (case statement)
//   always@(*) begin 
//     case (sel)  
//       3'b000: out = in[0];
//       3'b001: out = in[1];
//       3'b010: out = in[2];
//       3'b011: out = in[3];
//       3'b100: out = in[4];
//       3'b101: out = in[5];
//       3'b110: out = in[6];
//       3'b111: out = in[7]; 
//     endcase
//   end
  
  
  
// // 6. Behavioral modeling (if-else ladder)
//   always@(*)  begin 
//     if(sel == 7) 
//       out = in[7];
//     else if(sel == 6) 
//       out = in[6];
//     else if(sel == 5) 
//       out = in[5];
//     else if(sel == 4) 
//       out = in[4];
//     else if(sel == 3) 
//       out = in[3];
//     else if(sel == 2) 
//       out = in[2];
//     else if(sel == 1) 
//       out = in[1];
//     else
//       out = in[0];
//   end
                    

                  
endmodule
