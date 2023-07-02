import 'package:freezed_annotation/freezed_annotation.dart';

part 'manufacturer_model.freezed.dart';
part 'manufacturer_model.g.dart';

@freezed
class ManufacturerModel with _$ManufacturerModel {
  const factory ManufacturerModel({
    required String id,
    required String name,
    required String? image,
  }) = _ManufacturerModel;

  factory ManufacturerModel.fromJson(Map<String, dynamic> json) =>
      _$ManufacturerModelFromJson(json);
}
