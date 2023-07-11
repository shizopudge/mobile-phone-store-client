import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class GetCart implements UseCase<CartWishlistResponse, NoParams> {
  final CartRepository repository;

  GetCart(this.repository);
  @override
  FutureEither<CartWishlistResponse> call(NoParams params) async =>
      await repository.getCart();
}
