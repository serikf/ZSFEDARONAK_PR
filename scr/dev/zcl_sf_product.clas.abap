class ZCL_SF_PRODUCT definition
  public
  create public .

public section.

  data MV_PRODUCT_ID type ZSFE_PRODUCT_ID read-only .
  data MV_PRODUCT_TYPE type ZSFE_PRODUCT_TYPE read-only .
  data MV_PRODUCT_BRAND type ZSFE_PRODUCT_BRAND read-only .
  data MV_PRODUCT_NAME type ZSFE_PRODUCT_NAME read-only .
  data MV_PRODUCT_KALIBER type ZSFE_KALIBER read-only .
  data MV_PRODUCT_PRICE type ZSFE_PRICE read-only .

  methods CONSTRUCTOR
    importing
      !IV_PRODUCT_ID type ZSFE_PRODUCT_ID
      !IV_PRODUCT_TYPE type ZSFE_PRODUCT_TYPE
      !IV_PRODUCT_BRAND type ZSFE_PRODUCT_BRAND
      !IV_PRODUCT_NAME type ZSFE_PRODUCT_NAME
      !IV_PRODUCT_KALIBER type ZSFE_KALIBER
      !IV_PRODUCT_PRICE type ZSFE_PRICE .
protected section.
PRIVATE SECTION.

*  TYPES:
*    BEGIN OF gs_all_products,
*         product_id TYPE zsfe_product_id,
*         product_type TYPE zsfe_product_type,
*         product_brand TYPE zsfe_product_brand,
*         product_name TYPE zsfe_product_name,
*         product_kaliber TYPE zsfe_kaliber,
*         product_price TYPE zsfe_price,
*    END OF gs_all_products .
*  TYPES: gt_all_products TYPE  TABLE OF gs_all_products .
*  TYPES: lt_all_products TYPE TABLE OF gs_all_products WITH DEFAULT KEY .
*
*  DATA mt_all_products TYPE zcl_sf_product=>gt_all_products .
ENDCLASS.



CLASS ZCL_SF_PRODUCT IMPLEMENTATION.


  METHOD constructor.


  ENDMETHOD.
ENDCLASS.
