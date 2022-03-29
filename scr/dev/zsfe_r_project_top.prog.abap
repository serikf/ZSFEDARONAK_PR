*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PROJECT_TOP
*&---------------------------------------------------------------------*

TABLES:zsfe_d_card,
       zsfe_d_card_t,
       zsfe_d_card_type,
       zsfe_d_order,
       zsfe_d_order_pro,
       zsfe_d_product,
       zsfe_d_product_t,
       sscrfields.

DATA:  gs_product TYPE zsfe_d_product,
       gs_product_t TYPE zsfe_d_product_t,
       gs_order TYPE zsfe_d_order,
       gs_order_pro TYPE zsfe_d_order_pro,
       gt_zsfe_d_product TYPE zsfe_d_product OCCURS 0,
       gt_zsfe_d_product_t TYPE zsfe_d_product_t OCCURS 0.


CLASS: lcl_main        DEFINITION DEFERRED,
       lcl_view        DEFINITION DEFERRED,
       lcl_controller  DEFINITION DEFERRED.

CONSTANTS: BEGIN OF gc_ucomm,
             back   TYPE sy-ucomm VALUE 'BACK',
             exit   TYPE sy-ucomm VALUE 'EXIT',
             cancel TYPE sy-ucomm VALUE 'CANCEL',
             button TYPE sy-ucomm VALUE 'BUTTON',
           END OF gc_ucomm.

 DATA: go_main       TYPE REF TO lcl_main,
       gv_0100_ucomm TYPE sy-ucomm.
