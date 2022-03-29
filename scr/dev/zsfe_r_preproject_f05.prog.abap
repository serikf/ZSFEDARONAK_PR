*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_F05
*&---------------------------------------------------------------------*
FORM zsfe_r_order_ins .

  SELECT MAX( order_pro_id ) AS maxid
  FROM zsfe_d_order_pro
  INTO @DATA(lv_maxid).

   IF gv_ord = '1'.
    SELECT MAX( order_id ) AS maxid2
      FROM zsfe_d_order
      INTO @DATA(lv_maxid2).
   ELSE.
      lv_maxid2 = p_or_id.
   ENDIF.

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

ENDFORM.
