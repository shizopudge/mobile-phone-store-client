import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/cart_wishlist_response.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/cart_repository.dart';

class GetCart implements UseCase<CartWishlistResponse, GetCartParams> {
  final CartRepository repository;

  GetCart(this.repository);
  @override
  FutureEither<CartWishlistResponse> call(GetCartParams params) async =>
      await repository.getCart(
          page: params.page,
          limit: params.limit,
          query: params.query,
          sort: params.sort,
          minCost: params.minCost,
          maxCost: params.maxCost,
          withDiscount: params.withDiscount,
          newArrival: params.newArrival);
}

class GetCartParams extends Equatable {
  final int page;
  final int limit;
  final String query;
  final String sort;
  final double? minCost;
  final double? maxCost;
  final bool withDiscount;
  final bool newArrival;
  const GetCartParams({
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
