import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/failure/failure.dart';
import '../../../auth/data/models/tokens/tokens_model.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_local_data_source.dart';
import '../datasources/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;
  final LoginLocalDataSource localDataSource;

  LoginRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
  });

  @override
  FutureEither<CurrentUser> login(
      {required String email, required String password}) async {
    try {
      final res =
          await remoteDataSource.login(email: email, password: password);
      final currentUser = CurrentUser.fromModel(res.user);
      await _storeTokens(res.tokens);
      await localDataSource.setLoginType(LoginType.user);
      return Right(currentUser);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<void> loginAsGuest() async {
    try {
      await localDataSource.setLoginType(LoginType.guest);
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  @override
  FutureEither<CurrentUser> register({
    required String email,
    required String username,
    required String password,
  }) async {
    try {
      final res = await remoteDataSource.register(
        email: email,
        username: username,
        password: password,
      );
      final currentUser = CurrentUser.fromModel(res.user);
      await _storeTokens(res.tokens);
      await localDataSource.setLoginType(LoginType.user);
      return Right(currentUser);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(UnknownFailure(message: e.toString()));
    }
  }

  Future<void> _storeTokens(TokensModel tokens) async {
    try {
      await localDataSource.storeTokens(tokens);
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }
}
