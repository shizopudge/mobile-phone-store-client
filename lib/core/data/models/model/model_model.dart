import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/enums.dart';
import '../../../domain/entities/model.dart';
import '../../../domain/entities/product.dart';
import '../manufacturer/manufacturer_model.dart';
import '../product/product_model.dart';

part 'model_model.freezed.dart';
part 'model_model.g.dart';

@freezed
class ModelModel with _$ModelModel {
  const ModelModel._();
  const factory ModelModel({
    required String id,
    required String name,
    required String description,
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

  factory ModelModel.fromEntity(Model model) {
    final List<ProductModel> productModels = [];
    for (Product product in model.products) {
      productModels.add(ProductModel.fromEntity(product));
    }
    return ModelModel(
      id: model.id,
      name: model.name,
      description: model.description,
      pixelDensity: model.pixelDensity,
      screenRefreshRate: model.screenRefreshRate,
      screenDiagonal: model.screenDiagonal,
      weight: model.weight,
      screenResolution: model.screenResolution,
      operatingSystem: model.operatingSystem,
      displayType: model.displayType,
      manufacturer: ManufacturerModel.fromEntity(model.manufacturer),
      products: productModels,
    );
  }
}
