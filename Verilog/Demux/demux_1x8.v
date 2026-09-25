// Code your design here
module demux_1x8 (input        in ,
                  input  [2:0] sel,
                  output [7:0] out);
  
// // 1.dataflow modelling(boolean expression using truth table)..contioues assignment
//   assign out[0] = ~sel[2] & ~sel[1] & ~sel[0] & in;
//   assign out[1] = ~sel[2] & ~sel[1] &  sel[0] & in;
//   assign out[2] = ~sel[2] &  sel[1] & ~sel[0] & in;
//   assign out[3] = ~sel[2] &  sel[1] &  sel[0] & in;
//   assign out[4] =  sel[2] & ~sel[1] & ~sel[0] & in;
//   assign out[5] =  sel[2] & ~sel[1] &  sel[0] & in;
//   assign out[6] =  sel[2] &  sel[1] & ~sel[0] & in;
//   assign out[7] =  sel[2] &  sel[1] &  sel[0] & in;
  
  
////2.gate level modelling  
//   and a1(out[0],~sel[2],~sel[1],~sel[0],in);
//   and a2(out[1],~sel[2],~sel[1], sel[0],in);
//   and a3(out[2],~sel[2], sel[1],~sel[0],in);
//   and a4(out[3],~sel[2], sel[1], sel[0],in);
//   and a5(out[4], sel[2],~sel[1],~sel[0],in);
//   and a6(out[5], sel[2],~sel[1], sel[0],in);
//   and a7(out[6], sel[2], sel[1],~sel[0],in);
//   and a8(out[7], sel[2], sel[1], sel[0],in);
  

