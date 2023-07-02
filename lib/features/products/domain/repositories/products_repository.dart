import '../../../../core/constants/type_defs.dart';
import '../entities/products_response.dart';

abstract interface class ProductsRepository {
  FutureEither<ProductsResponse> getProducts({
    required int page,
    required int limit,
    required String query,
    required String sort,
  });
}
