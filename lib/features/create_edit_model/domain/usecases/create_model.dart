import 'package:equatable/equatable.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/model.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_model_repository.dart';

class CreateModel implements UseCase<Model, CreateModelParams> {
  final CreateEditModelRepository repository;

  const CreateModel(this.repository);
  @override
  FutureEither<Model> call(CreateModelParams params) async =>
      await repository.createModel(
          name: params.name,
          description: params.description,
          manufacturerId: params.manufacturerId,
          pixelDensity: params.pixelDensity,
          screenRefreshRate: params.screenRefreshRate,
          screenDiagonal: params.screenDiagonal,
          weight: params.weight,
          screenResolution: params.screenResolution,
          operatingSystem: params.operatingSystem,
          displayType: params.displayType);
}

class CreateModelParams extends Equatable {
  final String name;
  final String description;
  final String manufacturerId;
  final int pixelDensity;
  final int screenRefreshRate;
  final double screenDiagonal;
  final int weight;
  final String screenResolution;
  final OperatingSystem operatingSystem;
  final DisplayType displayType;

  const CreateModelParams({
    required this.name,
    required this.description,
    required this.manufacturerId,
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
        name,
        description,
        manufacturerId,
        pixelDensity,
        screenRefreshRate,
        screenDiagonal,
        weight,
        screenResolution,
        operatingSystem,
        displayType,
      ];
}
