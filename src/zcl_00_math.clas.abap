CLASS zcl_00_math DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS add
      IMPORTING a             TYPE z00_decimal
                b             TYPE z00_decimal
      RETURNING VALUE(result) TYPE z00_decimal. " public static int add(int a, int b)

    CLASS-METHODS divide
      IMPORTING a             TYPE z00_decimal
                b             TYPE z00_decimal
      RETURNING VALUE(result) TYPE z00_decimal
      RAISING   cx_abap_invalid_value.

    CLASS-METHODS calculate_percentage
      IMPORTING !percentage   TYPE z00_decimal
                base_value    TYPE z00_decimal
      RETURNING VALUE(result) TYPE z00_decimal.

ENDCLASS.


CLASS zcl_00_math IMPLEMENTATION.
  METHOD add.
    " result = a + b.
    RETURN a + b.
  ENDMETHOD.

  METHOD divide.
    IF b IS INITIAL. " IF b = 0. IF b = '0.00'.
      RAISE EXCEPTION NEW cx_abap_invalid_value( value = '0' ).
    ENDIF.

    RETURN a / b.
  ENDMETHOD.

  METHOD calculate_percentage.
    result = ( percentage / 100 ) * base_value.
  ENDMETHOD.
ENDCLASS.







