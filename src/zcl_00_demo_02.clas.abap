CLASS zcl_00_demo_02 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_demo_02 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA a TYPE i VALUE 5.
    DATA b TYPE i VALUE 3.
    DATA result TYPE i.
    DATA result2 TYPE p LENGTH 4 DECIMALS 3.

    " Grundrechenarten
    result = a + b.
    out->write( |{ a } + { b } = { result }| ).

    result = a - b.
    out->write( |{ a } - { b } = { result }| ).

    result = a * b.
    out->write( |{ a } * { b } = { result }| ).

    result2 = a / b.
    out->write( |{ a } / { b } = { result2 }| ).

    result = a DIV b.
    out->write( |{ a } DIV { b } = { result }| ).

    result = a MOD b.
    out->write( |{ a } MOD { b } = { result }| ).

    result = a ** b.
    out->write( |{ a } ** { b } = { result }| ).

    "Inkrementieren/Dekrementieren
    result = 0.
    result = result + 1.
    result += 1.

    " Eingebaute mathematische Funktionen
    result = abs( -3 ).
    out->write( |abs -3 = { result }| ).

    result2 = sqrt( 3 ).
    out->write( |sqrt 3 = { result2 }| ).

  ENDMETHOD.

ENDCLASS.
