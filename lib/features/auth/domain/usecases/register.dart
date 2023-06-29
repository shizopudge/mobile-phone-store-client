import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../entities/current_user.dart';
import '../repositories/auth_repository.dart';

class Register implements UseCase<CurrentUser, RegisterParams> {
  final AuthRepository repository;

  const Register(this.repository);
  @override
  FutureEither<CurrentUser> call(RegisterParams params) async =>
      await repository.register(
        email: params.email,
        username: params.username,
        password: params.password,
      );
}

class RegisterParams extends Equatable {
  final String email;
  final String username;
  final String password;

  const RegisterParams({
    required this.email,
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [email, username, password];
}
