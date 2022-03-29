*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_F03
*&---------------------------------------------------------------------*
FORM zsfe_r_product_ins .

  SELECT MAX( product_id ) AS maxid
  FROM zsfe_d_product
  INTO @DATA(lv_maxid).

      gs_product-product_id = lv_maxid + 1.
      gs_product-provider_id = p_p_id.
      gs_product_t-product_id = lv_maxid + 1.
      gs_product_t-product_type = p_type.
      gs_product_t-product_brand = p_brand.
      gs_product_t-product_name = p_name.
      gs_product_t-langu = sy-langu.
      gs_product-product_kaliber = p_kal.
      gs_product-price = p_price.
   INSERT  zsfe_d_product FROM gs_product.
   INSERT  zsfe_d_product_t FROM gs_product_t.

ENDFORM.
