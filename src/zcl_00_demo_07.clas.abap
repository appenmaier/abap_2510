CLASS zcl_00_demo_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA connection TYPE z00_flight_connection.
    DATA flight TYPE z00_flight.
    DATA flight_extended TYPE z00_flight_extended.

    connection-carrier_id      = 'LH'.
    connection-connection_id   = '0400'.
    connection-airport_from_id = 'FRA'.
    connection-airport_to_id   = 'JFK'.

    flight-carrier_id = 'LH'.
    flight-connection_id = '0401'.
    flight-flight_date = cl_abap_context_info=>get_system_date( ).

    flight_extended = CORRESPONDING #( connection ).
    flight_extended-airprt_to_id = connection-airport_to_id.
    flight_extended = CORRESPONDING #( BASE ( flight_extended ) flight ).

    out->write( flight_extended ).
  ENDMETHOD.
ENDCLASS.
