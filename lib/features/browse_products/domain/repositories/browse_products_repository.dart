import '../../../../core/constants/type_defs.dart';
import '../entities/browse_products_response.dart';

abstract interface class BrowseProductsRepository {
  FutureEither<BrowseProductsResponse> browseProducts({
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
