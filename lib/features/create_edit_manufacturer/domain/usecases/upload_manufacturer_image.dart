import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_manufacturer_repository.dart';

class UploadManufacturerImage
    implements UseCase<String, UploadManufacturerImageParams> {
  final CreateEditManufacturerRepository repository;

  UploadManufacturerImage(this.repository);
  @override
  FutureEither<String> call(UploadManufacturerImageParams params) async =>
      await repository.uploadImage(id: params.id, image: params.image);
}

class UploadManufacturerImageParams extends Equatable {
  final String id;
  final File image;

  const UploadManufacturerImageParams({required this.id, required this.image});

  @override
  List<Object?> get props => [id, image];
}
