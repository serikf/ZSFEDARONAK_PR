class ZCL_SF_SHOP_DAO definition
  public
  final
  create public .

public section.

  methods SAVE_ORDER
    importing
      !IV_PASSPORT type ZSFE_PASSPORT
      !IV_PRODUCT_ID type ZSFE_PRODUCT_ID
      !IV_CARD_ID type ZSFE_CARD_ID
    exporting
      !LV_PRODUCT_ID type ZSFE_PRODUCT_ID
      !LV_PASSPORT type ZSFE_PASSPORT
      !LV_CARD_ID type ZSFE_CARD_ID .
  class-methods GET_INSTANCE
    returning
      value(RO_SHOP_DAO) type ref to ZCL_SF_SHOP_DAO .
  methods SAVE_PRODUCT
    importing
      !IV_PRODUCT_ID type ZSFE_PRODUCT_ID
      !IV_PRODUCT_TYPE type ZSFE_PRODUCT_TYPE
      !IV_PRODUCT_BRAND type ZSFE_PRODUCT_BRAND
      !IV_PRODUCT_NAME type ZSFE_PRODUCT_NAME
      !IV_PRODUCT_KALIBER type ZSFE_KALIBER
      !IV_PRODUCT_PRICE type ZSFE_PRICE
    exporting
      !LV_PRODUCT_ID type ZSFE_PRODUCT_ID
      !LV_PRODUCT_TYPE type ZSFE_PRODUCT_TYPE
      !LV_PRODUCT_NAME type ZSFE_PRODUCT_NAME
      !LV_PRODUCT_KALIBER type ZSFE_KALIBER
      !LV_PRODUCT_BRAND type ZSFE_PRODUCT_BRAND
      !LV_PRODUCT_PRICE type ZSFE_PRICE .
  methods DELETE_ORDER
    importing
      !IV_ORDER_ID type ZSFE_ORDER_ID
    exporting
      !LV_ORDER_ID type ZSFE_ORDER_ID .
  methods DELETE_PRODUCT
    importing
      !IV_PRODUCT_ID type ZSFE_PRODUCT_ID
    exporting
      !LV_PRODUCT_ID type ZSFE_PRODUCT_ID .
  methods UPDATE_ORDER
    importing
      value(IV_PASSPORT) type ZSFE_PASSPORT
      value(IV_PRODUCT_ID) type ZSFE_PRODUCT_ID
      value(IV_ORDER_ID) type ZSFE_ORDER_ID
      value(IV_CARD_ID) type ZSFE_CARD_ID
    exporting
      value(LV_ORDER_ID) type ZSFE_ORDER_ID
      value(LV_PASSPORT) type ZSFE_PASSPORT
      value(LV_PRODUCT_ID) type ZSFE_PRODUCT_ID
      value(LV_CARD_ID) type ZSFE_CARD_ID .
protected section.
private section.

  class-data LO_SHOP_DAO type ref to ZCL_SF_SHOP_DAO .
ENDCLASS.



CLASS ZCL_SF_SHOP_DAO IMPLEMENTATION.


 METHOD delete_order.

   CALL FUNCTION 'ZSFE_FM_DELETE_ORDER' IN UPDATE TASK
        EXPORTING
                  lv_order_id = iv_order_id.
        IF sy-subrc = 0.
            MESSAGE 'Order DELETED' TYPE 'S'.
   COMMIT WORK.
        ELSE.
            MESSAGE 'ERROR' TYPE 'W'.
        ENDIF.
 ENDMETHOD.


  METHOD delete_product.
   CALL FUNCTION 'ZSFE_FM_DELETE_PRODUCT'
        EXPORTING
                lv_product_id = iv_product_id.
        IF sy-subrc = 0.
           MESSAGE 'Product DELETED' TYPE 'I'." Commit
        ELSE.
           MESSAGE 'ERROR' TYPE 'W'.
        ENDIF.
  ENDMETHOD.


  METHOD get_instance.
    IF lo_shop_dao IS NOT BOUND.
      CREATE OBJECT lo_shop_dao.
    ENDIF.
    ro_shop_dao = lo_shop_dao.
  ENDMETHOD.


  METHOD save_order.

    CALL FUNCTION 'ZSFE_FM_INSERT_ORDER'
         EXPORTING
                lv_product_id = iv_product_id
                lv_passport = iv_passport
                lv_card_id = iv_card_id.
         IF sy-subrc = 0.
           MESSAGE 'Order Saved' TYPE 'I'. " Commit
         ELSE.
           MESSAGE 'ERROR' TYPE 'W'.
         ENDIF.
  ENDMETHOD.


  METHOD save_product.

 CALL FUNCTION 'ZSFE_FM_INSERT_PRODUCT'
      EXPORTING
                lv_product_id = iv_product_id
                lv_product_type = iv_product_type
                lv_product_brand = iv_product_brand
                lv_product_name = iv_product_name
                lv_product_kaliber = iv_product_kaliber
                lv_product_price = iv_product_price.
      IF sy-subrc = 0.
         MESSAGE 'Product Saved' TYPE 'I'. "Commit
      ELSE.
         MESSAGE 'ERROR' TYPE 'W'.
      ENDIF.
  ENDMETHOD.


  METHOD update_order.
    CALL FUNCTION 'ZSFE_FM_UPDATE_ORDER'
        EXPORTING
                  lv_order_id = iv_order_id
                  lv_product_id = iv_product_id
                  lv_card_id = iv_card_id
                  lv_passport = iv_passport.
        IF sy-subrc = 0.
            MESSAGE 'Order Updated' TYPE 'I'.
        ELSE.
            MESSAGE 'ERROR' TYPE 'W'.
        ENDIF.
  ENDMETHOD.
ENDCLASS.
