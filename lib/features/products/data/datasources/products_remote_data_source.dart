import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/failure/failure.dart';
import '../models/products_response/products_response_model.dart';

abstract interface class ProductsRemoteDataSource {
  Future<ProductsResponseModel> getManyProducts({
    required int page,
    required int limit,
    required String query,
    required String sort,
    required double? minCost,
    required double? maxCost,
    required bool withDiscount,
    required bool newArrival,
  });
}

class ProductsRemoteDataSourceImpl implements ProductsRemoteDataSource {
  final DioClient dioClient;

  ProductsRemoteDataSourceImpl(this.dioClient);
  @override
  Future<ProductsResponseModel> getManyProducts({
    required int page,
    required int limit,
    required String query,
    required String sort,
    required double? minCost,
    required double? maxCost,
    required bool withDiscount,
    required bool newArrival,
  }) async {
    try {
      final Map<String, dynamic> queryParameters = {
        'page': page,
        'limit': limit,
        'query': query,
        'sort': sort,
        'withDiscount': withDiscount,
        'newArrival': newArrival,
      };
      if (minCost != null) queryParameters['minCost'] = minCost;
      if (maxCost != null) queryParameters['maxCost'] = maxCost;
      final res = await dioClient.dio.get(
        ApiConstants.products,
        queryParameters: queryParameters,
      );
      return ProductsResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw UnknownFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
  }
}
