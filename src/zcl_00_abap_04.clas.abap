CLASS zcl_00_abap_04 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_04 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA customer  TYPE zabap_customer.
    DATA customer2 TYPE z00_customer.

    TRY.
        customer = zcl_abap_helper=>get_customer( '60606' ).
        customer2 = zcl_abap_helper=>get_customer( '999' ).
        FINAL(customer3) = zcl_abap_helper=>get_customer( '19286' ).
      CATCH zcx_abap_no_data INTO FINAL(x).
        out->write( x->get_text( ) ).
    ENDTRY.

    out->write( customer ).
    out->write( customer2 ).
    out->write( customer3 ).
  ENDMETHOD.
ENDCLASS.
