import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/data/models/info/info_model.dart';
import '../../../../core/data/models/model/model_model.dart';

part 'models_response_model.freezed.dart';
part 'models_response_model.g.dart';

@freezed
class ModelsResponseModel with _$ModelsResponseModel {
  const factory ModelsResponseModel({
    required InfoModel info,
    required List<ModelModel> models,
  }) = _ModelsResponseModel;

  factory ModelsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ModelsResponseModelFromJson(json);
}
