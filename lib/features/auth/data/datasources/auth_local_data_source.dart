import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/failures/failure.dart';
import '../models/tokens/tokens_model.dart';

abstract interface class AuthLocalDataSource {
  Future<void> storeTokens(TokensModel tokens);
  Future<void> removeTokens();
  Future<void> setLoginType(LoginType loginType);
  String getLoginType();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final FlutterSecureStorage _storage;
  final SharedPreferences _prefs;

  AuthLocalDataSourceImpl(
      {required FlutterSecureStorage storage, required SharedPreferences prefs})
      : _storage = storage,
        _prefs = prefs;

  @override
  Future<void> storeTokens(TokensModel tokens) async {
    try {
      await _storage.write(key: 'accessToken', value: tokens.accessToken);
      await _storage.write(key: 'refreshToken', value: tokens.refreshToken);
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Future<void> removeTokens() async {
    try {
      await _storage.deleteAll();
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Future<void> setLoginType(LoginType loginType) async {
    try {
      await _prefs.setString('loginType', loginType.toString());
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  String getLoginType() {
    try {
      final loginType =
          _prefs.getString('loginType') ?? LoginType.user.toString();
      return loginType;
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }
}
