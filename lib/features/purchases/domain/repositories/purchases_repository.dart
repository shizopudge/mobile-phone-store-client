import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../entities/purchase_response.dart';

abstract interface class PurchasesRepository {
  FutureEither<PurchasesResponse> getPurchases({
    required String query,
    required int page,
    required int limit,
  });
  FutureEither<PurchasesResponse> getUserPurchases({
    required String query,
    required int page,
    required int limit,
  });
  FutureEither<void> changePurchase({
    required String id,
    required PurchaseStatus status,
  });
}
