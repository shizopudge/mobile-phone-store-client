import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/failure/failure.dart';
import '../models/search_products_response/search_products_response_model.dart';

abstract interface class SearchProductsRemoteDataSource {
  Future<SearchProductsResponseModel> getManyProducts({
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

class SearchProductsRemoteDataSourceImpl
    implements SearchProductsRemoteDataSource {
  final DioClient dioClient;

  SearchProductsRemoteDataSourceImpl(this.dioClient);
  @override
  Future<SearchProductsResponseModel> getManyProducts({
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
      return SearchProductsResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
