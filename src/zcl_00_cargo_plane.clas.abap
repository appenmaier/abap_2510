CLASS zcl_00_cargo_plane DEFINITION
  PUBLIC
  INHERITING FROM zcl_00_airplane FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA cargo_in_tons TYPE i READ-ONLY.

    METHODS constructor
      IMPORTING !name         TYPE string
                plane_type    TYPE string
                cargo_in_tons TYPE i.

    METHODS to_string REDEFINITION.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_00_cargo_plane IMPLEMENTATION.
  METHOD constructor.
    super->constructor( name       = name
                        plane_type = plane_type ).

    me->cargo_in_tons = cargo_in_tons.
  ENDMETHOD.

  METHOD to_string.
    string = |Frachtflugzeug mit { cargo_in_tons } Tonnen Frachtkapazität: { name }|.
  ENDMETHOD.
ENDCLASS.
