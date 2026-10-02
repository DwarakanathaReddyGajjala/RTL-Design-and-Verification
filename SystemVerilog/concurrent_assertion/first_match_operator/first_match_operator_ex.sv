/*
  ============================================================
                    FIRST_MATCH() OPERATOR
  ============================================================

  - The first_match() operator is used to select the first
    successful match of a sequence when the sequence can have
    multiple possible matches.

  - It is mainly useful with sequences containing ranged or
    unbounded delays.

  - Syntax:

        first_match(sequence)


  ============================================================
                    FIRST_MATCH() EXAMPLE
  ============================================================

        first_match(a ##[2:4] b) ##1 c;

  - The sequence inside first_match() is:

        a ##[2:4] b

  - This sequence allows b to occur 2, 3, or 4 clocking events
    after a.

  - Since there can be multiple possible matches, first_match()
    selects the earliest successful match.

  - Once the first successful match of:

        a ##[2:4] b

    is found, the remaining sequence:

        ##1 c

    is applied from that selected match.


  ============================================================
                    TIMING EXAMPLE
  ============================================================

        a ##[2:4] b

        a
        │
        ├── ##2 → b
        ├── ##3 → b
        └── ##4 → b

  - If b can successfully match at more than one of these
    clocking events, first_match() selects the earliest
    successful match.


  ============================================================
                FIRST MATCH WITH ##1 c
  ============================================================

        first_match(a ##[2:4] b) ##1 c

  - First, the assertion looks for a successful match of:

        a ##[2:4] b

  - first_match() selects the earliest successful match.

  - Then:

        ##1 c

    requires c to be true one clocking event after the selected
    b match.

  - Therefore:

        a
         ↓
        ##2 / ##3 / ##4
         ↓
        first successful b
         ↓
        ##1
         ↓
        c


  ============================================================
                WITHOUT first_match()
  ============================================================

        a ##[2:4] b ##1 c

  - Without first_match(), the ranged sequence can have
    multiple possible matches.

  - Each valid match of the ranged sequence can continue with
    the remaining sequence.

  - Therefore, multiple sequence attempts can be active.


  ============================================================
                 WITH first_match()
  ============================================================

        first_match(a ##[2:4] b) ##1 c

  - first_match() selects the earliest successful match of the
    sequence inside it.

  - The later possible matches are not selected by
    first_match().


  ============================================================
                         KEY POINT
  ============================================================

        first_match(sequence)

            → Selects the first successful match of the
              sequence.

        first_match(a ##[2:4] b) ##1 c

            → Find the earliest successful b within the
              ##[2:4] range.

            → Then require c one clock later.

  ============================================================
*/

module first_match_operator_ex;

  bit a,b,c;
  bit clk;

  always #5 clk = ~clk; 
  initial clk = 0;

//   initial begin//code1a
//     a = 1;
//     @(posedge clk);
//     @(posedge clk);
//     b = 1; c =1;
//     @(posedge clk);
//     @(posedge clk);
//     a = 0;
//     @(posedge clk);
//   end
  

//   initial begin//code1b
//     a = 1;
//     @(posedge clk);
//     @(posedge clk);
//     b = 1; 
//     @(posedge clk);
//     @(posedge clk);
//     a = 0;
//     @(posedge clk);
//     c =1;
//   end

//   initial begin//code1c
//     a = 1;
//     @(posedge clk);
//     @(posedge clk);
//     @(posedge clk);
//     b = 1; 
//     @(posedge clk);
//     a = 0;
//     @(posedge clk);
//     c =1;
//   end
  
  
  initial begin//code1d
    a = 1;
    @(posedge clk);
    @(posedge clk);
    @(posedge clk);
    b = 1; c =1;
    @(posedge clk);
    a = 0;
    @(posedge clk);
    @(posedge clk);
  end

  property p1;
    @(posedge clk)
    first_match(a ##[2:4] b) ##1 c ;
//     a ##[2:4] b ##1 c ;
  endproperty

  l1: assert property(p1)
    $display("[%0t] assertion success", $time);
    
  initial begin 
    $dumpfile("tb.vcd");
    $dumpvars(0,tb);
  end 

  initial #100 $finish;

endmodule
