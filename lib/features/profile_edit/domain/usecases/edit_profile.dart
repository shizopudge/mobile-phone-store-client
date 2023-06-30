import 'package:equatable/equatable.dart';
import '../repositories/profile_edit_repository.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../../../auth/domain/entities/current_user.dart';

class EditProfile implements UseCase<CurrentUser, EditProfileParams> {
  final ProfileEditRepository repository;

  const EditProfile(this.repository);
  @override
  FutureEither<CurrentUser> call(EditProfileParams params) async =>
      await repository.editProfile(
          email: params.email,
          username: params.username,
          password: params.password,
          newPassword: params.newPassword);
}

class EditProfileParams extends Equatable {
  final String email;
  final String username;
  final String password;
  final String? newPassword;

  const EditProfileParams({
    required this.email,
    required this.username,
    required this.password,
    required this.newPassword,
  });

  @override
  List<Object?> get props => [email, username, password, newPassword];
}
