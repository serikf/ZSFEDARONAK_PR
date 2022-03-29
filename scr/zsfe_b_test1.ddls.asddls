@AbapCatalog.sqlViewName: 'ZSFEBTEST1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS Test1 DB Table'
define view ZSFE_B_TEST1
  as select from mara
{
  key mandt as Mandt,
  key matnr as MatNum,
      ersda as Ersda,
      ernam as Ernam,
      laeda as Laeda,
      aenam as Aenam,
      vpsta as Vpsta,
      pstat as Pstat,
      lvorm as Lvorm,
      mtart as Mtart

}
