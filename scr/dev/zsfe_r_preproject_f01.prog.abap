*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_F01
*&---------------------------------------------------------------------*
FORM zsfe_r_report .
SELECT  p~product_id, pt~product_type, pt~product_brand,
        pt~product_name, p~product_kaliber, p~price, pr~provider_name

    FROM zsfe_d_product AS p
    JOIN zsfe_d_product_t AS pt
      ON p~product_id = pt~product_id
    JOIN zsfe_d_provider AS pr
      ON p~provider_id  = pr~provider_id

  INTO TABLE @DATA(gt_product_r)
  UP TO 5 ROWS
    WHERE langu = @sy-langu
    ORDER BY p~product_id DESCENDING.


  cl_salv_table=>factory( IMPORTING r_salv_table = DATA(go_salv) CHANGING  t_table = gt_product_r ).
go_salv->display( ).

ENDFORM.
