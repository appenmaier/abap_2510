CLASS zcl_00_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA planes TYPE TABLE OF REF TO zcl_00_airplane.

    out->write( zcl_00_airplane=>number_of_airplanes ).
    planes = VALUE #( ( NEW
                        zcl_00_passenger_plane( name            = 'Flugzeug 1'
                                                plane_type      = 'Airbus A380-800'
                                                number_of_seats = 800 ) )
                      ( NEW
                        zcl_00_cargo_plane( name          = 'Flugzeug 2'
                                            plane_type    = 'Boeing 747-400F'
                                            cargo_in_tons = 30 ) )
                      ( NEW
                        zcl_00_passenger_plane( name            = 'Flugzeug 3'
                                                plane_type      = 'Airbus A320-400'
                                                number_of_seats = 400 ) ) ).
    out->write( zcl_00_airplane=>number_of_airplanes ).

    LOOP AT planes INTO FINAL(plane).
      out->write( plane->to_string( ) ).
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
