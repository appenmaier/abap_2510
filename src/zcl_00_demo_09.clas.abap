CLASS zcl_00_demo_09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_demo_09 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " SELECT [Spalte 1], [Spalte 2],...
    "   FROM [Datenbanktabelle]
    "   WHERE [Bedingung]

    DATA connection TYPE /dmo/connection.
    DATA connections TYPE TABLE OF /dmo/connection.

    " Lesen eines Datensatzes
    SELECT SINGLE FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'LH' AND connection_id = '0400'
      INTO @connection.
    IF sy-subrc <> 0.
      "error handling
    ENDIF.

    " Lesen mehrerer Datensätze
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'XX'
      INTO TABLE @connections.
    IF sy-subrc <> 0.
      "error handling
    ENDIF.

    " Lesen mehrerer Datensätze per Schleife
    SELECT FROM /dmo/connection
      FIELDS *
      WHERE carrier_id = 'LH'
      INTO @connection.
      out->write( connection ).
    ENDSELECT.

    " Definition der Zielvariablen
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = 'LH' AND connection_id = '0400'
      INTO @DATA(connection2).

    DATA connection3 TYPE z00_flight_connection.
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = 'LH' AND connection_id = '0400'
      INTO @connection3.

    CLEAR connection.
    SELECT SINGLE FROM /dmo/connection
      FIELDS carrier_id, connection_id, airport_from_id, airport_to_id
      WHERE carrier_id = 'LH' AND connection_id = '0400'
      INTO CORRESPONDING FIELDS OF @connection.

    " Tabellen-Joins
    SELECT SINGLE FROM /dmo/connection
      INNER JOIN /dmo/airport ON /dmo/connection~airport_from_id = /dmo/airport~airport_id
      FIELDS /dmo/connection~airport_from_id, /dmo/airport~name
      WHERE carrier_id = 'JL' AND connection_id = '0407'
      INTO @DATA(connection4).

    out->write( connection4 ).

  ENDMETHOD.
ENDCLASS.
