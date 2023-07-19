import '../../../constants/type_defs.dart';
import '../../entities/create_purchase_response.dart';

abstract interface class PurchaseRepository {
  FutureEither<CreatePurchaseResponse> createPurchase(List<String> productIds);
  FutureEither<void> openUrl(String url);
}
