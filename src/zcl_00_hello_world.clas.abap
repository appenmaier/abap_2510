CLASS zcl_00_hello_world DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_hello_world IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA text TYPE string. " Java: String text; Python: text

    text = 'Hello World'.

    out->write( text ). " Java: System.out.println(text); Python: print(text)
  ENDMETHOD.
ENDCLASS.
