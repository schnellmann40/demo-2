CLASS zcl_generate_test_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_generate_test_data IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA: itab TYPE TABLE OF zsflight_ext.
    DATA: wa_itab LIKE LINE OF itab.

*    DELETE existing entries in the database table
    DELETE FROM zsflight_ext.

*    Prepare first entry for table
    move sy-mandt to wa_itab-mandt.
    move 'LH' to wa_itab-carrier_id.
    move sy-datum to wa_itab-flight_date.
    move 500 to wa_itab-restricted_seats.
    move 1000 to wa_itab-restricted_seats_b.
    move 1500 to wa_itab-restricted_seats_fc.

*    write to table
    INSERT zsflight_ext FROM wa_itab.

*    check output with demo class
    SELECT *
    from zsflight_ext
    INTO TABLE itab
    UP TO 5 rows.

    out->write( sy-subrc ).
    out->write( sy-dbcnt ).
    out->write( 'ZSflight data inserted succesfully!' ).

  ENDMETHOD.

ENDCLASS.
