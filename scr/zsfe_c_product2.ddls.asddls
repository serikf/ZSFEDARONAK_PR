@AbapCatalog.sqlViewName: 'ZSFECPRODUCT2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'UI CDS for Product'
@OData.publish: true
define view ZSFE_C_PRODUCT2
  as select from ZSFE_I_PRODUCT
{
  key ProductId,
      ProviderId,
      ProductKaliber,
      Price
}
