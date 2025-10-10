CLASS zcl_00_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle  TYPE REF TO zcl_00_vehicle.
    DATA vehicle2 TYPE REF TO zcl_00_vehicle.
    DATA vehicle3 TYPE REF TO zcl_00_vehicle.
    DATA rental   TYPE REF TO zcl_00_rental.

    vehicle = NEW zcl_00_car( make  = 'Audi'
                              model = 'A4'
                              seats = 5 ). " Upcast
    vehicle2 = NEW zcl_00_car( make  = 'Porsche'
                               model = '911'
                               seats = 2 ). " Upcast
    vehicle3 = NEW zcl_00_truck( make          = 'MAN'
                                 model         = 'TGX'
                                 cargo_in_tons = 40 ). " Upcast

    rental = NEW #( 'My Rental' ).
    rental->add_vehicle( vehicle ).
    rental->add_vehicle( vehicle2 ).
    rental->add_vehicle( vehicle3 ).

    out->write( rental->zif_00_partner~to_string( ) ).
  ENDMETHOD.
ENDCLASS.
