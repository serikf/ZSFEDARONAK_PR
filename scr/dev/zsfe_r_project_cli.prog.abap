*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PROJECT_CLI
*&---------------------------------------------------------------------*

CLASS lcl_main IMPLEMENTATION.
  METHOD start_of_selection.

    IF go_main IS NOT BOUND.
      go_main = NEW #( ).
    ENDIF.

    go_main->get_data( ).
  ENDMETHOD.

  METHOD end_of_selection.
    CHECK go_main IS BOUND.

    IF go_main->mt_outtab IS NOT INITIAL.
      go_main->show_data( ).
    ELSE.
      MESSAGE 'No data'(008) TYPE 'S' DISPLAY LIKE 'E'.
      LEAVE LIST-PROCESSING.
    ENDIF.
  ENDMETHOD.

  METHOD get_data.
   DATA: ls_outtab LIKE LINE OF mt_outtab.
   DATA(contr) = NEW zcl_sf_controller( ).
    CLEAR mt_outtab.
* Select orders for ALV
    CALL METHOD contr->get_object.
    CALL METHOD contr->lo_all_orders->get_all_orders(
                ls_order_id = s_oid[]
                ls_product_id = s_pid[]
                ls_product_type = s_type[]
                ls_product_brand = s_brand[]
                ls_product_name = s_name[]
                ls_product_kaliber = s_kal[]
                ls_product_price = s_price[]
                ls_discount = s_dis[]
                ls_passport = s_pas[] ).

  DATA(lt_all_orders) = contr->lo_all_orders->mt_all_orders.
    IF sy-subrc = 0.
  LOOP AT lt_all_orders ASSIGNING FIELD-SYMBOL(<ls_all_orders>).
        ls_outtab = CORRESPONDING #( <ls_all_orders> ).
        CASE ls_outtab-discount.
          WHEN 0.
            APPEND VALUE lvc_s_scol( fname = 'DISCOUNT'
                                     color-col = 6 ) TO ls_outtab-color_tab.
        ENDCASE.
        APPEND ls_outtab TO mt_outtab.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.

  METHOD show_data.
    IF mo_view IS NOT BOUND.
      mo_view = NEW #( ).
    ENDIF.
    CALL SCREEN 0100.
  ENDMETHOD.
  ENDCLASS.

CLASS lcl_view IMPLEMENTATION.
  METHOD pbo_0100.
    SET PF-STATUS '0100'.
    SET TITLEBAR '0100'.
  IF mo_grid IS NOT BOUND.
         CREATE OBJECT mo_container
           EXPORTING container_name = mc_cont_name
           EXCEPTIONS cntl_error = 1
                      cntl_system_error = 2
                      create_error = 3
                      lifetime_error = 4
                      lifetime_dynpro_dynpro_link = 5
                      OTHERS = 6.
         IF sy-subrc <> 0.
            MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
         ENDIF.
