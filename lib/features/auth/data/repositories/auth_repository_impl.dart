import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../../domain/entities/current_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/tokens/tokens_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  AuthRepositoryImpl({
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
      return const Left(UnknownFailure());
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
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureEither<void> logout() async {
    try {
      await remoteDataSource.logout();
      await _removeTokens();
      return const Right(null);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureEither<void> refreshTokens() async {
    try {
      final res = await remoteDataSource.refreshTokens();
      await _storeTokens(res);
      return const Right(null);
    } on Failure catch (e) {
      await _removeTokens();
      return Left(e);
    } catch (e) {
      await _removeTokens();
      return const Left(UnknownFailure());
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
      return const Left(UnknownFailure());
    }
  }

  @override
  FutureEither<CurrentUser> getCurrentUser() async {
    try {
      final res = await remoteDataSource.getCurrentUser();
      final currentUser = CurrentUser.fromModel(res);
      return Right(currentUser);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }

  Future<void> _storeTokens(TokensModel tokens) async {
    try {
      await localDataSource.storeTokens(tokens);
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  Future<void> _removeTokens() async {
    try {
      await localDataSource.removeTokens();
    } on Exception catch (e) {
      throw CacheFailure(message: e.toString());
    }
  }

  @override
  Either<Failure, LoginType> getLoginType() {
    try {
      final String loginTypeStr = localDataSource.getLoginType();
      return Right(LoginType.fromString(loginTypeStr));
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return const Left(UnknownFailure());
    }
  }
}
