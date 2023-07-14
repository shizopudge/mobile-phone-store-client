import 'package:equatable/equatable.dart';
import '../../../../core/data/models/model/model_model.dart';
import '../../../../core/domain/entities/model.dart';

import '../../../../core/domain/entities/info.dart';
import '../../data/models/models_response_model.dart';

class ModelsResponse extends Equatable {
  final Info info;
  final List<Model> models;

  const ModelsResponse({
    required this.info,
    required this.models,
  });

  factory ModelsResponse.fromModel(ModelsResponseModel model) {
    final List<Model> models = [];
    for (ModelModel manufacturerModel in model.models) {
      models.add(Model.fromModel(manufacturerModel));
    }
    return ModelsResponse(
      info: Info.fromModel(model.info),
      models: models,
    );
  }

  @override
  List<Object?> get props => [info, models];
}
