*---------------------------------------------------------------------*
*    program for:   TABLEFRAME_ZSFE_PRODUCT
*   generation date: 08.12.2021 at 22:27:09
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
FUNCTION TABLEFRAME_ZSFE_PRODUCT       .

  PERFORM TABLEFRAME TABLES X_HEADER X_NAMTAB DBA_SELLIST DPL_SELLIST
                            EXCL_CUA_FUNCT
                     USING  CORR_NUMBER VIEW_ACTION VIEW_NAME.

ENDFUNCTION.
