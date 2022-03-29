@AbapCatalog.sqlViewName: 'ZSFECTEST1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'UI CDS'
define view ZSFE_C_TEST1
  as select from ZSFE_I_TEST1
{
  MatNum,
  Ersda,
  Ernam,
  Laeda,
  Aenam,
  Vpsta,
  Pstat,
  Lvorm,
  Mtart

}
