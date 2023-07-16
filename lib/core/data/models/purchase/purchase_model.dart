import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:phone_store/core/constants/enums.dart';

part 'purchase_model.freezed.dart';
part 'purchase_model.g.dart';

@freezed
class PurchaseModel with _$PurchaseModel {
  const factory PurchaseModel({
    required String id,
    required String createdAt,
    required String updatedAt,
    required PurchaseStatus status,
    required String userId,
    required String productId,
  }) = _PurchaseModel;

  factory PurchaseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchaseModelFromJson(json);
}
