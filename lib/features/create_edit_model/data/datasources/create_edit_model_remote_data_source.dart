import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/constants/enums.dart';
import '../../../../core/data/models/model/model_model.dart';
import '../../../../core/failure/failure.dart';

abstract interface class CreateEditModelRemoteDataSource {
  Future<ModelModel> createModel({
    required String name,
    required String description,
    required String manufacturerId,
    required int pixelDensity,
    required int screenRefreshRate,
    required double screenDiagonal,
    required int weight,
    required String screenResolution,
    required OperatingSystem operatingSystem,
    required DisplayType displayType,
  });
  Future<ModelModel> editModel({
    required String id,
    required String name,
    required String description,
    required int pixelDensity,
    required int screenRefreshRate,
    required double screenDiagonal,
    required int weight,
    required String screenResolution,
    required OperatingSystem operatingSystem,
    required DisplayType displayType,
  });
}

class CreateEditModelRemoteDataSourceImpl
    implements CreateEditModelRemoteDataSource {
  final DioClient dioClient;

  CreateEditModelRemoteDataSourceImpl(this.dioClient);
  @override
  Future<ModelModel> createModel(
      {required String name,
      required String description,
      required String manufacturerId,
      required int pixelDensity,
      required int screenRefreshRate,
      required double screenDiagonal,
      required int weight,
      required String screenResolution,
      required OperatingSystem operatingSystem,
      required DisplayType displayType}) async {
    try {
      final res = await dioClient.dio.post(
        ApiConstants.models,
        data: {
          'name': name,
          'description': description,
          'manufacturerId': manufacturerId,
          'pixelDensity': pixelDensity,
          'screenRefreshRate': screenRefreshRate,
          'screenDiagonal': screenDiagonal,
          'weight': weight,
          'screenResolution': screenResolution,
          'operatingSystem': operatingSystem.toString(),
          'displayType': displayType.toString(),
        },
      );
      return ModelModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<ModelModel> editModel(
      {required String id,
      required String name,
      required String description,
      required int pixelDensity,
      required int screenRefreshRate,
      required double screenDiagonal,
      required int weight,
      required String screenResolution,
      required OperatingSystem operatingSystem,
      required DisplayType displayType}) async {
    try {
      final res = await dioClient.dio.put(
        '${ApiConstants.models}/$id',
        data: {
          'name': name,
          'description': description,
          'pixelDensity': pixelDensity,
          'screenRefreshRate': screenRefreshRate,
          'screenDiagonal': screenDiagonal,
          'weight': weight,
          'screenResolution': screenResolution,
          'operatingSystem': operatingSystem.toString(),
          'displayType': displayType.toString(),
        },
      );
      return ModelModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
