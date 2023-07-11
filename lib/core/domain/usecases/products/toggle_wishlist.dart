import 'package:equatable/equatable.dart';

import '../../../constants/type_defs.dart';
import '../../entities/toggle_cart_wishlist_response.dart';
import '../../repositories/products/products_repository.dart';
import '../usecase.dart';

class ToggleWishlist
    implements UseCase<ToggleCartWishlistResponse, ToggleWishlistParams> {
  final ProductsRepository repository;

  ToggleWishlist(this.repository);
  @override
  FutureEither<ToggleCartWishlistResponse> call(params) async =>
      await repository.toggleWishlist(params.id);
}

class ToggleWishlistParams extends Equatable {
  final String id;
  const ToggleWishlistParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
