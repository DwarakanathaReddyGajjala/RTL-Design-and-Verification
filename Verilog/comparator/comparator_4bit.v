// Code your design here
module comparator_4bit(input [3:0] a,b   ,
                       output      equal ,
                       output      greter,
                       output      lesser);
  
/*============================================================
  1. Dataflow Modeling - Using Boolean Expressions
  ============================================================ */
/* assign equal  = ~(a[3] ^ b[3]) & ~(a[2] ^ b[2]) & ~(a[1] ^ b[1]) & ~(a[0] ^ b[0]);    
   assign greter = (a[3] & ~b[3]) | ~(a[3] ^ b[3]) & (a[2] & ~b[2]) | 
                  ~(a[3] ^  b[3]) & ~(a[2] ^ b[2]) & (a[1] & ~b[1]) | 
                  ~(a[3] ^  b[3]) & ~(a[2] ^ b[2]) & ~(a[1] ^ b[1]) & (a[0] &~b[0]);   
   assign lesser = (~a[3] & b[3]) | ~(a[3] ^ b[3]) & (~a[2] & b[2]) | 
                  ~( a[3] ^ b[3]) & ~(a[2] ^ b[2]) & (~a[1] & b[1]) | 
                  ~( a[3] ^ b[3]) & ~(a[2] ^ b[2]) & ~(a[1] ^ b[1]) & (~a[0] & b[0]); */

  
/*============================================================
  2. Dataflow Modeling - Using Ternary Operator
  ============================================================*/
/*  assign equal  = (a==b) ? 1 : 0;
    assign greter = (a>b)  ? 1 : 0;
    assign lesser = (a<b)  ? 1 : 0; */
  
  
/*============================================================
   3. Dataflow Modeling - Using Relational Operators
  ============================================================*/
  
  assign equal  = (a==b);
  assign greter = (a>b) ;
  assign lesser = (a<b) ;

  
endmodule
