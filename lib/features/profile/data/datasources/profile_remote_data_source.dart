import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/data/models/current_user/current_user_model.dart';
import '../../../../core/failure/failure.dart';

abstract interface class ProfileRemoteDataSource {
  Future<CurrentUserModel> editProfile({
    required String email,
    required String username,
    required String password,
    required String? newPassword,
  });

  Future<String> uploadImage(File image);

  Future<void> deleteImage();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final DioClient dioClient;

  ProfileRemoteDataSourceImpl(this.dioClient);
  @override
  Future<CurrentUserModel> editProfile({
    required String email,
    required String username,
    required String password,
    required String? newPassword,
  }) async {
    try {
      final Map<String, String> data = {};
      if (newPassword != null) {
        data.addAll({
          'email': email,
          'username': username,
          'password': password,
          'newPassword': newPassword
        });
      } else {
        data.addAll({
          'email': email,
          'username': username,
          'password': password,
        });
      }
      final res = await dioClient.dio.put(
        '${ApiConstants.users}/current/profile',
        data: data,
      );
      return CurrentUserModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw UnknownFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
  }

  @override
  Future<String> uploadImage(File image) async {
    try {
      final fileName = image.path.split('/').last;
      final res = await dioClient.dio.patch(
        '${ApiConstants.users}/current/profile/image',
        data: FormData.fromMap({
          'image': await MultipartFile.fromFile(image.path, filename: fileName)
        }),
      );
      return res.data['image'];
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw UnknownFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
  }

  @override
  Future<void> deleteImage() async {
    try {
      await dioClient.dio.delete(
        '${ApiConstants.users}/current/profile/image',
      );
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw UnknownFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
  }
}
