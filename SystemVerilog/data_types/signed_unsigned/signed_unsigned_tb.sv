/*
  ============================================================
                     SIGNED VALUES
  ============================================================

  - A signed value uses the MSB as the sign bit.

  - MSB = 0 → Positive
    MSB = 1 → Negative

  - $signed() can be used to explicitly treat an expression
    as signed.

        $signed(8'b1111_1110)

  - Here, 1111_1110 represents -2.


  ============================================================
                    UNSIGNED VALUES
  ============================================================

  - An unsigned value uses all bits to represent the value.

  - A packed vector is unsigned by default unless it is
    explicitly declared as signed.

  - Therefore:

        8'b1111_1110

    as an unsigned value represents 254.


  ============================================================
              SIGN EXTENSION AND ZERO EXTENSION
  ============================================================

  - When a value is extended from a smaller width to a larger
    width, the new bits depend on whether the value is signed
    or unsigned.

  - Signed value → Sign extension

        8'b1111_1110
              ↓
        11111111111111111111111111111110

    The MSB (1) is copied into the new higher-order bits.

  - Unsigned value → Zero extension

        8'b1111_1110
              ↓
        00000000000000000000000011111110

    Zeros are added to the new higher-order bits.

  - Therefore:

        Signed   → Sign bit is extended
        Unsigned → 0 is extended


  ============================================================
*/


module signed_unsigned_tb;
  int a,b;
  reg [31:0] c; 

  initial begin
    a  = $signed(8'b1111_1110); 
    b  = 8'b1111_1111; 
    $display("a=%0d,a=%b",a,a);
    $display("b=%0d,b=%b",b,b);
    a  = $signed(8'b0111_1111); 
    b  = 8'b0111_1111; 
    $display("a=%0d,a=%b",a,a);
    $display("b=%0d,b=%b",b,b);
  end 
endmodule

