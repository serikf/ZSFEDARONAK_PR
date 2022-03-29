INTERFACE zif_sf_personality
  PUBLIC .

  TYPES:
    BEGIN OF ls_user,
                first_name TYPE zsfe_owner_first_name,
                last_name TYPE zsfe_owner_last_name,
                passport TYPE zsfe_passport,
    END OF ls_user .

  DATA ms_user TYPE ls_user READ-ONLY .
ENDINTERFACE.
