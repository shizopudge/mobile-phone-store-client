import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/model.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/repositories/create_edit_model_repository.dart';
import '../datasources/create_edit_model_remote_data_source.dart';

class CreateEditModelRepositoryImpl implements CreateEditModelRepository {
  final CreateEditModelRemoteDataSource remoteDataSource;

  CreateEditModelRepositoryImpl({required this.remoteDataSource});
  @override
  FutureEither<Model> createModel(
      {required String name,
      required String description,
      required String manufacturerId,
      required int pixelDensity,
      required int screenRefreshRate,
      required double screenDiagonal,
      required int weight,
      required String screenResolution,
      required OperatingSystem operatingSystem,
      required DisplayType displayType}) async {
    try {
      final res = await remoteDataSource.createModel(
          name: name,
          description: description,
          manufacturerId: manufacturerId,
          pixelDensity: pixelDensity,
          screenRefreshRate: screenRefreshRate,
          screenDiagonal: screenDiagonal,
          weight: weight,
          screenResolution: screenResolution,
          operatingSystem: operatingSystem,
          displayType: displayType);
      return Right(Model.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<Model> editModel(
      {required String id,
      required String name,
      required String description,
      required int pixelDensity,
      required int screenRefreshRate,
      required double screenDiagonal,
      required int weight,
      required String screenResolution,
      required OperatingSystem operatingSystem,
      required DisplayType displayType}) async {
    try {
      final res = await remoteDataSource.editModel(
          id: id,
          name: name,
          description: description,
          pixelDensity: pixelDensity,
          screenRefreshRate: screenRefreshRate,
          screenDiagonal: screenDiagonal,
          weight: weight,
          screenResolution: screenResolution,
          operatingSystem: operatingSystem,
          displayType: displayType);
      return Right(Model.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
