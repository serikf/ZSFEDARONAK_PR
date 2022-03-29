*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_F07
*&---------------------------------------------------------------------*
FORM zsfe_r_order_up.
        IF p_name IS NOT INITIAL.
          UPDATE zsfe_d_order_pro SET product_id = p_p2_id WHERE order_id = p_or_id.
       ENDIF.
       IF p_kal IS NOT INITIAL.
          UPDATE zsfe_d_order SET card_id = p_ca_id WHERE order_id = p_or_id.
        ENDIF.
        IF p_price IS NOT INITIAL.
          UPDATE zsfe_d_order SET passport = p_pass WHERE order_id = p_or_id.
         ENDIF.
ENDFORM.
