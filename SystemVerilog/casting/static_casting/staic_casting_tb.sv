/*
  ============================================================
                       STATIC CASTING
  ============================================================

  - Static casting is used to convert a value from one data
    type to another data type.

  - The syntax is:

        data_type'(expression)

  - The expression is converted to the specified data type.

  - In this example:

        int'(s)     → converts s to int
        int'(r)     → converts r to int
        string'(i)  → converts i to string
        real'(i)    → converts i to real
        real'(s)    → converts s to real

  - Static casting is performed explicitly by writing the
    required data type before the value.

  - The result of the cast can be assigned to another variable.

  ============================================================
*/

module staic_casting_tb; 
  int    i = 97;
  real   r = 2.5;
  string s = "A";
  int    s_i;
  int    r_i;
  real   i_r;
  real   s_r;
  string i_s;
  
  initial begin
    s_i = int'(s);
    r_i = int'(r);
    i_s = string'(i);
    i_r = real'(i);
    s_r = real'(s);
    $display("int=%0d,int_string=%0s,int_real=%0f",i,i_s,i_r);
    $display("string=%0s,string_int=%0d,string_real=%0f",s,s_i,s_r);
    $display("real=%0f,real_int=%0d",r,r_i);
  end
endmodule
