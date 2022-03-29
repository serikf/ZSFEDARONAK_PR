*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 09.12.2021 at 11:05:47
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZSFE_D_PRODUCT..................................*
DATA:  BEGIN OF STATUS_ZSFE_D_PRODUCT                .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSFE_D_PRODUCT                .
CONTROLS: TCTRL_ZSFE_D_PRODUCT
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZSFE_V_PRODUCT..................................*
TABLES: ZSFE_V_PRODUCT, *ZSFE_V_PRODUCT. "view work areas
CONTROLS: TCTRL_ZSFE_V_PRODUCT
TYPE TABLEVIEW USING SCREEN '0002'.
DATA: BEGIN OF STATUS_ZSFE_V_PRODUCT. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZSFE_V_PRODUCT.
* Table for entries selected to show on screen
DATA: BEGIN OF ZSFE_V_PRODUCT_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZSFE_V_PRODUCT.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZSFE_V_PRODUCT_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZSFE_V_PRODUCT_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZSFE_V_PRODUCT.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZSFE_V_PRODUCT_TOTAL.

*.........table declarations:.................................*
TABLES: *ZSFE_D_PRODUCT                .
TABLES: *ZSFE_D_PRODUCT_T              .
TABLES: ZSFE_D_PRODUCT                 .
TABLES: ZSFE_D_PRODUCT_T               .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
