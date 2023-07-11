import '../../../constants/type_defs.dart';
import '../../entities/toggle_cart_wishlist_response.dart';

abstract interface class ProductsRepository {
  FutureEither<ToggleCartWishlistResponse> toggleCart(String id);
  FutureEither<ToggleCartWishlistResponse> toggleWishlist(String id);
}
