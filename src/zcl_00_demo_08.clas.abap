CLASS zcl_00_demo_08 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_demo_08 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA connections TYPE z00_connections. " TYPE [Tabellentyp]
    DATA connections2 TYPE TABLE OF z00_flight_connection. " TYPE TABLE OF [Strukturtyp]
    DATA connection TYPE z00_flight_connection.

    " Hinzufügen von Datensätzen
    connections = VALUE #(
      ( carrier_id = 'LH' connection_id = '0400' )
      ( )
      ( carrier_id = 'UA' connection_id = '3517' airport_from_id = 'FRA' )
      ( airport_to_id = 'JFK' airport_from_id = 'FRA' ) ).

    " Anfügen von Datensätze
    connection-carrier_id = 'AZ'.
    connection-airport_from_id = 'MUC'.
    connection-airport_to_id = 'LAX'.

    connections = VALUE #( BASE connections
      ( carrier_id = 'LH' connection_id = '0400' )
      ( connection ) ).

    APPEND connection TO connections.

    " Lesen eines Datensatzes
    IF line_exists( connections[ 3 ] ).
      connection = connections[ 3 ]. " per Index
    ENDIF.

    TRY.
        DATA(connection2) = connections[ carrier_id = 'AZ' airport_to_id = 'LAX' ]. " per Schlüssel
      CATCH cx_sy_itab_line_not_found INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    " Lesen mehrerer Datensätze
    LOOP AT connections INTO DATA(connection3) WHERE carrier_id = 'LH'.
      out->write( connection3 ).
    ENDLOOP.

    out->write( |{ cl_abap_char_utilities=>newline }| ).

    LOOP AT connections INTO connection FROM 2 TO 3.
      out->write( connection ).
    ENDLOOP.

    " Ändern eines Datensatzes
    connections[ 2 ]-carrier_id = 'LH'.
    connections[ 2 ]-connection_id = '0401'.
    connections[ 2 ]-airport_from_id = 'JFK'.
    connections[ 2 ]-airport_to_id = 'FRA'.

    " Ändern mehrerer Datensätze
    LOOP AT connections ASSIGNING FIELD-SYMBOL(<connection>) WHERE airport_to_id IS INITIAL.
      <connection>-airport_to_id = 'BER'.
    ENDLOOP.

    " Sortieren
    SORT connections BY carrier_id DESCENDING connection_id ASCENDING.

    " Löschen von Datensätze
    DELETE connections WHERE airport_from_id IS INITIAL.

    " Zählen
    out->write( |Lines: { lines( connections ) }| ).

    " Ausgabe
    out->write( connections ).

  ENDMETHOD.
ENDCLASS.
