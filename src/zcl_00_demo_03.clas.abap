CLASS zcl_00_demo_03 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_03 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA text TYPE string VALUE 'Hello'.

    DATA(text2) = 'World'. " DATA text2 TYPE string VALUE 'World'.

    DATA(text3) = |{ text } { text2 }|.
    text3 = |{ text } { text2 }|.
    text3 = replace( val  = text3
                     sub  = 'l'
                     with = 'L'
                     occ  = 0 ).

    out->write( text3 ).

    SPLIT text3 AT ' ' INTO text2 text.
    out->write( text ).
    out->write( text2 ).

  ENDMETHOD.
ENDCLASS.
