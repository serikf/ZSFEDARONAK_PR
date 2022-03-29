class ZCL_SF_CUSTOMER definition
  public
  create public .

public section.

  interfaces ZIF_SF_PERSONALITY .

  data MV_CARD_ID type ZSFE_CARD_ID read-only .

  methods CONSTRUCTOR .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SF_CUSTOMER IMPLEMENTATION.


  METHOD constructor.


  ENDMETHOD.
ENDCLASS.
