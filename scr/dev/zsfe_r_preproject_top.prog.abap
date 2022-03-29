*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_TOP
*&---------------------------------------------------------------------*

Report ZSFE_R_PREPROJECT.

TABLES: zsfe_d_card,
        zsfe_d_card_t,
        zsfe_d_card_type,
        zsfe_d_order,
        zsfe_d_order_pro,
        zsfe_d_product,
        zsfe_d_product_t,
        zsfe_d_provider,
        sscrfields.

 DATA:  gs_product TYPE zsfe_d_product,
        gs_product_t TYPE zsfe_d_product_t,
        gs_order TYPE zsfe_d_order,
        gs_order_pro TYPE zsfe_d_order_pro,
        gt_zsfe_d_product TYPE zsfe_d_product OCCURS 0,
        gt_zsfe_d_product_t TYPE zsfe_d_product_t OCCURS 0.
