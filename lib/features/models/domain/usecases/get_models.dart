import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/models_response.dart';
import '../repositories/models_repository.dart';

class GetModels implements UseCase<ModelsResponse, GetModelsParams> {
  final ModelsRepository repository;

  GetModels(this.repository);
  @override
  FutureEither<ModelsResponse> call(GetModelsParams params) async =>
      await repository.getModels(
          manufacturerId: params.manufacturerId,
          query: params.query,
          page: params.page,
          limit: params.limit);
}

class GetModelsParams extends Equatable {
  final String manufacturerId;
  final String query;
  final int page;
  final int limit;

  const GetModelsParams({
    required this.manufacturerId,
    required this.query,
    required this.page,
    required this.limit,
  });

  @override
  List<Object?> get props => [manufacturerId, query, page, limit];
}
