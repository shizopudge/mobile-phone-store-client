part of 'products_bloc.dart';

@freezed
class ProductsEvent with _$ProductsEvent {
  const factory ProductsEvent.start() = _Start;
  const factory ProductsEvent.refreshProducts() = _RefreshProducts;
  const factory ProductsEvent.getNextProducts() = _GetNextProducts;
  const factory ProductsEvent.searchProducts(String query) = _SearchProducts;
  const factory ProductsEvent.changeFilter(ProductsFilter filter) =
      _ChangeFilter;
  const factory ProductsEvent.changeProduct(Product? product) = _ChangeProduct;
}
