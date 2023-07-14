import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/failure/failure.dart';
import '../models/models_response_model.dart';

abstract interface class ModelsRemoteDataSource {
  Future<ModelsResponseModel> getModels({
    required String manufacturerId,
    required String query,
    required int page,
    required int limit,
  });
  Future<void> deleteModel(String id);
}

class ModelsRemoteDataSourceImpl implements ModelsRemoteDataSource {
  final DioClient dioClient;

  ModelsRemoteDataSourceImpl(this.dioClient);
  @override
  Future<ModelsResponseModel> getModels(
      {required String manufacturerId,
      required String query,
      required int page,
      required int limit}) async {
    try {
      final res =
          await dioClient.dio.get(ApiConstants.models, queryParameters: {
        'page': page,
        'limit': limit,
        'query': query,
        'manufacturerId': manufacturerId,
      });
      return ModelsResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteModel(String id) async {
    try {
      await dioClient.dio
          .delete('${ApiConstants.models}/$id', queryParameters: {});
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
