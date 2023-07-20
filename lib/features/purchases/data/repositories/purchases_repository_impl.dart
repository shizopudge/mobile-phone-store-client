import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/purchase_response.dart';
import '../../domain/repositories/purchases_repository.dart';
import '../datasources/purchases_remote_data_source.dart';

class PurchasesRepositoryImpl implements PurchasesRepository {
  final PurchasesRemoteDataSource remoteDataSource;

  const PurchasesRepositoryImpl({required this.remoteDataSource});

  @override
  FutureEither<PurchasesResponse> getPurchases(
      {required String query, required int page, required int limit}) async {
    try {
      final res = await remoteDataSource.getPurchases(
          query: query, page: page, limit: limit);
      return Right(PurchasesResponse.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<PurchasesResponse> getUserPurchases({
    required String query,
    required int page,
    required int limit,
  }) async {
    try {
      final res = await remoteDataSource.getUserPurchases(
          query: query, page: page, limit: limit);
      return Right(PurchasesResponse.fromModel(res));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<void> changePurchaseStatus(
      {required String id, required PurchaseStatus status}) async {
    try {
      await remoteDataSource.changePurchaseStatus(id: id, status: status);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(CasualFailure(message: e.toString()));
    }
  }
}
