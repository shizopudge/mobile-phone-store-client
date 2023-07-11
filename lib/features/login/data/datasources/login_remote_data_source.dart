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
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
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
      throw CasualFailure(message: e.toString());
    } catch (e) {
      throw CasualFailure(message: e.toString());
    }
  }
}
