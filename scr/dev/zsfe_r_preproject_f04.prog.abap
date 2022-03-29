*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_F04
*&---------------------------------------------------------------------*
FORM zsfe_r_product_up.
   IF p_pr_id IS NOT INITIAL.
     UPDATE zsfe_d_product SET provider_id = p_p_id WHERE product_id = p_pr_id.
   ENDIF.
   IF p_type IS NOT INITIAL.
     UPDATE zsfe_d_product_t SET product_type = p_type WHERE product_id = p_pr_id.
   ENDIF.
   IF p_brand IS NOT INITIAL.
     UPDATE zsfe_d_product_t SET product_brand = p_brand WHERE product_id = p_pr_id.
   ENDIF.
   IF p_name IS NOT INITIAL.
     UPDATE zsfe_d_product_t SET product_name = p_name WHERE product_id = p_pr_id.
   ENDIF.
   IF p_kal IS NOT INITIAL.
     UPDATE zsfe_d_product SET product_kaliber = p_kal WHERE product_id = p_pr_id.
   ENDIF.
   IF p_price IS NOT INITIAL.
     UPDATE zsfe_d_product SET price = p_price WHERE product_id = p_pr_id.
   ENDIF.

ENDFORM.
