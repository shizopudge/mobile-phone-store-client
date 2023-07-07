import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/failure/failure.dart';

abstract interface class AuthRepository {
  FutureEither<CurrentUser> getCurrentUser();
  FutureEither<void> logout();
  FutureEither<void> refreshTokens();
  Either<Failure, LoginType> getLoginType();
}
