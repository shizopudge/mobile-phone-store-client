import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/constants/enums.dart';
import '../manufacturer/manufacturer_model.dart';
import '../product/product_model.dart';

part 'model_model.freezed.dart';
part 'model_model.g.dart';

@freezed
class ModelModel with _$ModelModel {
  const factory ModelModel({
    required String id,
    required String name,
    required int pixelDensity,
    required int screenRefreshRate,
    required double screenDiagonal,
    required int weight,
    required String screenResolution,
    required OperatingSystem operatingSystem,
    required DisplayType displayType,
    required ManufacturerModel manufacturer,
    required List<ProductModel> products,
  }) = _ModelModel;

  factory ModelModel.fromJson(Map<String, dynamic> json) =>
      _$ModelModelFromJson(json);
}
