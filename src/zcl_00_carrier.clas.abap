CLASS zcl_00_carrier DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name      TYPE string        READ-ONLY.
    DATA airplanes TYPE z00_airplanes READ-ONLY.

    INTERFACES zif_00_partner.

    METHODS constructor
      IMPORTING !name TYPE string.

    METHODS add_airplane
      IMPORTING airplane TYPE REF TO zcl_00_airplane.

    METHODS get_biggest_cargo_plane
      RETURNING VALUE(biggest_cargo_plane) TYPE REF TO zcl_00_cargo_plane.

    METHODS to_string
      RETURNING VALUE(string) TYPE string.
ENDCLASS.


CLASS zcl_00_carrier IMPLEMENTATION.
  METHOD add_airplane.
    APPEND airplane TO airplanes.

*    airplanes = VALUE #( BASE airplanes ( airplane ) ).
  ENDMETHOD.

  METHOD constructor.
    me->name = name.
  ENDMETHOD.

  METHOD get_biggest_cargo_plane.
    DATA max_cargo TYPE i.

    LOOP AT airplanes INTO DATA(airplane).
      IF airplane IS INSTANCE OF zcl_00_cargo_plane.
        DATA(cargo_plane) = CAST zcl_00_cargo_plane( airplane ).
        IF cargo_plane->cargo_in_tons > max_cargo.
          max_cargo = cargo_plane->cargo_in_tons.
          biggest_cargo_plane = cargo_plane.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.

  METHOD to_string.
    string = |{ name }\n|.
    LOOP AT airplanes INTO FINAL(airplane).
      string &&= |{ airplane->to_string( ) }\n|.
    ENDLOOP.
  ENDMETHOD.

  METHOD zif_00_partner~to_string.
    string = to_string( ).
  ENDMETHOD.
ENDCLASS.
