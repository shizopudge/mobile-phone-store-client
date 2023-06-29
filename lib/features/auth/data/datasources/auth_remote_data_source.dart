import 'dart:io';

import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/failures/failure.dart';
import '../models/auth_response/auth_response_model.dart';
import '../models/current_user/current_user_model.dart';
import '../models/tokens/tokens_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });
  Future<AuthResponseModel> register({
    required String email,
    required String username,
    required String password,
  });
  Future<CurrentUserModel> getCurrentUser();
  Future<void> logout();
  Future<TokensModel> refreshTokens();
  Future<void> uploadImage(File image);
}

class AuthDataRemoteSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthDataRemoteSourceImpl(this.dioClient);
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
  Future<void> logout() async {
    try {
      await dioClient.dio.patch(
        '${ApiConstants.auth}/logout',
      );
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw const UnknownFailure();
    } catch (e) {
      throw const UnknownFailure();
    }
  }

  @override
  Future<TokensModel> refreshTokens() async {
    try {
      final res = await dioClient.dio.patch(
        '${ApiConstants.auth}/refresh-tokens',
      );
      return TokensModel.fromJson(res.data);
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

  @override
  Future<CurrentUserModel> getCurrentUser() async {
    try {
      final res = await dioClient.dio.get(
        '${ApiConstants.users}/current/profile',
      );
      return CurrentUserModel.fromJson(res.data);
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw const UnknownFailure();
    } catch (e) {
      throw const UnknownFailure();
    }
  }
}
