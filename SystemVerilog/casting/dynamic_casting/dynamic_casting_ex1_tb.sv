/*
  ============================================================
                    ENUMERATION (ENUM)
  ============================================================

  - An enum is a user-defined data type that contains a fixed
    set of named values.

  - In this example:

        typedef enum {
          cycle,
          Scooty,
          Bike,
          Bus,
          Train,
          Plane
        } vehicles_e;

  - vehicles_e can store only the values defined in the enum.

  - By default, enum values start from 0 and increase by 1.

        cycle  → 0
        Scooty → 1
        Bike   → 2
        Bus    → 3
        Train  → 4
        Plane  → 5

  - The .name() method returns the name of the current enum
    value.

        veh_e.name()

  - Therefore, if veh_e contains value 2:

        veh_e.name() → "Bike"

  ============================================================
                    DYNAMIC CASTING
  ============================================================

  - Dynamic casting checks at runtime whether a value can be
    converted to the required type and, if valid, converts it.

  - Dynamic casting is performed using the $cast() system
    task/function.

  - The syntax is:

        $cast(destination, source);

  - In this example:

        $cast(veh_e, 1);

    attempts to convert the value 1 into the enum type
    vehicles_e.

  - Since 1 is a valid value of vehicles_e, veh_e becomes:

        Scooty

  - Similarly:

        $cast(veh_e, 2); → Bike
        $cast(veh_e, 3); → Bus
        $cast(veh_e, 4); → Train
        $cast(veh_e, 5); → Plane

  - However:

        $cast(veh_e, 6);

    fails because 6 is not one of the valid values of the
    vehicles_e enum.

  - Therefore, $cast() allows the conversion only when the
    source value is valid for the destination type.

  ============================================================
*/



module dynamic_casting_ex1_tb;
  
  typedef enum {cycle,Scooty,Bike,Bus,Train,Plane}vehicles_e;
  
  initial begin 
    vehicles_e veh_e;
    $display(veh_e.name());
    $cast(veh_e,1);
    $display(veh_e.name());
    
    $cast(veh_e,2);
    $display(veh_e.name());
    
    $cast(veh_e,3);
    $display(veh_e.name());
    
    $cast(veh_e,4);
    $display(veh_e.name());
    
    $cast(veh_e,5);
    $display(veh_e.name());
    
    $cast(veh_e,6);
    $display(veh_e.name());
  end 
  
endmodule  
