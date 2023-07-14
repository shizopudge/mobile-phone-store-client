import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/models_repository.dart';

class DeleteModel implements UseCase<void, DeleteModelParams> {
  final ModelsRepository repository;

  const DeleteModel(this.repository);
  @override
  FutureEither<void> call(DeleteModelParams params) async =>
      await repository.deleteModel(params.id);
}

class DeleteModelParams extends Equatable {
  final String id;

  const DeleteModelParams({required this.id});

  @override
  List<Object?> get props => [id];
}
