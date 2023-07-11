import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';

abstract interface class WishlistRepository {
  FutureEither<CartWishlistResponse> getWishlist();
}
