import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/failure/failure.dart';
import '../model/purchases_response_model.dart';

abstract interface class PurchasesRemoteDataSource {
  Future<PurchasesResponseModel> getPurchases({
    required String query,
    required int page,
    required int limit,
  });
  Future<PurchasesResponseModel> getUserPurchases({
    required String query,
    required int page,
    required int limit,
  });
  Future<void> changePurchase({
    required String id,
    required PurchaseStatus status,
  });
}

class PurchasesRemoteDataSourceImpl implements PurchasesRemoteDataSource {
  final DioClient dioClient;

  const PurchasesRemoteDataSourceImpl(this.dioClient);

  @override
  Future<PurchasesResponseModel> getPurchases({
    required String query,
    required int page,
    required int limit,
  }) async {
    try {
      final res =
          await dioClient.dio.get(ApiConstants.purchases, queryParameters: {
        'query': query,
        'page': page,
        'limit': limit,
      });
      return PurchasesResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<PurchasesResponseModel> getUserPurchases({
    required String query,
    required int page,
    required int limit,
  }) async {
    try {
      final res = await dioClient.dio
          .get('${ApiConstants.users}/purchases/all', queryParameters: {
        'query': query,
        'page': page,
        'limit': limit,
      });
      return PurchasesResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<void> changePurchase(
      {required String id, required PurchaseStatus status}) async {
    try {
      await dioClient.dio
          .patch('${ApiConstants.purchases}/$id', queryParameters: {
        'status': status,
      });
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
