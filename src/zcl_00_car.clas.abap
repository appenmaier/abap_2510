CLASS zcl_00_car DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_vehicle FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA seats TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING make  TYPE string
                model TYPE string
                seats TYPE i.

    METHODS zif_00_partner~to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_00_car IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->seats = seats.
  ENDMETHOD.

  METHOD zif_00_partner~to_string.
    string = |{ make } { model } ( { seats } Sitzplätze)|.
  ENDMETHOD.
ENDCLASS.
