import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/product.dart';

abstract interface class DetailedProductRepository {
  FutureEither<Product> getOneProduct(String id);
}
