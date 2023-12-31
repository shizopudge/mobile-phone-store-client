import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/failure/failure.dart';
import '../models/manufacturers_response_model.dart';

abstract interface class ManufacturersRemoteDataSource {
  Future<ManufacturersResponseModel> getManufacturers({
    required String query,
    required int page,
    required int limit,
  });
  Future<void> deleteManufacturer(String id);
}

class ManufacturersRemoteDataSourceImpl
    implements ManufacturersRemoteDataSource {
  final DioClient dioClient;

  ManufacturersRemoteDataSourceImpl(this.dioClient);
  @override
  Future<ManufacturersResponseModel> getManufacturers(
      {required String query, required int page, required int limit}) async {
    try {
      final res =
          await dioClient.dio.get(ApiConstants.manufacturers, queryParameters: {
        'page': page,
        'limit': limit,
        'query': query,
      });
      return ManufacturersResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteManufacturer(String id) async {
    try {
      await dioClient.dio.delete('${ApiConstants.manufacturers}/$id');
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
