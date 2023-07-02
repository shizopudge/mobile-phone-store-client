import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/current_user.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/login_repository.dart';

class Login implements UseCase<CurrentUser, LoginParams> {
  final LoginRepository repository;

  const Login(this.repository);
  @override
  FutureEither<CurrentUser> call(LoginParams params) async =>
      await repository.login(email: params.email, password: params.password);
}

class LoginParams extends Equatable {
  final String email;
  final String password;

  const LoginParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
