part of 'cart_bloc.dart';

@freezed
class CartEvent with _$CartEvent {
  const factory CartEvent.getCart() = _GetCart;
  const factory CartEvent.refreshCart() = _RefreshCart;
  const factory CartEvent.toggleCart(Product product) = _ToggleCart;
  const factory CartEvent.changeCart(List<Product> cart) = _ChangeCart;
}
