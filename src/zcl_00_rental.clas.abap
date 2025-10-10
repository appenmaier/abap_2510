CLASS zcl_00_rental DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    TYPES t_vehicles TYPE TABLE OF REF TO zcl_00_vehicle.

    INTERFACES zif_00_partner.

    DATA name     TYPE string READ-ONLY.
    DATA vehicles TYPE t_vehicles.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_vehicle
      IMPORTING vehicle TYPE REF TO zcl_00_vehicle.
ENDCLASS.


CLASS zcl_00_rental IMPLEMENTATION.
  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD zif_00_partner~to_string.
    string = |{ name }\n|.
    LOOP AT vehicles INTO FINAL(vehicle).
      string &&= |{ vehicle->zif_00_partner~to_string( ) }\n|.
    ENDLOOP.
  ENDMETHOD.

  METHOD add_vehicle.
    vehicles = VALUE #( BASE vehicles
                        ( vehicle ) ).
  ENDMETHOD.
ENDCLASS.
