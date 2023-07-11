import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';

abstract interface class CartRepository {
  FutureEither<CartWishlistResponse> getCart();
}
