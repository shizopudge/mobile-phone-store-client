import 'package:dartz/dartz.dart';

import '../../../../core/constants/enums.dart';
import '../../../../core/failures/failure.dart';
import '../repositories/auth_repository.dart';

class GetLoginType {
  final AuthRepository repository;

  const GetLoginType(this.repository);

  Either<Failure, LoginType> call() => repository.getLoginType();
}
