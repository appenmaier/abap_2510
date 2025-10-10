CLASS zcl_00_demo_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    FINAL(first_name) = 'Anna'.
    FINAL(last_name) = 'Maier'.
    FINAL(gender) = 'w'.
    FINAL(age) = 16.

    " Verzweigungen

    " Vergleichsoperatoren: <, <=, >, >=, =, <>
    " Logische Operatoren: AND, OR, NOT
    " Spezielle Operatoren: BETWEEN, IS INITIAL, IN
    IF gender = 'm' AND age >= 18.
      out->write( |Hallo Herr { last_name }| ).
    ELSEIF gender = 'w' AND age >= 18.
      out->write( |Hallo Frau { last_name }| ).
    ELSE.
      out->write( |Hallo { first_name }| ).
    ENDIF.

    out->write( COND #( WHEN gender = 'm' AND age >= 18 THEN |Hallo Herr { last_name }|
                        WHEN gender = 'w' AND age >= 18 THEN |Hallo Frau { last_name }|
                        ELSE                                 |Hallo { first_name }| ) ).

    " Fallunterscheidungen
    CASE gender.
      WHEN 'm' OR 'M'.
        out->write( |Hallo Herr { last_name }| ).
      WHEN 'w' OR 'W'.
        out->write( |Hallo Frau { last_name }| ).
      WHEN OTHERS.
        out->write( |Hallo { first_name }| ).
    ENDCASE.

    out->write( SWITCH #( gender
                          WHEN 'm' OR 'M' THEN |Hallo Herr { last_name }|
                          WHEN 'w' OR 'W' THEN |Hallo Frau { last_name }|
                          ELSE                 |Hallo { first_name }| ) ).
  ENDMETHOD.
ENDCLASS.
