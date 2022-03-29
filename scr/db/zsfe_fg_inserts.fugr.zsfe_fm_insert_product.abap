FUNCTION zsfe_fm_insert_product.
*"----------------------------------------------------------------------
*"*"Update Function Module:
*"
*"*"Local Interface:
*"  IMPORTING
*"     VALUE(LV_PRODUCT_ID) TYPE  ZSFE_PRODUCT_ID
*"     VALUE(LV_PRODUCT_TYPE) TYPE  ZSFE_PRODUCT_TYPE
*"     VALUE(LV_PRODUCT_BRAND) TYPE  ZSFE_PRODUCT_BRAND
*"     VALUE(LV_PRODUCT_NAME) TYPE  ZSFE_PRODUCT_NAME
*"     VALUE(LV_PRODUCT_KALIBER) TYPE  ZSFE_KALIBER
*"     VALUE(LV_PRODUCT_PRICE) TYPE  ZSFE_PRICE
*"----------------------------------------------------------------------
    DATA:  gs_product TYPE zsfe_d_product,
           gs_product_t TYPE zsfe_d_product_t,
*           lv_rc TYPE inri-returncode,
           lv_number_range TYPE i.

    DATA(p_pr_id) = lv_product_id.
    DATA(p_type) = lv_product_type.
    DATA(p_name) = lv_product_name.
    DATA(p_brand) = lv_product_brand.
    DATA(p_kal) = lv_product_kaliber.
    DATA(p_price) = lv_product_price.

    CALL FUNCTION 'NUMBER_GET_NEXT'
      EXPORTING
        nr_range_nr             = '01'
        object                  = 'ZSFE_PRO'
      IMPORTING
        number                  = lv_number_range
*        returncode              = lv_rc
      EXCEPTIONS
        interval_not_found      = 1
        number_range_not_intern = 2
        object_not_found        = 3
        quantity_is_0           = 4
        quantity_is_not_1       = 5
        interval_overflow       = 6
        buffer_overflow         = 7
        OTHERS                  = 8.

*    SELECT MAX( product_id ) AS maxid
*       FROM zsfe_d_product
*       INTO @DATA(lv_maxid).
*            gs_product-product_id = lv_maxid + 1.
            gs_product-product_id = lv_number_range.
*            gs_product-provider_id = p_p_id.
*            gs_product_t-product_id = lv_maxid + 1.
            gs_product_t-product_id = lv_number_range.
            gs_product_t-product_type = p_type.
            gs_product_t-product_brand = p_brand.
            gs_product_t-product_name = p_name.
            gs_product_t-langu = sy-langu.
            gs_product-product_kaliber = p_kal.
            gs_product-price = p_price.
    INSERT  zsfe_d_product FROM gs_product.
    INSERT  zsfe_d_product_t FROM gs_product_t.

    IF sy-subrc <> 0.
      MESSAGE 'ERROR!' TYPE 'A'. "Rollback
    ENDIF.
ENDFUNCTION.
