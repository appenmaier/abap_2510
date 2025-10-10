CLASS zcl_00_main_vehicles DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_main_vehicles IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA vehicle        TYPE REF TO zcl_00_vehicle.
    DATA vehicle2       TYPE REF TO zcl_00_vehicle.
    DATA vehicle3       TYPE REF TO zcl_00_vehicle.
    DATA vehicles       TYPE TABLE OF REF TO zcl_00_vehicle.
    DATA total_seats    TYPE i.
    DATA number_of_cars TYPE i.

    out->write( zcl_00_vehicle=>number_of_vehicles ).

    vehicle = NEW zcl_00_car( make  = 'Audi'
                              model = 'A4'
                              seats = 5 ). " Upcast
    vehicle2 = NEW zcl_00_car( make  = 'Porsche'
                               model = '911'
                               seats = 2 ). " Upcast
    vehicle3 = NEW zcl_00_truck( make          = 'MAN'
                                 model         = 'TGX'
                                 cargo_in_tons = 40 ). " Upcast

    out->write( zcl_00_vehicle=>number_of_vehicles ).
    vehicles = VALUE #( ( vehicle ) ( vehicle2 ) ( vehicle3 ) ).

    LOOP AT vehicles INTO FINAL(vehicle4).
      out->write( vehicle4->zif_00_partner~to_string( ) ). " Dynamische Polymorphie
      IF vehicle4 IS INSTANCE OF zcl_00_car.
        FINAL(car) = CAST zcl_00_car( vehicle4 ). " Downcast
        total_seats += car->seats.
        number_of_cars += 1.
      ENDIF.
    ENDLOOP.

    out->write( |Cars: { number_of_cars }| ).
    out->write( |Seats: { total_seats }| ).
  ENDMETHOD.
ENDCLASS.
