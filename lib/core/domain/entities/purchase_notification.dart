import 'package:equatable/equatable.dart';

import '../../constants/enums.dart';
import '../../data/models/purchase_notification_model/purchase_notification_model.dart';

class PurchaseNotfication extends Equatable {
  final String id;
  final String cost;
  final String currency;
  final PurchaseStatus status;

  const PurchaseNotfication({
    required this.id,
    required this.cost,
    required this.currency,
    required this.status,
  });

  factory PurchaseNotfication.fromModel(PurchaseNotficationModel model) =>
      PurchaseNotfication(
          id: model.paymentId,
          cost: model.cost,
          currency: model.currency,
          status: model.status);

  @override
  List<Object?> get props => [id, cost, currency, status];
}
