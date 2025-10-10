CLASS zcl_00_vehicle DEFINITION
  PUBLIC ABSTRACT
  CREATE PUBLIC.

  PUBLIC SECTION.
    DATA make         TYPE string READ-ONLY.
    DATA model        TYPE string READ-ONLY.
    DATA speed_in_kmh TYPE i      READ-ONLY.

    CLASS-DATA number_of_vehicles TYPE i READ-ONLY.

    INTERFACES zif_00_partner ALL METHODS ABSTRACT.

    METHODS constructor
      IMPORTING make  TYPE string
                model TYPE string.

    METHODS accelerate FINAL
      IMPORTING value_in_kmh TYPE i DEFAULT 50.

    METHODS brake FINAL
      IMPORTING value_in_kmh TYPE i.

  PRIVATE SECTION.

ENDCLASS.


CLASS zcl_00_vehicle IMPLEMENTATION.
  METHOD accelerate.
    speed_in_kmh += value_in_kmh.
  ENDMETHOD.

  METHOD brake.
    speed_in_kmh -= value_in_kmh.
  ENDMETHOD.

  METHOD constructor.
    me->make  = make.
    me->model = model.

    number_of_vehicles += 1.
  ENDMETHOD.
ENDCLASS.
