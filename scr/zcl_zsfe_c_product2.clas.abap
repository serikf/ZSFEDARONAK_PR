class ZCL_ZSFE_C_PRODUCT2 definition
  public
  inheriting from CL_SADL_GTK_EXPOSURE_MPC
  final
  create public .

public section.
protected section.

  methods GET_PATHS
    redefinition .
  methods GET_TIMESTAMP
    redefinition .
private section.
ENDCLASS.



CLASS ZCL_ZSFE_C_PRODUCT2 IMPLEMENTATION.


  method GET_PATHS.
et_paths = VALUE #(
( |CDS~ZSFE_C_PRODUCT2| )
).
  endmethod.


  method GET_TIMESTAMP.
RV_TIMESTAMP = 20220325223644.
  endmethod.
ENDCLASS.
