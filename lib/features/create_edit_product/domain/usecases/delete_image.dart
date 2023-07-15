import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_product_repository.dart';

class DeleteProductImage implements UseCase<void, DeleteProductImageParams> {
  final CreateEditProductRepository repository;

  const DeleteProductImage(this.repository);
  @override
  FutureEither<void> call(DeleteProductImageParams params) async =>
      await repository.deleteImage(id: params.id, imageLink: params.imageLink);
}

class DeleteProductImageParams extends Equatable {
  final String id;
  final String imageLink;

  const DeleteProductImageParams({required this.id, required this.imageLink});
  @override
  List<Object?> get props => [id, imageLink];
}
