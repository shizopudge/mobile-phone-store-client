import 'package:equatable/equatable.dart';

import '../../../../core/data/models/purchase/purchase_model.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/purchase.dart';
import '../../data/model/purchases_response_model.dart';

class PurchasesResponse extends Equatable {
  final Info info;
  final List<Purchase> purchases;

  const PurchasesResponse({
    required this.info,
    required this.purchases,
  });

  factory PurchasesResponse.fromModel(PurchasesResponseModel model) {
    final List<Purchase> purchases = [];
    for (PurchaseModel purchaseModel in model.purchases) {
      purchases.add(Purchase.fromModel(purchaseModel));
    }
    return PurchasesResponse(
      info: Info.fromModel(model.info),
      purchases: purchases,
    );
  }

  @override
  List<Object?> get props => [info, purchases];
}
