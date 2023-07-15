import 'dart:io';

import '../../../constants/type_defs.dart';
import '../../repositories/image/image_repository.dart';
import '../usecase.dart';

class PickImages implements UseCase<List<File>, NoParams> {
  final ImageRepository repository;

  const PickImages(this.repository);
  @override
  FutureEither<List<File>> call(NoParams params) async =>
      await repository.pickImages();
}
