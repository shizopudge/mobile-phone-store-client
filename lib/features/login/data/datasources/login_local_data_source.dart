import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/models/tokens/tokens_model.dart';

abstract interface class LoginLocalDataSource {
  Future<void> storeTokens(TokensModel tokens);
  Future<void> removeTokens();
  Future<void> setLoginType(LoginType loginType);
}

class LoginLocalDataSourceImpl extends LoginLocalDataSource {
  final FlutterSecureStorage _storage;
  final SharedPreferences _prefs;

  LoginLocalDataSourceImpl(
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
}
