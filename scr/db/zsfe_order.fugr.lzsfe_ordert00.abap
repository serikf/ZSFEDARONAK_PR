*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 09.02.2022 at 03:56:45
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZSFE_D_ORDER....................................*
DATA:  BEGIN OF STATUS_ZSFE_D_ORDER                  .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSFE_D_ORDER                  .
CONTROLS: TCTRL_ZSFE_D_ORDER
            TYPE TABLEVIEW USING SCREEN '0005'.
*...processing: ZSFE_V_ORDER....................................*
TABLES: ZSFE_V_ORDER, *ZSFE_V_ORDER. "view work areas
CONTROLS: TCTRL_ZSFE_V_ORDER
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZSFE_V_ORDER. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZSFE_V_ORDER.
* Table for entries selected to show on screen
DATA: BEGIN OF ZSFE_V_ORDER_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZSFE_V_ORDER.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZSFE_V_ORDER_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZSFE_V_ORDER_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZSFE_V_ORDER.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZSFE_V_ORDER_TOTAL.

*.........table declarations:.................................*
TABLES: *ZSFE_D_ORDER                  .
TABLES: ZSFE_D_CARD                    .
TABLES: ZSFE_D_ORDER                   .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
