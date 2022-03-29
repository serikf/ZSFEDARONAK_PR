class ZCL_SF_UI definition
  public
  final
  create public .

public section.

  methods SHOW_ALL_ORDERS
    importing
      !LT_SHOW_ALL_ORDERS type ZCL_SF_SHOP=>GT_ALL_ORDERS .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SF_UI IMPLEMENTATION.


  method SHOW_ALL_ORDERS.

    cl_demo_output=>display( lt_show_all_orders ).
  endmethod.
ENDCLASS.
