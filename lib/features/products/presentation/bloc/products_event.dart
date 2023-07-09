part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.initial() = _Initial;
  const factory ProductsEvent.refreshProducts() = _RefreshProducts;
  const factory ProductsEvent.getNextProducts() = _GetNextProducts;
  const factory ProductsEvent.searchProducts(String query) = _SearchProducts;
  const factory ProductsEvent.updateProductInList(Product product) =
      _UpdateProductInList;
  const factory ProductsEvent.changeFilter(ProductsFilter filter) =
      _ChangeFilter;
}
