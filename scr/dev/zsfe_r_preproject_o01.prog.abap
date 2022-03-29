*&---------------------------------------------------------------------*
*& Include          ZSFE_R_PREPROJECT_O01
*&---------------------------------------------------------------------*
*Проверяем раскрывакмость меню
AT SELECTION-SCREEN OUTPUT.

  LOOP AT SCREEN.
    IF screen-group1 = 'GR1' AND p_prod EQ 'X'.
      screen-active = '1'.
      MODIFY SCREEN.
    ELSEIF screen-group1 = 'GR1'.
      screen-active = '0'.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.
  ENDLOOP.

  LOOP AT SCREEN.
    IF screen-group1 = 'GR2' AND p_prod2 EQ 'X'.
      screen-active = '1'.
      MODIFY SCREEN.
    ELSEIF screen-group1 = 'GR2'.
      screen-active = '0'.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.
  ENDLOOP.

  LOOP AT SCREEN.
    IF screen-group1 = 'GR3' AND p_ord EQ 'X'.
      screen-active = '1'.
      MODIFY SCREEN.
    ELSEIF screen-group1 = 'GR3'.
      screen-active = '0'.
      MODIFY SCREEN.
      CONTINUE.
    ENDIF.
  ENDLOOP.
