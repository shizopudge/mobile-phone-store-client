import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/info/info_model.dart';
import '../../../../core/data/models/purchase/purchase_model.dart';

part 'purchases_response_model.freezed.dart';
part 'purchases_response_model.g.dart';

@freezed
class PurchasesResponseModel with _$PurchasesResponseModel {
  const factory PurchasesResponseModel({
    required InfoModel info,
    required List<PurchaseModel> purchases,
  }) = _PurchasesResponseModel;

  factory PurchasesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PurchasesResponseModelFromJson(json);
}
