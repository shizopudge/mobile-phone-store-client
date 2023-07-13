import 'package:dartz/dartz.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/manufacturers_response.dart';
import '../../domain/repositories/manufacturers_repository.dart';
import '../datasources/manufacturers_remote_data_source.dart';

class ManufacturersRepositoryImpl implements ManufacturersRepository {
  final ManufacturersRemoteDataSource remoteDataSource;

  const ManufacturersRepositoryImpl({required this.remoteDataSource});
  @override
  FutureEither<ManufacturersResponse> getManufacturers(
      {required String query, required int page, required int limit}) async {
    try {
      final res = await remoteDataSource.getManufacturers(
        page: page,
        limit: limit,
        query: query,
      );
      return Right(ManufacturersResponse.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
