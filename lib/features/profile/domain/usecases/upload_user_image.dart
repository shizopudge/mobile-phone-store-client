import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/profile_repository.dart';

class UploadUserImage implements UseCase<String, UploadImageParams> {
  final ProfileRepository repository;

  const UploadUserImage(this.repository);
  @override
  FutureEither<String> call(UploadImageParams params) async =>
      await repository.uploadImage(params.image);
}

class UploadImageParams extends Equatable {
  final File image;

  const UploadImageParams({
    required this.image,
  });

  @override
  List<Object?> get props => [image];
}
