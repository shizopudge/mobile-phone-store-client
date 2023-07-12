import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/wishlist_repository.dart';

class GetWishlist implements UseCase<CartWishlistResponse, GetWishlistParams> {
  final WishlistRepository repository;

  GetWishlist(this.repository);
  @override
  FutureEither<CartWishlistResponse> call(GetWishlistParams params) async =>
      await repository.getWishlist(
          page: params.page,
          limit: params.limit,
          query: params.query,
          sort: params.sort,
          minCost: params.minCost,
          maxCost: params.maxCost,
          withDiscount: params.withDiscount,
          newArrival: params.newArrival);
}

class GetWishlistParams extends Equatable {
  final int page;
  final int limit;
  final String query;
  final String sort;
  final double? minCost;
  final double? maxCost;
  final bool withDiscount;
  final bool newArrival;
  const GetWishlistParams({
    required this.page,
    required this.limit,
    required this.query,
    required this.sort,
    required this.minCost,
    required this.maxCost,
    required this.withDiscount,
    required this.newArrival,
  });

  @override
  List<Object?> get props {
    return [
      page,
      limit,
      query,
      sort,
      minCost,
      maxCost,
      withDiscount,
      newArrival,
    ];
  }
}
