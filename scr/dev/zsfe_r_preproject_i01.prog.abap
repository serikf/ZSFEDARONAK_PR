*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_I01
*&---------------------------------------------------------------------*
AT SELECTION-SCREEN.

*кнопки для Show 5 последних записей
  CASE
    sscrfields-ucomm.
    WHEN 'PBSP'.
      PERFORM zsfe_r_report.
    WHEN 'PBSO'.
      PERFORM zsfe_r_report2.
  ENDCASE.

* Кнопки для вью
 CASE
    sscrfields-ucomm.
    WHEN 'PBPM'.
      CALL TRANSACTION 'ZSFE_PRODUCT_MAINT'.
    WHEN 'PBOM'.
      CALL TRANSACTION 'ZSFE_CARD_MAINT'.
  ENDCASE.

*Кнопки товара
  CASE
    sscrfields-ucomm.
    WHEN 'PBIP'.
      IF p_pr_id IS INITIAL.
        PERFORM zsfe_r_product_ins.
          IF sy-subrc = 0.
             MESSAGE 'The product has been inserted'(022) TYPE 'I'.
           ENDIF.
      ELSE.
        MESSAGE 'ID field must be empty'(007) TYPE 'I'.
      ENDIF.

   ENDCASE.

  CASE
    sscrfields-ucomm.
    WHEN 'PBUP'.
      IF p_pr_id IS NOT INITIAL.
        PERFORM zsfe_r_product_up.
          IF sy-subrc = 0.
            MESSAGE 'The product has been updated'(023) TYPE 'I'.
          ENDIF.
      ELSE.
        MESSAGE 'ID field cant be empty'(008) TYPE 'I'.
      ENDIF.
   ENDCASE.

  CASE
    sscrfields-ucomm.
    WHEN 'PBDP'.
      DELETE FROM zsfe_d_product WHERE product_id = p_pr_id.
      DELETE FROM zsfe_d_product_t WHERE product_id = p_pr_id.
        IF sy-subrc = 0.
          MESSAGE 'The product has been deleted'(018) TYPE 'I'.
        ENDIF.
   ENDCASE.


* Кнопки заказа
CASE
    sscrfields-ucomm.
    WHEN 'PBIO'.
      IF gv_ord = '1'.
           IF p_or_id IS INITIAL AND p_op_id IS INITIAL.
               IF p_pass IS NOT INITIAL.
                 PERFORM zsfe_r_order_ins.
                  IF sy-subrc = 0.
                     MESSAGE 'The order has been inserted'(025) TYPE 'I'.
                   ENDIF.
                ELSE.
                  MESSAGE 'Enter Passport number'(031) TYPE 'I'.
                ENDIF.
           ELSE.
             MESSAGE 'OrderID-fields must be empty'(028) TYPE 'I'.
           ENDIF.
      ELSE.
            IF p_or_id IS  INITIAL AND p_op_id IS INITIAL.
                MESSAGE 'Enter OrderID, Order-ProdID must be empty'(020) TYPE 'I'.
             ELSE.
                PERFORM zsfe_r_order_ins.
                IF sy-subrc = 0.
                     MESSAGE 'The product was added to order'(029) TYPE 'I'.
                   ENDIF.
             ENDIF.
      ENDIF.

 ENDCASE.


   CASE
    sscrfields-ucomm.
    WHEN 'PBUO'.
      IF p_or_id IS INITIAL.
          PERFORM zsfe_r_order_up.
              IF sy-subrc = 0.
                  MESSAGE 'The order was updated'(030) TYPE 'I'.
               ENDIF.
      ELSE.
          MESSAGE 'Enter OrderID' TYPE 'I'.
      ENDIF.
   ENDCASE.

   CASE
    sscrfields-ucomm.
    WHEN 'PBDO'.
      DELETE FROM zsfe_d_order_pro WHERE order_id = p_or_id.
      DELETE FROM zsfe_d_order WHERE order_id = p_or_id.
        IF sy-subrc = 0.
          MESSAGE 'The order has been deleted'(021) TYPE 'I'.
        ENDIF.
   ENDCASE.
