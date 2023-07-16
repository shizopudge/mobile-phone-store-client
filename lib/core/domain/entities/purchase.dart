import 'package:equatable/equatable.dart';
import 'package:phone_store/core/data/models/purchase/purchase_model.dart';

import '../../constants/enums.dart';

class Purchase extends Equatable {
  final String id;
  final String createdAt;
  final String updatedAt;
  final PurchaseStatus status;
  final String userId;
  final String productId;

  const Purchase({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    required this.userId,
    required this.productId,
  });

  factory Purchase.fromModel(PurchaseModel model) {
    final String createdAt =
        DateTime.tryParse(model.createdAt)?.toLocal().toString() ??
            DateTime.now().toString();
    final String updatedAt =
        DateTime.tryParse(model.updatedAt)?.toLocal().toString() ??
            DateTime.now().toString();
    return Purchase(
        id: model.id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        status: model.status,
        userId: model.userId,
        productId: model.productId);
  }

  @override
  List<Object?> get props =>
      [id, createdAt, updatedAt, status, userId, productId];
}
