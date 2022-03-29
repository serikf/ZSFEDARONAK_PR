*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_F02
*&---------------------------------------------------------------------*

* Послелние 5 строк

FORM zsfe_r_report2 .

SELECT
      pt~langu, op~order_id, op~product_id, pt~product_type,
      pt~product_brand, pt~product_name,
      p~product_kaliber,p~price,ctt~discount,
      pro~provider_name,
      ct~owner_first_name,
      ct~owner_last_name,
      o~passport

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

   INTO TABLE @DATA(gt_order)
    UP TO 5 ROWS
    WHERE pt~langu = @sy-langu
      AND ct~langu = @sy-langu
    ORDER BY o~order_id DESCENDING.

  cl_salv_table=>factory( IMPORTING r_salv_table = DATA(go_salv) CHANGING  t_table = gt_order ).
go_salv->display( ).

ENDFORM.
