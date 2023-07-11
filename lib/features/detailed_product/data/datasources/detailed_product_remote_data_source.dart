import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/data/models/product/product_model.dart';
import '../../../../core/failure/failure.dart';

abstract interface class DetailedProductRemoteDataSource {
  Future<ProductModel> getOneProduct(String id);
}

class DetailedProductRemoteDataSourceImpl
    implements DetailedProductRemoteDataSource {
  final DioClient dioClient;

  DetailedProductRemoteDataSourceImpl(this.dioClient);

  @override
  Future<ProductModel> getOneProduct(String id) async {
    try {
      final res = await dioClient.dio.get(
        '${ApiConstants.products}/$id',
      );
      return ProductModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
