CLASS zcl_00_abap_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA operand1 TYPE p LENGTH 16 DECIMALS 2.
    DATA operator TYPE c LENGTH 1.
    DATA operand2 TYPE p LENGTH 16 DECIMALS 2.
    DATA result   TYPE p LENGTH 16 DECIMALS 2.

    operand1 = 5.
    operator = '2'.
    operand2 = 0.

    CASE operator.
      WHEN '+'.
        result = operand1 + operand2.
      WHEN '-'.
        result = operand1 - operand2.
      WHEN '*'.
        result = operand1 * operand2.
      WHEN '/'.
        result = operand1 / operand2.
      WHEN '%'.
        result = zcl_00_math=>calculate_percentage( percentage = operand1
                                                    base_value = operand2 ).
      WHEN 'P'.
        result = zcl_abap_calculator=>calculate_power(
                   base     = operand1
                   exponent = operand2 ).
      WHEN '2'.
        result = zcl_abap_calculator=>calculate_power( operand1 ).
      WHEN OTHERS.
    ENDCASE.

*    result = SWITCH #( operator
*                       WHEN '+' THEN operand1 + operand2
*                       WHEN '-' THEN operand1 - operand2
*                       WHEN '*' THEN operand1 * operand2
*                       WHEN '/' THEN operand1 / operand2 ).

    out->write( |{ operand1 NUMBER = USER } { operator } { operand2 NUMBER = USER } = { result NUMBER = USER }| ).
  ENDMETHOD.
ENDCLASS.
