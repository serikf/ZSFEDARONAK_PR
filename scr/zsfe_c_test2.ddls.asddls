@AbapCatalog.sqlViewName: 'ZSFECTEST2'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Prod'
define view ZSFE_C_TEST2
  as select from ZSFE_I_TEST2 as prod
  association [1..*] to zsfebtest21 as _prodt on prod.ProductId = _prodt.productid

{
  prod.ProductId,
  prod.ProviderId,
  prod.ProductKaliber,
  prod.Price,
  concat_with_space(ProductId, ProductKaliber, 2) as Conc,
  _prodt.productname
 
}
where prod.Price > 600
