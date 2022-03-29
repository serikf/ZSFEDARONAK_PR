*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZSFE_ORDER_PRO
*   generation date: 08.12.2021 at 21:36:32
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZSFE_ORDER_PRO     .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
