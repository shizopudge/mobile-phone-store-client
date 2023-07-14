import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/models_response.dart';
import '../../domain/repositories/models_repository.dart';
import '../datasources/models_remote_data_source.dart';

class ModelsRepositoryImpl implements ModelsRepository {
  final ModelsRemoteDataSource remoteDataSource;

  const ModelsRepositoryImpl({required this.remoteDataSource});
  @override
  FutureEither<ModelsResponse> getModels(
      {required String manufacturerId,
      required String query,
      required int page,
      required int limit}) async {
    try {
      final res = await remoteDataSource.getModels(
        manufacturerId: manufacturerId,
        page: page,
        limit: limit,
        query: query,
      );
      return Right(ModelsResponse.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<void> deleteModel(String id) async {
    try {
      await remoteDataSource.deleteModel(id);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
