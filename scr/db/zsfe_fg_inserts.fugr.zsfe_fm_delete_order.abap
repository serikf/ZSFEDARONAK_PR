FUNCTION zsfe_fm_delete_order.
*"----------------------------------------------------------------------
*"*"Update Function Module:
*"
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_ORDER_ID) TYPE  ZSFE_ORDER_ID
*"----------------------------------------------------------------------

      DELETE FROM zsfe_d_order WHERE order_id = lv_order_id.
      DELETE FROM zsfe_d_order_pro WHERE order_id = lv_order_id.
ENDFUNCTION.
