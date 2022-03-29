@AbapCatalog.sqlViewName: 'ZSFEBTEST2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Prod'
define view ZSFE_B_TEST2
  as select from zsfe_d_product
{
  key mandt           as Mandt,
  key product_id      as ProductId,
      provider_id     as ProviderId,
      product_kaliber as ProductKaliber,
      price           as Price

}
