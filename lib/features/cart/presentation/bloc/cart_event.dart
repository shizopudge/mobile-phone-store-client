part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.initial() = _Initial;
  const factory CartEvent.toggleCart(Product product) = _ToggleCart;
  const factory CartEvent.toggleRemoteCart(
      {required Product product,
      required int? productIndex}) = _ToggleRemoteCart;
  const factory CartEvent.refresh() = _Refresh;
  const factory CartEvent.updateProductInList(Product product) =
      _UpdateProductInList;
  const factory CartEvent.getNextProducts() = _GetNextProducts;
  const factory CartEvent.searchProducts(String query) = _SearchProducts;
  const factory CartEvent.changeFilter(ProductsFilter filter) = _ChangeFilter;
}
