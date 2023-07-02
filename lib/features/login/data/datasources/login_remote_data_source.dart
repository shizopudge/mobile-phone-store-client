import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/failure/failure.dart';
import '../models/auth_response/auth_response_model.dart';

abstract interface class LoginRemoteDataSource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });
  Future<AuthResponseModel> register({
    required String email,
    required String username,
    required String password,
  });
  Future<void> uploadImage(File image);
}

class LoginDataRemoteSourceImpl implements LoginRemoteDataSource {
  final DioClient dioClient;

  LoginDataRemoteSourceImpl(this.dioClient);
  @override
  Future<AuthResponseModel> login(
      {required String email, required String password}) async {
    try {
      final res = await dioClient.dio.post(
        '${ApiConstants.auth}/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return AuthResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw const UnknownFailure();
    } catch (e) {
      throw const UnknownFailure();
    }
  }

  @override
  Future<AuthResponseModel> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final res = await dioClient.dio.post(
        '${ApiConstants.auth}/registration',
        data: {
          'email': email,
          'username': username,
          'password': password,
        },
      );
      return AuthResponseModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw const UnknownFailure();
    } catch (e) {
      throw const UnknownFailure();
    }
  }

  @override
  Future<void> uploadImage(File image) async {
    try {
      String fileName = image.path.split('/').last;
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image.path, filename: fileName),
      });
      await dioClient.dio.patch(
        '${ApiConstants.users}/users/current/user/image',
        data: formData,
      );
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw const UnknownFailure();
    } catch (e) {
      throw const UnknownFailure();
    }
  }
}
