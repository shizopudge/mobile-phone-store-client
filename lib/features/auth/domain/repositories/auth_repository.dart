import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/failure/failure.dart';
import '../entities/current_user.dart';

abstract interface class AuthRepository {
  FutureEither<CurrentUser> login({
    required String email,
    required String password,
  });
  FutureEither<void> loginAsGuest();
  FutureEither<CurrentUser> register({
    required String email,
    required String username,
    required String password,
  });
  FutureEither<CurrentUser> getCurrentUser();
  FutureEither<void> logout();
  FutureEither<void> refreshTokens();
  Either<Failure, LoginType> getLoginType();
}
