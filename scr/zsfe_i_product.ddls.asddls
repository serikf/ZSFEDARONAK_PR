@AbapCatalog.sqlViewName: 'ZSFEIPRODUCT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Composite CDS  for Product'
define view ZSFE_I_PRODUCT
  as select from ZSFE_B_PRODUCT
{
  key ProductId,
      ProviderId,
      ProductKaliber,
      Price
}
