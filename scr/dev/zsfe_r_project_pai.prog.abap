*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PROJECT_PAI
*&---------------------------------------------------------------------*

MODULE user_command_0100 INPUT.
  CHECK go_main IS BOUND.
  go_main->mo_view->pai_0100( ).
ENDMODULE.

DATA: lv_lock_res TYPE char1.
DATA: dao TYPE REF TO zcl_sf_shop_dao.
INITIALIZATION.
       DATA(lr_shop) = NEW zcl_sf_shop( ).

AT SELECTION-SCREEN.
* Insert Product
 CASE
    sscrfields-ucomm.
    WHEN 'PBIP'.
      IF    p_pr_id IS INITIAL
        AND p_type IS NOT INITIAL
        AND p_brand IS NOT INITIAL
        AND p_name IS NOT INITIAL
        AND p_kal IS NOT INITIAL
        AND p_price IS NOT INITIAL.

            CALL METHOD zcl_sf_shop_dao=>get_instance
                 RECEIVING
                          ro_shop_dao = dao.
            CALL METHOD dao->save_product( iv_product_type = p_type
                                           iv_product_id = p_pr_id
                                           iv_product_brand = p_brand
                                           iv_product_kaliber = p_kal
                                           iv_product_name = p_name
                                           iv_product_price = p_price ).
       ELSE.
             MESSAGE 'Fill in the required fields'(002) TYPE 'I'.
       ENDIF.
   ENDCASE.
*Delete Product
  CASE
       sscrfields-ucomm.
    WHEN 'PBDP'.
        IF p_pr_id IS NOT INITIAL.

              CALL METHOD zcl_sf_shop_dao=>get_instance
                   RECEIVING
                          ro_shop_dao = dao.
              CALL METHOD dao->delete_product( iv_product_id = p_pr_id ).
        ELSE.
              MESSAGE 'Enter Product ID'(006) TYPE 'I'.
        ENDIF.
   ENDCASE.
*Insert Order
  CASE
      sscrfields-ucomm.
    WHEN 'PBIO'.
        IF   p_p2_id IS INITIAL
          OR p_pass  IS INITIAL
          OR p_ca_id IS INITIAL.
          MESSAGE 'Fill in the required fields'(002) TYPE 'I'.
          ELSE.
                CALL METHOD zcl_sf_shop_dao=>get_instance
                     RECEIVING
                            ro_shop_dao = dao.
                CALL METHOD dao->save_order( iv_passport = p_pass
                                         iv_product_id = p_p2_id
                                         iv_card_id = p_ca_id ).
          ENDIF.
   ENDCASE.
*Delete Order
  CASE
        sscrfields-ucomm.
    WHEN 'PBDO'.
        IF p_or_id IS NOT INITIAL.
          TRY.  " Raise Exception
            lr_shop->check_order( iv_order_id = p_or_id ).
          CATCH  zcx_sf_shop.
              MESSAGE 'Order ID is missed'(016) TYPE 'E'.
          ENDTRY.
                CALL METHOD zcl_sf_shop_dao=>get_instance
                     RECEIVING
                          ro_shop_dao = dao.
                CALL METHOD dao->delete_order( iv_order_id = p_or_id ).
        ELSE.
           MESSAGE 'Enter Order ID'(005) TYPE 'I'.
        ENDIF.
   ENDCASE.
*Update Order
   CASE
      sscrfields-ucomm.
    WHEN 'PBUO'.
          IF p_or_id IS INITIAL.
            MESSAGE 'Enter Order ID'(002) TYPE 'I'.
          ELSE.
              PERFORM set_locks USING lv_lock_res.
                    IF lv_lock_res <> 'S'.
                      LEAVE TO SCREEN 0.
                    ENDIF.

                CALL METHOD zcl_sf_shop_dao=>get_instance
                     RECEIVING
                          ro_shop_dao = dao.
                CALL METHOD dao->update_order( iv_order_id = p_or_id
                                               iv_passport = p_pass
                                               iv_card_id = p_ca_id
                                               iv_product_id = p_p2_id ).
            ENDIF.
     ENDCASE.
* Lock
   FORM set_locks USING pv_lock_res TYPE char1 .
  CALL FUNCTION 'ENQUEUE_EZSFE_D_ORDER'
    EXPORTING
      mode_zsfe_d_order = 'S'
      mandt               = sy-mandt
      order_id            = p_or_id
      x_order_id          = ' '
      _scope              = '2'
      _wait               = ' '
      _collect            = ' '
    EXCEPTIONS
      foreign_lock        = 1
      system_failure      = 2
      OTHERS              = 3.
  CASE sy-subrc.
    WHEN 0.
      MESSAGE  'Enqueue successful'(017) TYPE 'I'.
      pv_lock_res = 'S'.
    WHEN 1.
      DATA(text) = sy-msgv1.
      MESSAGE 'Record already locked '(018) TYPE 'I'.
    WHEN OTHERS.
      MESSAGE  'Error in enqueue!'(019) TYPE 'I'.

  ENDCASE.
ENDFORM.
