import 'package:dartz/dartz.dart';
import '../../datasources/purchases/purchases_local_data_source.dart';
import '../../../constants/type_defs.dart';
import '../../datasources/purchases/purchases_remote_data_source.dart';

import '../../../domain/entities/create_purchase_response.dart';

import '../../../domain/repositories/purchases/purchases_repository.dart';
import '../../../failure/failure.dart';

class PurchaseRepositoryImpl implements PurchaseRepository {
  final PurchasesRemoteDataSource remoteDataSource;
  final PurchasesLocalDataSource localDataSource;

  const PurchaseRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });
  @override
  FutureEither<CreatePurchaseResponse> createPurchase(
    List<String> productIds,
  ) async {
    try {
      final res = await remoteDataSource.createPurchase(productIds);
      return Right(CreatePurchaseResponse.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<void> openUrl(String url) async {
    try {
      await localDataSource.openUrl(url);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
