import 'package:dio/dio.dart';

import '../../../api/api_constants.dart';
import '../../../api/dio_client.dart';
import '../../../failure/failure.dart';
import '../../models/create_purchase_response/create_purchase_response_model.dart';

abstract interface class PurchasesRemoteDataSource {
  Future<CreatePurchaseResponseModel> createPurchase(List<String> productIds);
}

class PurchasesRemoteDataSourceImpl implements PurchasesRemoteDataSource {
  final DioClient dioClient;

  const PurchasesRemoteDataSourceImpl(this.dioClient);
  @override
  Future<CreatePurchaseResponseModel> createPurchase(
      List<String> productIds) async {
    try {
      final res = await dioClient.dio.post(ApiConstants.purchases, data: {
        'productIds': productIds,
      });
      return CreatePurchaseResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
