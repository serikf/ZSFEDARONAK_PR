class ZCL_SF_CONTROLLER definition
  public
  create public .

public section.

  data LO_ALL_ORDERS type ref to ZCL_SF_SHOP read-only .

  methods GET_OBJECT .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SF_CONTROLLER IMPLEMENTATION.


  method GET_OBJECT.
    create object: lo_all_orders.
  endmethod.
ENDCLASS.
