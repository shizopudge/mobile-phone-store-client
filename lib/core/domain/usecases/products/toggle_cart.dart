import 'package:equatable/equatable.dart';

import '../../../constants/type_defs.dart';
import '../../entities/toggle_cart_wishlist_response.dart';
import '../../repositories/products/products_repository.dart';
import '../usecase.dart';

class ToggleCart
    implements UseCase<ToggleCartWishlistResponse, ToggleCartParams> {
  final ProductsRepository repository;

  ToggleCart(this.repository);
  @override
  FutureEither<ToggleCartWishlistResponse> call(params) async =>
      await repository.toggleCart(params.id);
}

class ToggleCartParams extends Equatable {
  final String id;
  const ToggleCartParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
