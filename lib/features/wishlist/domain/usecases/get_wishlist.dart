import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/wishlist_repository.dart';

class GetWishlist implements UseCase<CartWishlistResponse, NoParams> {
  final WishlistRepository repository;

  GetWishlist(this.repository);
  @override
  FutureEither<CartWishlistResponse> call(NoParams params) async =>
      await repository.getWishlist();
}
