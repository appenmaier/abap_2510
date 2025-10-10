CLASS zcl_00_demo_06 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_demo_06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        out->write( zcl_00_math=>divide( a = 5
                                         b = 0 ) ).
      CATCH cx_abap_invalid_value INTO FINAL(x).
        out->write( x->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
