*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_SEL
*&---------------------------------------------------------------------*

* * Отчеты
*PARAMETERS: p_prod AS CHECKBOX USER-COMMAND prod.
*
*SELECTION-SCREEN BEGIN OF BLOCK prod WITH FRAME TITLE text-010.
*  PARAMETERS p_en RADIOBUTTON GROUP gr1 DEFAULT 'X' MODIF ID gr1.
*  PARAMETERS p_ru RADIOBUTTON GROUP gr1 MODIF ID gr1.
*
*
*SELECT-OPTIONS:
*    s_oid FOR zsfe_d_order-order_id MODIF ID gr1,
*    s_pid FOR zsfe_d_product-product_id MODIF ID gr1,
*    s_type FOR zsfe_d_product_t-product_type MODIF ID gr1,
*    s_brand FOR zsfe_d_product_t-product_brand MODIF ID gr1,
*    s_name FOR zsfe_d_product_t-product_name MODIF ID gr1,
*    s_kal FOR zsfe_d_product-product_kaliber MODIF ID gr1,
*    s_pnam FOR zsfe_d_provider-provider_name MODIF ID gr1,
*    s_price FOR zsfe_d_product-price MODIF ID gr1,
*    s_dis FOR zsfe_d_card_type-discount MODIF ID gr1,
*    s_ofn FOR zsfe_d_card_t-owner_first_name MODIF ID gr1,
*    s_oln FOR zsfe_d_card_t-owner_last_name MODIF ID gr1,
*    s_pas FOR zsfe_d_order-passport MODIF ID gr1.
*
**   считываем язык
*  IF p_en = 'X'.
*     DATA(gv_lang) = 'E'.
*    ELSE.
*     gv_lang = 'R'.
*  ENDIF.
*
*SELECTION-SCREEN END OF BLOCK prod.

*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_SEL
*&---------------------------------------------------------------------*

* * Отчеты
PARAMETERS: p_prod AS CHECKBOX USER-COMMAND prod.

SELECTION-SCREEN BEGIN OF BLOCK prod WITH FRAME TITLE text-010.
  PARAMETERS p_en RADIOBUTTON GROUP gr1 DEFAULT 'X' MODIF ID gr1.
  PARAMETERS p_ru RADIOBUTTON GROUP gr1 MODIF ID gr1.


SELECT-OPTIONS:
    s_oid FOR zsfe_d_order-order_id MODIF ID gr1,
    s_pid FOR zsfe_d_product-product_id MODIF ID gr1,
    s_type FOR zsfe_d_product_t-product_type MODIF ID gr1,
    s_brand FOR zsfe_d_product_t-product_brand MODIF ID gr1,
    s_name FOR zsfe_d_product_t-product_name MODIF ID gr1,
    s_kal FOR zsfe_d_product-product_kaliber MODIF ID gr1,
    s_pnam FOR zsfe_d_provider-provider_name MODIF ID gr1,
    s_price FOR zsfe_d_product-price MODIF ID gr1,
    s_dis FOR zsfe_d_card_type-discount MODIF ID gr1,
    s_ofn FOR zsfe_d_card_t-owner_first_name MODIF ID gr1,
    s_oln FOR zsfe_d_card_t-owner_last_name MODIF ID gr1,
    s_pas FOR zsfe_d_order-passport MODIF ID gr1.

*   считываем язык
  IF p_en = 'X'.
     DATA(gv_lang) = 'E'.
    ELSE.
     gv_lang = 'R'.
  ENDIF.

SELECTION-SCREEN END OF BLOCK prod.

* Управление товаром
PARAMETERS: p_prod2 AS CHECKBOX USER-COMMAND prod2.


SELECTION-SCREEN BEGIN OF BLOCK prod2 WITH FRAME TITLE text-011.
  SELECTION-SCREEN PUSHBUTTON 5(10) pbip USER-COMMAND pbip MODIF ID gr2.
  SELECTION-SCREEN PUSHBUTTON 20(10) pbup USER-COMMAND pbup MODIF ID gr2.
  SELECTION-SCREEN PUSHBUTTON 35(10) pbdp USER-COMMAND pbdp MODIF ID gr2.
  SELECTION-SCREEN PUSHBUTTON 50(10) pbsp USER-COMMAND pbsp MODIF ID gr2.
    PARAMETERS:
      p_pr_id TYPE zsfe_d_product-product_id MODIF ID gr2,
      p_p_id TYPE zsfe_d_product-provider_id MODIF ID gr2,
      p_price TYPE zsfe_price MODIF ID gr2,
      p_kal TYPE zsfe_d_product-product_kaliber MODIF ID gr2,
      p_type TYPE zsfe_d_product_t-product_type MODIF ID gr2,
      p_brand TYPE zsfe_d_product_t-product_brand MODIF ID gr2,
      p_name TYPE zsfe_d_product_t-product_name MODIF ID gr2.

SELECTION-SCREEN END OF BLOCK prod2.

INITIALIZATION.
  pbip = 'Insert'(001).
INITIALIZATION.
  pbup = 'Update'(002).
INITIALIZATION.
  pbdp = 'Delete'(003).
INITIALIZATION.
 pbsp = 'Show'(004).


* Управление заказами
PARAMETERS: p_ord AS CHECKBOX USER-COMMAND ord.

SELECTION-SCREEN BEGIN OF BLOCK ord WITH FRAME TITLE text-012.
  SELECTION-SCREEN PUSHBUTTON 5(10) pbio USER-COMMAND pbio MODIF ID gr3.
  SELECTION-SCREEN PUSHBUTTON 20(10) pbuo USER-COMMAND pbuo MODIF ID gr3.
  SELECTION-SCREEN PUSHBUTTON 35(10) pbdo USER-COMMAND pbdo MODIF ID gr3.
  SELECTION-SCREEN PUSHBUTTON 50(10) pbso USER-COMMAND pbso MODIF ID gr3.
  PARAMETERS:
      p_op_id TYPE zsfe_d_order_pro-order_pro_id MODIF ID gr3,
      p_or_id TYPE zsfe_d_order-order_id MODIF ID gr3,
      p_p2_id TYPE zsfe_d_product-product_id MODIF ID gr3,
      p_ca_id TYPE zsfe_d_card-card_id MODIF ID gr3,
      p_pass TYPE zsfe_d_order-passport MODIF ID gr3.

      PARAMETERS  p_new RADIOBUTTON GROUP gr3 DEFAULT 'X' MODIF ID gr3.
      PARAMETERS  p_old RADIOBUTTON GROUP gr3 MODIF ID gr3.

  IF   p_new = 'X'.
       DATA(gv_ord) = '1'.
    ELSE.
       gv_ord = '2'.
  ENDIF.

SELECTION-SCREEN END OF BLOCK ord.

INITIALIZATION.
  pbio = 'Insert'(001).
INITIALIZATION.
  pbuo = 'Update'(002).
INITIALIZATION.
  pbdo = 'Delete'(003).
  INITIALIZATION.
 pbso = 'Show'(004).


SELECTION-SCREEN PUSHBUTTON 5(30) pbpm USER-COMMAND pbpm.
  INITIALIZATION.
  pbpm = 'Products Maint'(005).

SELECTION-SCREEN PUSHBUTTON 45(30) pbom USER-COMMAND pbom.
  INITIALIZATION.
  pbom = 'Card Maint'(024).
