part of 'browse_products_bloc.dart';

@freezed
class BrowseProductsEvent with _$BrowseProductsEvent {
  const factory BrowseProductsEvent.initial() = _Initial;
  const factory BrowseProductsEvent.refreshProducts() = _RefreshProducts;
  const factory BrowseProductsEvent.getNextProducts() = _GetNextProducts;
  const factory BrowseProductsEvent.searchProducts(String query) =
      _SearchProducts;
  const factory BrowseProductsEvent.updateProductInList(Product product) =
      _UpdateProductInList;
  const factory BrowseProductsEvent.changeFilter(ProductsFilter filter) =
      _ChangeFilter;
}
