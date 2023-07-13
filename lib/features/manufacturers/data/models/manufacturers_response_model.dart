import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/info/info_model.dart';
import '../../../../core/data/models/manufacturer/manufacturer_model.dart';

part 'manufacturers_response_model.freezed.dart';
part 'manufacturers_response_model.g.dart';

@freezed
class ManufacturersResponseModel with _$ManufacturersResponseModel {
  const factory ManufacturersResponseModel({
    required InfoModel info,
    required List<ManufacturerModel> manufacturers,
  }) = _ManufacturersResponseModel;

  factory ManufacturersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ManufacturersResponseModelFromJson(json);
}
