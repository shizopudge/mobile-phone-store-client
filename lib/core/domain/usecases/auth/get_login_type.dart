import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/failure/failure.dart';
import '../../repositories/auth/auth_repository.dart';

class GetLoginType {
  final AuthRepository repository;

  const GetLoginType(this.repository);

  Either<Failure, LoginType> call() => repository.getLoginType();
}
