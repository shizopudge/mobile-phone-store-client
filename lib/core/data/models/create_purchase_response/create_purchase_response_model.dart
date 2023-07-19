import 'package:freezed_annotation/freezed_annotation.dart';

import '../payment/payment_model.dart';
import '../purchase/purchase_model.dart';

part 'create_purchase_response_model.freezed.dart';
part 'create_purchase_response_model.g.dart';

@freezed
class CreatePurchaseResponseModel with _$CreatePurchaseResponseModel {
  const factory CreatePurchaseResponseModel({
    required PurchaseModel purchase,
    required PaymentModel payment,
  }) = _CreatePurchaseResponseModel;

  factory CreatePurchaseResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CreatePurchaseResponseModelFromJson(json);
}
