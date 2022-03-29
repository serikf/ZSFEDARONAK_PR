@AbapCatalog.sqlViewName: 'ZSFEBPRODUCT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Basic CDS for Product'
define view  ZSFE_B_PRODUCT
  as select from zsfe_d_product
{
  key mandt           as Mandt,
  key product_id      as ProductId,
      provider_id     as ProviderId,
      product_kaliber as ProductKaliber,
      price           as Price

}
