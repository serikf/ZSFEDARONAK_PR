FUNCTION zsfe_fm_update_order.
*"----------------------------------------------------------------------
*"*"Update Function Module:
*"
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_ORDER_ID) TYPE  ZSFE_ORDER_ID
*"     VALUE(LV_PRODUCT_ID) TYPE  ZSFE_PRODUCT_ID
*"     VALUE(LV_PASSPORT) TYPE  ZSFE_PASSPORT
*"     VALUE(LV_CARD_ID) TYPE  ZSFE_CARD_ID
*"----------------------------------------------------------------------
 IF lv_product_id IS NOT INITIAL.
          UPDATE zsfe_d_order_pro SET product_id = lv_product_id WHERE order_id = lv_order_id.
 ENDIF.
 IF lv_card_id IS NOT INITIAL.
          UPDATE zsfe_d_order SET card_id = lv_card_id WHERE order_id = lv_order_id.
 ENDIF.
 IF lv_passport IS NOT INITIAL.
          UPDATE zsfe_d_order SET passport = lv_passport WHERE order_id = lv_order_id.
 ENDIF.

ENDFUNCTION.
