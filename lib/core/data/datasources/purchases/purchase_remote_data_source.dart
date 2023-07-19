import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../../api/api_constants.dart';
import '../../../api/dio_client.dart';
import '../../../failure/failure.dart';
import '../../models/create_purchase_response/create_purchase_response_model.dart';

abstract interface class PurchaseRemoteDataSource {
  Future<CreatePurchaseResponseModel> createPurchase(List<String> productIds);
}

class PurchaseRemoteDataSourceImpl implements PurchaseRemoteDataSource {
  final DioClient dioClient;

  const PurchaseRemoteDataSourceImpl(this.dioClient);
  @override
  Future<CreatePurchaseResponseModel> createPurchase(
      List<String> productIds) async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final res = await dioClient.dio.post(ApiConstants.purchases, data: {
        'productIds': productIds,
        'returnUrl': kIsWeb ? Uri.base : packageInfo.packageName
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
