CLASS zcl_sf_shop DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

PUBLIC SECTION.

  TYPES: gt_order_id TYPE RANGE OF zsfe_d_order_pro-order_id .
  TYPES: gt_product_id TYPE RANGE OF zsfe_d_order_pro-product_id .
  TYPES: gt_product_type TYPE RANGE OF zsfe_d_product_t-product_type .
  TYPES: gt_product_brand TYPE RANGE OF zsfe_d_product_t-product_brand .
  TYPES: gt_product_name TYPE RANGE OF zsfe_d_product_t-product_name .
  TYPES: gt_product_kaliber TYPE RANGE OF zsfe_d_product-product_kaliber .
  TYPES: gt_product_price TYPE RANGE OF zsfe_d_product-price .
  TYPES: gt_passport TYPE RANGE OF zsfe_d_order-passport .
  TYPES: gt_discount TYPE RANGE OF zsfe_d_card_type-discount .
  TYPES:
    BEGIN OF gs_all_orders,
         order_id TYPE zsfe_order_id,
         product_id TYPE zsfe_product_id,
         product_type TYPE zsfe_product_type,
         product_brand TYPE zsfe_product_brand,
         product_name TYPE zsfe_product_name,
         product_kaliber TYPE zsfe_kaliber,
         product_price TYPE zsfe_price,
         passport TYPE zsfe_passport,
         discount TYPE zsfe_discount,
    END OF gs_all_orders .
  TYPES: gt_all_orders TYPE  TABLE OF gs_all_orders .
  TYPES: lt_all_orders TYPE TABLE OF gs_all_orders WITH DEFAULT KEY .

  DATA mt_all_orders TYPE zcl_sf_shop=>gt_all_orders READ-ONLY .

  METHODS get_all_orders
    IMPORTING
      !ls_order_id TYPE ANY TABLE
      !ls_product_id TYPE ANY TABLE
      !ls_product_type TYPE ANY TABLE
      !ls_product_brand TYPE ANY TABLE
      !ls_product_name TYPE ANY TABLE
      !ls_product_kaliber TYPE ANY TABLE
      !ls_product_price TYPE ANY TABLE
      !ls_passport TYPE ANY TABLE
      !ls_discount TYPE ANY TABLE .
  METHODS constructor .
  METHODS check_order
    IMPORTING
      !iv_order_id TYPE zsfe_order_id
    RAISING
      zcx_sf_shop .
protected section.
private section.
ENDCLASS.



CLASS ZCL_SF_SHOP IMPLEMENTATION.


  METHOD check_order.
* Raise Exception of Order ID
    READ TABLE mt_all_orders ASSIGNING FIELD-SYMBOL(<ls_all_orders>)
      WITH KEY  order_id = iv_order_id.
    IF <ls_all_orders> IS NOT ASSIGNED.
      RAISE EXCEPTION  TYPE zcx_sf_shop.
    ENDIF.
  ENDMETHOD.


  METHOD constructor.
   SELECT op~order_id,
          op~product_id,
          pt~product_type,
          pt~product_brand,
          pt~product_name,
          p~product_kaliber,
          p~price,
          o~passport,
          ctt~discount

     FROM zsfe_d_order_pro AS op
          JOIN zsfe_d_order AS o
          ON op~order_id = o~order_id
          JOIN zsfe_d_product AS p
          ON op~product_id = p~product_id
          JOIN zsfe_d_card AS c
          ON o~card_id = c~card_id
          JOIN zsfe_d_card_t AS ct
          ON c~card_id = ct~card_id
          JOIN zsfe_d_product_t AS pt
          ON p~product_id = pt~product_id
          JOIN zsfe_d_card_type AS ctt
          ON c~card_type_id = ctt~card_type_id
     INTO TABLE @DATA(lt_all_orders).

          mt_all_orders = lt_all_orders.
  ENDMETHOD.


  METHOD get_all_orders.
* Create table of orders
   SELECT op~order_id,
          op~product_id,
          pt~product_type,
          pt~product_brand,
          pt~product_name,
          p~product_kaliber,
          p~price,
          o~passport,
          ctt~discount

     FROM zsfe_d_order_pro AS op
          JOIN zsfe_d_order AS o
          ON op~order_id = o~order_id
          JOIN zsfe_d_product AS p
          ON op~product_id = p~product_id
          JOIN zsfe_d_card AS c
          ON o~card_id = c~card_id
          JOIN zsfe_d_card_t AS ct
          ON c~card_id = ct~card_id
          JOIN zsfe_d_product_t AS pt
          ON p~product_id = pt~product_id
          JOIN zsfe_d_card_type AS ctt
          ON c~card_type_id = ctt~card_type_id
     INTO TABLE @DATA(lt_all_orders)
          BYPASSING BUFFER
    WHERE pt~langu = @sy-langu
      AND ct~langu = @sy-langu
      AND o~order_id IN @ls_order_id
      AND p~product_id IN @ls_product_id
      AND pt~product_type IN @ls_product_type
      AND pt~product_brand IN @ls_product_brand
      AND pt~product_name IN @ls_product_name
      AND p~product_kaliber IN @ls_product_kaliber
      AND p~price IN @ls_product_price
      AND ctt~discount IN @ls_discount
      AND o~passport IN @ls_passport
    ORDER BY op~order_id DESCENDING.


          mt_all_orders = lt_all_orders.

  ENDMETHOD.
ENDCLASS.
