*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PROJECT_CLD
*&---------------------------------------------------------------------*

CLASS lcl_main DEFINITION FINAL.
  PUBLIC SECTION.
    CLASS-METHODS:
      start_of_selection,
      end_of_selection.

    DATA: mo_view   TYPE REF TO lcl_view,
          mt_outtab TYPE TABLE OF zsfe_s_orders_alv.

  PRIVATE SECTION.
    METHODS:
      get_data,
      show_data.
 ENDCLASS.

CLASS lcl_view DEFINITION FINAL.
  PUBLIC SECTION.
    METHODS:
      pbo_0100,
      pai_0100,
      refresh_alv.

   PRIVATE SECTION.
    METHODS:
       prepare_fcat,
       prepare_layout.
    CONSTANTS:
            mc_cont_name TYPE scrfname VALUE 'ALV_CONT',
            mc_struc_name TYPE typename VALUE 'ZSFE_S_ORDERS_ALV',
            mc_s_stable TYPE lvc_s_stbl VALUE 'XX'.

      DATA:
            mo_controller TYPE REF TO lcl_controller,
            mo_container TYPE REF TO cl_gui_custom_container,
            mo_grid TYPE REF TO cl_gui_alv_grid.


      DATA: mt_fcat TYPE lvc_t_fcat,
            mt_excluding  TYPE ui_functions,
            ms_layout TYPE lvc_s_layo,
            ms_variant TYPE disvariant.

ENDCLASS.

CLASS lcl_controller DEFINITION FINAL.
  PUBLIC SECTION.
    METHODS:
            handle_toolbar FOR EVENT toolbar OF cl_gui_alv_grid
             IMPORTING e_object,

            handle_double_click FOR EVENT double_click OF cl_gui_alv_grid
             IMPORTING e_row e_column,

            handle_data_changed_finished FOR EVENT data_changed_finished OF cl_gui_alv_grid
               IMPORTING e_modified et_good_cells,

            handle_user_command FOR EVENT user_command OF cl_gui_alv_grid
                 IMPORTING e_ucomm,

            handle_hotspot_click FOR EVENT hotspot_click OF cl_gui_alv_grid
              IMPORTING es_row_no e_column_id.

ENDCLASS.
