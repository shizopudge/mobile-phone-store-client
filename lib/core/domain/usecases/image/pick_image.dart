import 'dart:io';

import '../../../constants/type_defs.dart';
import '../../repositories/image/image_repository.dart';
import '../usecase.dart';

class PickImage implements UseCase<File?, NoParams> {
  final ImageRepository repository;

  const PickImage(this.repository);
  @override
  FutureEither<File?> call(NoParams params) async =>
      await repository.pickImage();
}
