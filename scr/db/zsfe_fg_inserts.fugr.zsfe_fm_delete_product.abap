FUNCTION ZSFE_FM_DELETE_PRODUCT.
*"----------------------------------------------------------------------
*"*"Update Function Module:
*"
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_PRODUCT_ID) TYPE  ZSFE_PRODUCT_ID
*"----------------------------------------------------------------------
      DELETE FROM zsfe_d_product WHERE product_id = lv_product_id.
      DELETE FROM zsfe_d_product_t WHERE product_id = lv_product_id.
ENDFUNCTION.
