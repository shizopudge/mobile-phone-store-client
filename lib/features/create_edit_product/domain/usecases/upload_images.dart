import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_product_repository.dart';

class UploadProductImages implements UseCase<void, UploadProductImagesParams> {
  final CreateEditProductRepository repository;

  const UploadProductImages(this.repository);
  @override
  FutureEither<void> call(UploadProductImagesParams params) async =>
      await repository.uploadImages(id: params.id, images: params.images);
}

class UploadProductImagesParams extends Equatable {
  final String id;
  final List<File> images;

  const UploadProductImagesParams({required this.id, required this.images});
  @override
  List<Object?> get props => [id, images];
}
