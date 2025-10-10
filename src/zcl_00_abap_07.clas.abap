CLASS zcl_00_abap_07 DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.


CLASS zcl_00_abap_07 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    TRY.
        DATA(travels) = zcl_00_helper=>get_travels( '000000' ).

        DELETE travels WHERE end_date < cl_abap_context_info=>get_system_date( ).

        LOOP AT travels ASSIGNING FIELD-SYMBOL(<travel>).
          <travel>-booking_fee *= '1.1'.
        ENDLOOP.

        SORT travels BY description DESCENDING.

        LOOP AT travels INTO FINAL(travel).
          out->write(
              |{ travel-begin_date DATE = USER } - { travel-end_date DATE = USER }: { travel-description } ({ travel-booking_fee NUMBER = USER } { travel-currency_code })| ).
        ENDLOOP.
      CATCH zcx_abap_no_data INTO DATA(x).
        out->write( x->get_text( ) ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
