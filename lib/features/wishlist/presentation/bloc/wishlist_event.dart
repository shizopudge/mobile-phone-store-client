part of 'wishlist_bloc.dart';

@freezed
class WishlistEvent with _$WishlistEvent {
  const factory WishlistEvent.initial() = _Initial;
  const factory WishlistEvent.toggleWishlist(Product product) = _ToggleWishlist;
  const factory WishlistEvent.toggleRemoteWishlist(
      {required Product product,
      required int? productIndex}) = _ToggleRemoteWishlist;
  const factory WishlistEvent.refreshProducts() = _RefreshProducts;
  const factory WishlistEvent.updateProductInList(Product product) =
      _UpdateProductInList;
  const factory WishlistEvent.getNextProducts() = _GetNextProducts;
  const factory WishlistEvent.searchProducts(String query) = _SearchProducts;
  const factory WishlistEvent.changeFilter(ProductsFilter filter) =
      _ChangeFilter;
}
