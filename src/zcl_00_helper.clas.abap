CLASS zcl_00_helper DEFINITION
  PUBLIC FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CLASS-METHODS get_travel_with_customer
      IMPORTING travel_id                   TYPE /dmo/travel_id
      RETURNING VALUE(travel_with_customer) TYPE zabap_travel_with_customer
      RAISING   zcx_abap_no_data.

    CLASS-METHODS get_travels
      IMPORTING customer_id    TYPE /dmo/customer_id
      RETURNING VALUE(travels) TYPE z00_travels
      RAISING   zcx_abap_no_data.
ENDCLASS.


CLASS zcl_00_helper IMPLEMENTATION.
  METHOD get_travel_with_customer.
*    FINAL(travel) = zcl_abap_helper=>get_travel( travel_id ).
*    FINAL(customer) = zcl_abap_helper=>get_customer( travel-customer_id ).

*    SELECT SINGLE FROM /dmo/travel
*      FIELDS *
*      WHERE travel_id = @travel_id
*      INTO @FINAL(travel).
*    IF sy-subrc <> 0.
*      "raise exception
*    ENDIF.
*
*    SELECT SINGLE FROM /dmo/customer
*      FIELDS *
*      WHERE customer_id = @travel-customer_id
*      INTO @FINAL(customer).
*    IF sy-subrc <> 0.
*      "raise exception
*    ENDIF.
*
*    travel_with_customer = CORRESPONDING #( travel ).
*    travel_with_customer = CORRESPONDING #( BASE ( travel_with_customer ) customer ).

    SELECT SINGLE
      FROM /dmo/travel AS t
             INNER JOIN
               /dmo/customer AS c ON t~customer_id = c~customer_id
      FIELDS *
      WHERE t~travel_id = @travel_id
      INTO CORRESPONDING FIELDS OF @travel_with_customer.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'TRAVEL_ID'
                                            value = CONV #( travel_id ) ).
    ENDIF.
  ENDMETHOD.

  METHOD get_travels.
*    travels = zcl_abap_helper=>get_travels( customer_id ).
    SELECT FROM /dmo/travel
      FIELDS *
      WHERE customer_id = @customer_id
      INTO TABLE @travels.
    IF sy-subrc <> 0.
      RAISE EXCEPTION NEW zcx_abap_no_data( table = '/DMO/TRAVEL'
                                            field = 'CUSTOMER_ID'
                                            value = CONV #( customer_id ) ).
    ENDIF.
  ENDMETHOD.
ENDCLASS.
