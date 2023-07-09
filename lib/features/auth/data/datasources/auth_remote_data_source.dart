import 'package:dio/dio.dart';

import '../../../../core/api/api_constants.dart';
import '../../../../core/api/dio_client.dart';
import '../../../../core/data/models/current_user/current_user_model.dart';
import '../../../../core/failure/failure.dart';
import '../models/tokens/tokens_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<CurrentUserModel> getCurrentUser();
  Future<void> logout();
  Future<TokensModel> refreshTokens();
}

class AuthDataRemoteSourceImpl implements AuthRemoteDataSource {
  final DioClient dioClient;

  AuthDataRemoteSourceImpl(this.dioClient);

  @override
  Future<void> logout() async {
    try {
      await dioClient.dio.patch(
        '${ApiConstants.auth}/logout',
      );
    } on DioException catch (e) {
      final res = e.response;
      if (res != null) throw ServerFailure.fromJson(res.data);
      throw UnknownFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(message: e.toString());
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
      throw UnknownFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(message: e.toString());
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
      throw UnknownFailure(message: e.toString());
    } catch (e) {
      throw UnknownFailure(message: e.toString());
    }
  }
}
