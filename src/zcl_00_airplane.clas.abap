CLASS zcl_00_airplane DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA name       TYPE string READ-ONLY.
    DATA plane_type TYPE string READ-ONLY.

    CLASS-DATA number_of_airplanes TYPE i READ-ONLY.

    METHODS constructor IMPORTING !name      TYPE string
                                  plane_type TYPE string.

    METHODS to_string ABSTRACT RETURNING VALUE(string) TYPE string.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_00_airplane IMPLEMENTATION.
  METHOD constructor.
    me->name       = name.
    me->plane_type = plane_type.

    number_of_airplanes += 1.
  ENDMETHOD.
ENDCLASS.
