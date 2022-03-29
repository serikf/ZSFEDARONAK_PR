*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PROJECT_SCR
*&---------------------------------------------------------------------*
*Selest orders
PARAMETERS: p_prod AS CHECKBOX USER-COMMAND prod.

SELECTION-SCREEN BEGIN OF BLOCK prod WITH FRAME TITLE TEXT-010.
SELECT-OPTIONS:
    s_oid FOR zsfe_d_order-order_id MODIF ID gr1,
    s_pid FOR zsfe_d_product-product_id MODIF ID gr1,
    s_type FOR zsfe_d_product_t-product_type MODIF ID gr1,
    s_brand FOR zsfe_d_product_t-product_brand MODIF ID gr1,
    s_name FOR zsfe_d_product_t-product_name MODIF ID gr1,
    s_kal FOR zsfe_d_product-product_kaliber MODIF ID gr1,
    s_price FOR zsfe_d_product-price MODIF ID gr1,
    s_dis FOR zsfe_d_card_type-discount MODIF ID gr1,
    s_pas FOR zsfe_d_order-passport MODIF ID gr1.
SELECTION-SCREEN END OF BLOCK prod.

* Product management
PARAMETERS: p_prod2 AS CHECKBOX USER-COMMAND prod2.

SELECTION-SCREEN BEGIN OF BLOCK prod2 WITH FRAME TITLE TEXT-011.
  SELECTION-SCREEN PUSHBUTTON 5(10) pbip USER-COMMAND pbip MODIF ID gr2.
  SELECTION-SCREEN PUSHBUTTON 35(10) pbdp USER-COMMAND pbdp MODIF ID gr2.
    PARAMETERS:
      p_pr_id TYPE zsfe_d_product-product_id MODIF ID gr2,
      p_price TYPE zsfe_price MODIF ID gr2,
      p_kal TYPE zsfe_d_product-product_kaliber MODIF ID gr2,
      p_type TYPE zsfe_d_product_t-product_type MODIF ID gr2,
      p_brand TYPE zsfe_d_product_t-product_brand MODIF ID gr2,
      p_name TYPE zsfe_d_product_t-product_name MODIF ID gr2.
SELECTION-SCREEN END OF BLOCK prod2.

INITIALIZATION.
  pbip = 'Insert'(001).
INITIALIZATION.
  pbdp = 'Delete'(003).

* Orders management
PARAMETERS: p_ord AS CHECKBOX USER-COMMAND ord.

SELECTION-SCREEN BEGIN OF BLOCK ord WITH FRAME TITLE TEXT-012.
  SELECTION-SCREEN PUSHBUTTON 5(10) pbio USER-COMMAND pbio MODIF ID gr3.
  SELECTION-SCREEN PUSHBUTTON 20(10) pbuo USER-COMMAND pbuo MODIF ID gr3.
  SELECTION-SCREEN PUSHBUTTON 35(10) pbdo USER-COMMAND pbdo MODIF ID gr3.
  PARAMETERS:
      p_or_id TYPE zsfe_d_order-order_id MODIF ID gr3,
      p_p2_id TYPE zsfe_d_product-product_id MODIF ID gr3,
      p_ca_id TYPE zsfe_d_card-card_id MODIF ID gr3,
      p_pass TYPE zsfe_d_order-passport MODIF ID gr3.
SELECTION-SCREEN END OF BLOCK ord.

INITIALIZATION.
  pbio = 'Insert'(001).
INITIALIZATION.
  pbuo = 'Update'(007).
INITIALIZATION.
  pbdo = 'Delete'(003).
