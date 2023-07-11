import '../../../../core/constants/type_defs.dart';
import '../entities/search_products_response.dart';

abstract interface class SearchProductsRepository {
  FutureEither<SearchProductsResponse> getManyProducts({
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