*      * Initializing GRID object
          CREATE OBJECT mo_grid
            EXPORTING i_parent = mo_container
            EXCEPTIONS error_cntl_create = 1
                       error_cntl_init = 2
                       error_cntl_link = 3
                       error_dp_create = 4
                       OTHERS = 5.
          IF sy-subrc <> 0.
             MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
             WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
          ENDIF.

    prepare_fcat( ).
    prepare_layout( ).

    ms_variant-report   = sy-cprog.
    ms_variant-handle   = sy-dynnr.
    ms_variant-username = sy-uname.

            CREATE OBJECT mo_controller.
            SET HANDLER:  mo_controller->handle_double_click FOR mo_grid,
                          mo_controller->handle_toolbar FOR mo_grid,
                          mo_controller->handle_user_command FOR mo_grid,
                          mo_controller->handle_hotspot_click FOR mo_grid,
                          mo_controller->handle_data_changed_finished FOR mo_grid.

    CALL METHOD mo_grid->set_table_for_first_display
            EXPORTING
              is_variant                    = ms_variant
          i_save                        = 'A'
          i_default                     = 'X'
          is_layout                     = ms_layout
          it_toolbar_excluding          = mt_excluding

            CHANGING
              it_outtab                     = go_main->mt_outtab
          it_fieldcatalog               = mt_fcat

             EXCEPTIONS invalid_parameter_combination = 1
                        program_error = 2
                        too_many_lines = 3
                        OTHERS = 4.
          IF sy-subrc <> 0.
             MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
             WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
          ENDIF.
   ELSE.
      CALL METHOD mo_grid->refresh_table_display
              EXPORTING is_stable = mc_s_stable
              EXCEPTIONS finished = 1
                         OTHERS = 2.
           IF sy-subrc <> 0.
              MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
           ENDIF.
    ENDIF.
  ENDMETHOD.                                                "pbo_0100

  METHOD pai_0100.
     mo_grid->check_changed_data( ).
    CASE gv_0100_ucomm.
      WHEN gc_ucomm-back OR gc_ucomm-cancel.
        LEAVE TO SCREEN 0.
      WHEN gc_ucomm-exit.
        LEAVE PROGRAM.
    ENDCASE.
  ENDMETHOD.

 METHOD prepare_fcat.
  CALL FUNCTION 'LVC_FIELDCATALOG_MERGE'
  EXPORTING i_structure_name = mc_struc_name
            i_bypassing_buffer = abap_true
    CHANGING
      ct_fieldcat = mt_fcat
    EXCEPTIONS   ##FM_SUBRC_OK
        inconsistent_interface = 1
        program_error = 2
        OTHERS = 3.

  LOOP AT mt_fcat ASSIGNING FIELD-SYMBOL(<ls_fcat>).
        CASE <ls_fcat>-fieldname.
          WHEN 'ORDER_ID'.
            <ls_fcat>-key = abap_true.
          WHEN 'PRODUCT_PRICE'.
            <ls_fcat>-emphasize = 'C400'.
          WHEN 'PRODUCT_ID'.
            <ls_fcat>-hotspot = abap_true.
          WHEN 'PRODUCT_NAME'.
            <ls_fcat>-emphasize = 'C300'.
         ENDCASE.
  ENDLOOP.
 ENDMETHOD.

  METHOD prepare_layout.
         ms_layout-grid_title = 'ORDERS'.
         ms_layout-cwidth_opt = abap_true.
         ms_layout-ctab_fname = 'COLOR_TAB'.
         ms_layout-sel_mode   = 'D'.
         ms_layout-edit = abap_true.
  ENDMETHOD.
                                                 "pai_0100

  METHOD refresh_alv.
    CALL METHOD mo_grid->refresh_table_display
      EXPORTING
        is_stable = mc_s_stable
      EXCEPTIONS
        finished  = 1
        OTHERS    = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
  ENDMETHOD.

ENDCLASS.

CLASS lcl_controller IMPLEMENTATION.
  METHOD handle_double_click.
*   In case of clicking on the total/subtotal line
    CHECK e_row-rowtype IS INITIAL.

    READ TABLE go_main->mt_outtab ASSIGNING FIELD-SYMBOL(<ls_outtab>) INDEX e_row-index. "Index of the row
    CHECK sy-subrc = 0.

    IF e_column-fieldname = 'ORDER_ID'.
      SELECT SINGLE o~order_id
        FROM zsfe_d_order AS o
        INTO @DATA(ls_order)
       WHERE order_id = @<ls_outtab>-order_id.
      IF sy-subrc = 0.
        CALL FUNCTION 'ISM_POPUP_SHOW_DATA'
          EXPORTING
            struc_name = 'ZSFE_D_PRODUCT'
            struc_data = ls_order.
      ENDIF.
    ENDIF.
  ENDMETHOD.                    "handle_double_click
  METHOD handle_hotspot_click.
*   In case of clicking on the total/subtotal line
    CHECK es_row_no-row_id IS NOT INITIAL.

    READ TABLE go_main->mt_outtab ASSIGNING FIELD-SYMBOL(<ls_outtab>) INDEX es_row_no-row_id. "Index of the row
    CHECK sy-subrc = 0.

    SELECT SINGLE p~product_id
      FROM zsfe_d_product AS p
      INTO @DATA(ls_product)
     WHERE product_id = @<ls_outtab>-product_id.
    IF sy-subrc = 0.
      CALL FUNCTION 'ISM_POPUP_SHOW_DATA'
        EXPORTING
          struc_name = 'ZSFE_D_PRODUCT'
          struc_data = ls_product.
    ENDIF.
  ENDMETHOD.
  METHOD handle_toolbar.
*   Adding separator
    APPEND VALUE #( butn_type = 3 ) TO e_object->mt_toolbar.

*   Adding button
    APPEND VALUE #( function  = gc_ucomm-button
                    icon      = icon_flight
                    text      = TEXT-t01
                    quickinfo = TEXT-t01 ) TO e_object->mt_toolbar.
  ENDMETHOD.                    "handle_toolbar
    METHOD handle_user_command.
    CASE e_ucomm.
      WHEN gc_ucomm-button.
        CALL FUNCTION 'POPUP_TO_INFORM'
          EXPORTING
            titel = 'Just a button'                 ##NO_TEXT
            txt1  = 'You can press'(014)
            txt2  = 'but it dosnt work'(015).
    ENDCASE.
  ENDMETHOD.                    "handle_user_command

   METHOD handle_data_changed_finished.
    IF e_modified = abap_true.
      go_main->mo_view->refresh_alv( ).
    ENDIF.
  ENDMETHOD.

ENDCLASS.
