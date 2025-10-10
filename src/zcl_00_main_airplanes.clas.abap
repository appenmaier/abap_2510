CLASS zcl_00_main_airplanes DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_main_airplanes IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA agency   TYPE REF TO zcl_00_travel_agency.
    DATA carrier  TYPE REF TO zcl_00_carrier.
    DATA carrier2 TYPE REF TO zcl_00_carrier.

    agency = NEW #( 'TUI' ).

    carrier = NEW #( 'Lufthansa' ).
    carrier2 = NEW #( 'United Airlines' ).

    agency->add_partner( carrier ).
    agency->add_partner( carrier2 ).

    carrier2->add_airplane( NEW
                        zcl_00_passenger_plane( name            = 'Flugzeug 1'
                                                plane_type      = 'Airbus A380-800'
                                                number_of_seats = 800 ) ).
    carrier->add_airplane( NEW
                         zcl_00_cargo_plane( name          = 'Flugzeug 2'
                                             plane_type    = 'Boeing 747-400F'
                                             cargo_in_tons = 30 ) ).
    carrier->add_airplane( NEW
                         zcl_00_cargo_plane( name          = 'Flugzeug 3'
                                             plane_type    = 'Airbus A320-400'
                                             cargo_in_tons = 50 ) ).

    out->write( agency->to_string( ) ).
  ENDMETHOD.
ENDCLASS.
