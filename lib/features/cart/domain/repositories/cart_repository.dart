import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';

abstract interface class CartRepository {
  FutureEither<CartWishlistResponse> getCart({
    required int page,
    required int limit,
    required String query,
    required String sort,
    required double? minCost,
    required double? maxCost,
    required bool withDiscount,
    required bool newArrival,
  });
}