////3a.Behavioral modeling using procedural assignment with an if-else ladder
//   always @ (*) begin 
//     if(sel == 3'b000) begin 
//       out[0] = in;
//       out[1] = 0;
//       out[2] = 0;
//       out[3] = 0;
//       out[4] = 0;
//       out[5] = 0;
//       out[6] = 0;
//       out[7] = 0;
//     end 
//     else if(sel == 3'b001) begin 
//       out[0] = 0;
//       out[1] = in;
//       out[2] = 0;
//       out[3] = 0;
//       out[4] = 0;
//       out[5] = 0;
//       out[6] = 0;
//       out[7] = 0;
//     end 
//     else if(sel == 3'b010) begin 
//       out[0] = 0;
//       out[1] = 0;
//       out[2] = in;
//       out[3] = 0;
//       out[4] = 0;
//       out[5] = 0;
//       out[6] = 0;
//       out[7] = 0;
//     end 
//     else if(sel == 3'b011) begin 
//       out[0] = 0;
//       out[1] = 0;
//       out[2] = 0;
//       out[3] = in;
//       out[4] = 0;
//       out[5] = 0;
//       out[6] = 0;
//       out[7] = 0;
//     end 
//     else if(sel == 3'b100) begin 
//       out[0] = 0;
//       out[1] = 0;
//       out[2] = 0;
//       out[3] = 0;
//       out[4] = in;
//       out[5] = 0;
//       out[6] = 0;
//       out[7] = 0;
//     end 
//     else if(sel == 3'b101) begin 
//       out[0] = 0;
//       out[1] = 0;
//       out[2] = 0;
//       out[3] = 0;
//       out[4] = 0;
//       out[5] = in;
//       out[6] = 0;
//       out[7] = 0;
//     end 
//     else if(sel == 3'b110) begin 
//       out[0] = 0;
//       out[1] = 0;
//       out[2] = 0;
//       out[3] = 0;
//       out[4] = 0;
//       out[5] = 0;
//       out[6] = in;
//       out[7] = 0;
//     end 
//     else begin 
//       out[0] = 0;
//       out[1] = 0;
//       out[2] = 0;
//       out[3] = 0;
//       out[4] = 0;
//       out[5] = 0;
//       out[6] = 0;
//       out[7] = in;
//     end
//   end 

  
////3b.Behavioral modeling using procedural assignment with an if-else ladder
//   always @ (*) begin 
//     if(sel == 3'b000) begin 
//       out      = 0 ;
//       out[0]   = in;
//     end 
//     else if(sel == 3'b001) begin 
//       out      = 0 ;
//       out[1]   = in;
//     end 
//     else if(sel == 3'b010) begin 
//       out      = 0 ;
//       out[2]   = in;
//     end 
//     else if(sel == 3'b011) begin 
//       out      = 0 ;	
//       out[3]   = in;
//     end 
//     else if(sel == 3'b100) begin 
//       out      = 0 ;
//       out[4]   = in;
//     end 
//     else if(sel == 3'b101) begin 
//       out      = 0 ;
//       out[5] = in;
//     end 
//     else if(sel == 3'b110) begin 
//       out      = 0 ;
//       out[6] = in;
//     end 
//     else begin 
//       out      = 0 ;
//       out[7] = in;
//     end
//   end 

  
////3c.Behavioral modeling using procedural assignment with an if-else ladder
//   always @ (*) begin 
//     if(sel == 3'b000) begin 
//       out      = 0 ;
//       out[sel] = in;
//     end 
//     else if(sel == 3'b001) begin 
//       out      = 0 ;
//       out[sel] = in;
//     end 
//     else if(sel == 3'b010) begin 
//       out      = 0 ;
//       out[sel] = in;
//     end 
//     else if(sel == 3'b011) begin 
//       out      = 0 ;	
//       out[sel] = in;
//     end 
//     else if(sel == 3'b100) begin 
//       out      = 0 ;
//       out[sel] = in;
//     end 
//     else if(sel == 3'b101) begin 
//       out      = 0 ;
//       out[sel] = in;
//     end 
//     else if(sel == 3'b110) begin 
//       out      = 0 ;
//       out[sel] = in;
//     end 
//     else begin 
//       out      = 0 ;
//       out[sel] = in;
//     end
//   end 
  
   
////4A.Behavioral modeling using procedural assignment with a case statements
//   always @ (*) begin 
//     case(sel)
//       3'b000: begin out    = 0 ;
//                     out[0] = in;
//               end
//       3'b001: begin out    = 0 ;
//                     out[1] = in;
//               end
//       3'b010: begin out    = 0 ;
//                     out[2] = in;
//               end
//       3'b011: begin out    = 0 ;
//                     out[3] = in;
//               end
//       3'b100: begin out    = 0 ;
//                     out[4] = in;
//               end
//       3'b101: begin out    = 0 ;
//                     out[5] = in;
//               end
//       3'b110: begin out    = 0 ;
//                     out[6] = in;
//               end
//       3'b111: begin out    = 0 ;
//                     out[7] = in;
//               end
//     endcase
//   end
  
////4B.Behavioral modeling using procedural assignment with a case statements
//   always @ (*) begin 
//     case(sel)
//       3'b000: begin out      = 0 ;
//                     out[sel] = in;
//               end
//       3'b001: begin out    = 0 ;
//                     out[sel] = in;
//               end
//       3'b010: begin out    = 0 ;
//                     out[sel] = in;
//               end
//       3'b011: begin out    = 0 ;
//                     out[sel] = in;
//               end
//       3'b100: begin out    = 0 ;
//                     out[sel] = in;
//               end
//       3'b101: begin out    = 0 ;
//                     out[sel] = in;
//               end
//       3'b110: begin out    = 0 ;
//                     out[sel] = in;
//               end
//       3'b111: begin out    = 0 ;
//                     out[sel] = in;
//               end
//     endcase
//   end
  

////5.Behavioral modeling using procedural assignment with index-based selection
//   always @ (*) begin 
//     out      = 0;
//     out[sel] = in;
//   end
 
  
//6.Dataflow modeling using continuous assignment with index-based selection 
  assign out[sel] = in;//error

endmodule
