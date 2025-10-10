CLASS zcl_00_demo_05 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_demo_05 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    " Zähler deklarieren und initialisieren: int i = 0;
    " Schleifenbedingung festlegen: while (i < 10) {
    " Ausgabe implementieren: System.out.println(i + 1);
    " Zähler inkrementieren: i++; }

    WHILE sy-index <= 10.
      out->write( sy-index ).
    ENDWHILE.

    DO 10 TIMES.
      out->write( sy-index ).
    ENDDO.

    DO.
      out->write( sy-index ).
      IF sy-index = 10.
        EXIT.
      ENDIF.
    ENDDO.


  ENDMETHOD.

ENDCLASS.
