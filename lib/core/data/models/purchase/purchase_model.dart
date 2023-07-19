import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/enums.dart';
import '../product/product_model.dart';

part 'purchase_model.freezed.dart';
part 'purchase_model.g.dart';

@freezed
class PurchaseModel with _$PurchaseModel {
  const factory PurchaseModel({
    required String id,
    required String createdAt,
    required String updatedAt,
    required PurchaseStatus status,
    required String cost,
    required String paymentUrl,
    required String currency,
    required String description,
    required String userId,
    required List<ProductModel> products,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}
