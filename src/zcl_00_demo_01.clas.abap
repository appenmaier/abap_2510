CLASS zcl_00_demo_01 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_00_demo_01 IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA i1 TYPE i.
    DATA c12 TYPE c LENGTH 12.
    DATA n7 TYPE n LENGTH 7.
    DATA d1 TYPE d.
    DATA t1 TYPE t.
    DATA p162 TYPE p LENGTH 16 DECIMALS 2.
    DATA f1 TYPE c LENGTH 1. " data f1.

    i1 = 42.
    c12 = 'Daniel'.
    n7 = '8172654'.
    d1 = '20251006'.
    t1 = '111940'.
    p162 = '55428.79'.
    f1 = abap_true.

  ENDMETHOD.
ENDCLASS.
