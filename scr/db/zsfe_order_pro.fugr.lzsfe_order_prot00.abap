*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 09.02.2022 at 02:39:08
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZSFE_D_ORDER_PRO................................*
DATA:  BEGIN OF STATUS_ZSFE_D_ORDER_PRO              .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSFE_D_ORDER_PRO              .
CONTROLS: TCTRL_ZSFE_D_ORDER_PRO
            TYPE TABLEVIEW USING SCREEN '0001'.
*...processing: ZSFE_V_ORDER_PRO................................*
TABLES: ZSFE_V_ORDER_PRO, *ZSFE_V_ORDER_PRO. "view work areas
CONTROLS: TCTRL_ZSFE_V_ORDER_PRO
TYPE TABLEVIEW USING SCREEN '0002'.
DATA: BEGIN OF STATUS_ZSFE_V_ORDER_PRO. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZSFE_V_ORDER_PRO.
* Table for entries selected to show on screen
DATA: BEGIN OF ZSFE_V_ORDER_PRO_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZSFE_V_ORDER_PRO.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZSFE_V_ORDER_PRO_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZSFE_V_ORDER_PRO_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZSFE_V_ORDER_PRO.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZSFE_V_ORDER_PRO_TOTAL.

*.........table declarations:.................................*
TABLES: *ZSFE_D_ORDER_PRO              .
TABLES: ZSFE_D_ORDER                   .
TABLES: ZSFE_D_ORDER_PRO               .
TABLES: ZSFE_D_PRODUCT                 .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
