import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/manufacturer.dart';

part 'manufacturer_model.freezed.dart';
part 'manufacturer_model.g.dart';

@freezed
class ManufacturerModel with _$ManufacturerModel {
  const ManufacturerModel._();
  const factory ManufacturerModel({
    required String id,
    required String name,
    required String? image,
  }) = _ManufacturerModel;

  factory ManufacturerModel.fromJson(Map<String, dynamic> json) =>
      _$ManufacturerModelFromJson(json);

  factory ManufacturerModel.fromEntity(Manufacturer manufacturer) =>
      ManufacturerModel(
          id: manufacturer.id,
          name: manufacturer.name,
          image: manufacturer.image);
}
