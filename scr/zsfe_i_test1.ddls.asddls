@AbapCatalog.sqlViewName: 'ZSFEITEST1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite CDS  for Test1 Table'
define view ZSFE_I_TEST1
  as select from ZSFE_B_TEST1
{
  key MatNum,
      Ersda,
      Ernam,
      Laeda,
      Aenam,
      Vpsta,
      Pstat,
      Lvorm,
      Mtart

}
