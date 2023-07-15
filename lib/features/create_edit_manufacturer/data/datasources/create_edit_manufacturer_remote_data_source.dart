import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/data/models/manufacturer/manufacturer_model.dart';
import '../../../../core/failure/failure.dart';

abstract interface class CreateEditManufacturerRemoteDataSource {
  Future<ManufacturerModel> createManufacturer({required String name});
  Future<ManufacturerModel> editManufacturer(
      {required String id, required String name});
  Future<String> uploadImage({required String id, required File image});
  Future<void> deleteImage(String id);
}

class CreateEditManufacturerRemoteDataSourceImpl
    implements CreateEditManufacturerRemoteDataSource {
  final DioClient dioClient;

  CreateEditManufacturerRemoteDataSourceImpl(this.dioClient);
  @override
  Future<ManufacturerModel> createManufacturer({required String name}) async {
    try {
      final res = await dioClient.dio.post(
        ApiConstants.manufacturers,
        data: {
          'name': name,
        },
      );
      return ManufacturerModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<ManufacturerModel> editManufacturer(
      {required String id, required String name}) async {
    try {
      final res = await dioClient.dio.put(
        '${ApiConstants.manufacturers}/$id',
        data: {
          'name': name,
        },
      );
      return ManufacturerModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<String> uploadImage({required String id, required File image}) async {
    try {
      final fileName = image.path.split('/').last;
      final res = await dioClient.dio.patch(
        '${ApiConstants.manufacturers}/image/$id',
        data: FormData.fromMap({
          'image': kIsWeb
              ? MultipartFile.fromBytes(await XFile(image.path).readAsBytes(),
                  filename: fileName)
              : await MultipartFile.fromFile(image.path, filename: fileName)
        }),
      );
      return res.data['image'];
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteImage(String id) async {
    try {
      await dioClient.dio.delete(
        '${ApiConstants.manufacturers}/image/$id',
      );
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
