*&---------------------------------------------------------------------*
*& Report ZSFE_R_PREPROJECT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
*Report ZSFE_R_PREPROJECT.

INCLUDE zsfe_r_preproject_top.
INCLUDE zsfe_r_preproject_sel.
INCLUDE zsfe_r_preproject_o01.
INCLUDE zsfe_r_preproject_f01.
INCLUDE zsfe_r_preproject_f02.
INCLUDE zsfe_r_preproject_f03.
INCLUDE zsfe_r_preproject_f04.
INCLUDE zsfe_r_preproject_f05.
INCLUDE zsfe_r_preproject_f07.
INCLUDE zsfe_r_preproject_i01.


* Итоговый экран после выбора
START-OF-SELECTION.

 SELECT
      op~order_id, op~product_id, pt~product_type,
      pt~product_brand, pt~product_name,
      p~product_kaliber,
      pro~provider_name, p~price,
      ctt~discount, ct~owner_first_name,
      ct~owner_last_name, o~passport

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
      JOIN zsfe_d_provider AS pro
        ON p~provider_id = pro~provider_id
      JOIN zsfe_d_card_type AS ctt
        ON c~card_type_id = ctt~card_type_id

    INTO TABLE @DATA(gt_zsfe_d_all)
    WHERE product_type IN @s_type
      AND product_brand IN @s_brand
      AND product_name IN @s_name
      AND product_kaliber IN @s_kal
      AND provider_name IN @s_pnam
      AND price IN @s_price
      AND discount IN @s_dis
      AND owner_first_name IN @s_ofn
      AND owner_last_name IN @s_oln
      AND passport IN @s_pas
      AND ct~langu = @gv_lang
      AND pt~langu = @gv_lang
      AND op~product_id IN @s_pid
      AND op~order_id IN @s_oid
      ORDER BY op~order_id .

END-OF-SELECTION.

* Вывод на экран
cl_salv_table=>factory( IMPORTING r_salv_table = DATA(go_salv) CHANGING  t_table = gt_zsfe_d_all ).
go_salv->display( ).


* Вызов FM
CALL FUNCTION 'ZSFE_FG_ROWS_FM'
  EXPORTING
    iv_date  = sy-datum.
