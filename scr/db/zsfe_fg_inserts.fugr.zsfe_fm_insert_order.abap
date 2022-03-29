FUNCTION zsfe_fm_insert_order.
*"----------------------------------------------------------------------
*"*"Update Function Module:
*"
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_PASSPORT) TYPE  ZSFE_PASSPORT
*"     VALUE(LV_PRODUCT_ID) TYPE  ZSFE_PRODUCT_ID
*"     VALUE(LV_CARD_ID) TYPE  ZSFE_CARD_ID
*"----------------------------------------------------------------------
    DATA:  gs_product TYPE zsfe_d_product,
           gs_product_t TYPE zsfe_d_product_t,
           gs_order TYPE zsfe_d_order,
           gs_order_pro TYPE zsfe_d_order_pro,
           gt_zsfe_d_product TYPE zsfe_d_product OCCURS 0,
           gt_zsfe_d_product_t TYPE zsfe_d_product_t OCCURS 0.

    DATA(p_p2_id) = lv_product_id.
    DATA(p_pass) = lv_passport.
    DATA(p_ca_id) = lv_card_id.

    SELECT MAX( order_pro_id ) AS maxid
      FROM zsfe_d_order_pro
      INTO @DATA(lv_maxid).

    SELECT MAX( order_id ) AS maxid2
      FROM zsfe_d_order
      INTO @DATA(lv_maxid2)
      BYPASSING BUFFER.
            gs_order_pro-order_pro_id = lv_maxid + 1.
            gs_order_pro-product_id = p_p2_id.
            gs_order_pro-order_id = lv_maxid2 + 1.
            gs_product-product_id = p_p2_id.
            gs_order-order_id = lv_maxid2 + 1.
            gs_order-card_id = p_ca_id.
            gs_order-passport = p_pass.

    INSERT  zsfe_d_product FROM gs_product.
    INSERT  zsfe_d_order FROM gs_order.
    INSERT  zsfe_d_order_pro FROM gs_order_pro.

    IF sy-subrc <> 0.
      MESSAGE 'ERROR' TYPE 'A'. "Rollback
    ENDIF.
ENDFUNCTION.
