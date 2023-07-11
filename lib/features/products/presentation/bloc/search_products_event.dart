part of 'search_products_bloc.dart';

@freezed
class SearchProductsEvent with _$SearchProductsEvent {
  const factory SearchProductsEvent.initial() = _Initial;
  const factory SearchProductsEvent.refreshProducts() = _RefreshProducts;
  const factory SearchProductsEvent.getNextProducts() = _GetNextProducts;
  const factory SearchProductsEvent.searchProducts(String query) =
      _SearchProducts;
  const factory SearchProductsEvent.updateProductInList(Product product) =
      _UpdateProductInList;
  const factory SearchProductsEvent.changeFilter(ProductsFilter filter) =
      _ChangeFilter;
}
