CLASS zcl_00_truck DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_vehicle FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING make          TYPE string
                model         TYPE string
                cargo_in_tons TYPE i.

    METHODS zif_00_partner~to_string REDEFINITION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_00_truck IMPLEMENTATION.
  METHOD constructor.
    super->constructor( make  = make
                        model = model ).
    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD zif_00_partner~to_string.
    string = |{ make } { model } ({ cargo_in_tons }t)|.
  ENDMETHOD.
ENDCLASS.
