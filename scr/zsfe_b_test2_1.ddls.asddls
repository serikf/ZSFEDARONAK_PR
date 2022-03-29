@AbapCatalog.sqlViewName: 'ZSFEBTEST21'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ProdT'
define view ZSFE_B_TEST2_1
  as select from zsfe_d_product_t
{
  key mandt         as Mandt,
  key langu         as Langu,
  key product_id    as ProductId,
      product_brand as ProductBrand,
      product_type  as ProductType,
      product_name  as ProductName

}
where langu = 'E'
