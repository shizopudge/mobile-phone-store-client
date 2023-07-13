import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_manufacturer_repository.dart';

class DeleteManufacturerImage
    implements UseCase<void, DeleteManufacturerImageParams> {
  final CreateEditManufacturerRepository repository;

  DeleteManufacturerImage(this.repository);
  @override
  FutureEither<void> call(DeleteManufacturerImageParams params) async =>
      await repository.deleteImage(params.id);
}

class DeleteManufacturerImageParams extends Equatable {
  final String id;

  const DeleteManufacturerImageParams({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
