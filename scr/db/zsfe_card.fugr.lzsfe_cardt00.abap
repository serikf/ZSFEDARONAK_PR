*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 05.12.2021 at 18:53:17
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZSFE_D_CARD.....................................*
DATA:  BEGIN OF STATUS_ZSFE_D_CARD                   .   "state vector
         INCLUDE STRUCTURE VIMSTATUS.
DATA:  END OF STATUS_ZSFE_D_CARD                   .
CONTROLS: TCTRL_ZSFE_D_CARD
            TYPE TABLEVIEW USING SCREEN '0003'.
*...processing: ZSFE_V_CARD.....................................*
TABLES: ZSFE_V_CARD, *ZSFE_V_CARD. "view work areas
CONTROLS: TCTRL_ZSFE_V_CARD
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZSFE_V_CARD. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZSFE_V_CARD.
* Table for entries selected to show on screen
DATA: BEGIN OF ZSFE_V_CARD_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZSFE_V_CARD.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZSFE_V_CARD_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZSFE_V_CARD_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZSFE_V_CARD.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZSFE_V_CARD_TOTAL.

*.........table declarations:.................................*
TABLES: *ZSFE_D_CARD                   .
TABLES: *ZSFE_D_CARD_T                 .
TABLES: ZSFE_D_CARD                    .
TABLES: ZSFE_D_CARD_T                  .

* general table data declarations..............
  INCLUDE LSVIMTDT                                .
