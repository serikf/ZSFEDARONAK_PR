FUNCTION zsfe_fg_rows_fm.
*"----------------------------------------------------------------------
*"*"Local Interface:
*"  IMPORTING
*"     REFERENCE(IV_DATE) TYPE  DATUM
*"----------------------------------------------------------------------
*DATA:
*lv_day   TYPE SCAL-INDICATOR .
*
*CALL FUNCTION 'DATE_COMPUTE_DAY'
*  EXPORTING
*    date = sy-datum
*  IMPORTING
*    day = lv_day
*
data:  lv_daytxt   TYPE HRVSCHED-DAYTXT.

CALL FUNCTION 'RH_GET_DATE_DAYNAME'
  EXPORTING
    langu = sy-langu
    date =  sy-datum
  IMPORTING
    daytxt = lv_daytxt.


MESSAGE | Today is { iv_date }, { lv_daytxt }.   Thank you for flying EPAM Airlines! | TYPE 'I'.

ENDFUNCTION.
