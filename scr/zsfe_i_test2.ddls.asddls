@AbapCatalog.sqlViewName: 'ZSFEITEST2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Prod'
define view ZSFE_I_TEST2
  as select from ZSFE_B_TEST2
{
  ProductId,
  ProviderId,
  ProductKaliber,
  Price

}
