import 'package:equatable/equatable.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/model.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_model_repository.dart';

class EditModel implements UseCase<Model, EditModelParams> {
  final CreateEditModelRepository repository;

  const EditModel(this.repository);
  @override
  FutureEither<Model> call(EditModelParams params) async =>
      await repository.editModel(
          id: params.id,
          name: params.name,
          description: params.description,
          pixelDensity: params.pixelDensity,
          screenRefreshRate: params.screenRefreshRate,
          screenDiagonal: params.screenDiagonal,
          weight: params.weight,
          screenResolution: params.screenResolution,
          operatingSystem: params.operatingSystem,
          displayType: params.displayType);
}

class EditModelParams extends Equatable {
  final String id;
  final String name;
  final String description;
  final int pixelDensity;
  final int screenRefreshRate;
  final double screenDiagonal;
  final int weight;
  final String screenResolution;
  final OperatingSystem operatingSystem;
  final DisplayType displayType;

  const EditModelParams({
    required this.id,
    required this.name,
    required this.description,
    required this.pixelDensity,
    required this.screenRefreshRate,
    required this.screenDiagonal,
    required this.weight,
    required this.screenResolution,
    required this.operatingSystem,
    required this.displayType,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        pixelDensity,
        screenRefreshRate,
        screenDiagonal,
        weight,
        screenResolution,
        operatingSystem,
        displayType,
      ];
}
