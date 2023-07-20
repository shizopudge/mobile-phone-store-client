import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/enums.dart';

part 'purchase_notification_model.freezed.dart';
part 'purchase_notification_model.g.dart';

@freezed
class PurchaseNotficationModel with _$PurchaseNotficationModel {
  const factory PurchaseNotficationModel({
    required String paymentId,
    required String cost,
    required String currency,
    required PurchaseStatus status,
  }) = _PurchaseNotficationModel;

  factory PurchaseNotficationModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseNotficationModelFromJson(json);
}
