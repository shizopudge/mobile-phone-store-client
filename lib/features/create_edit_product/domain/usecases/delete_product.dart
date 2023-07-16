import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_product_repository.dart';

class DeleteProduct implements UseCase<void, DeleteProductParams> {
  final CreateEditProductRepository repository;

  DeleteProduct(this.repository);
  @override
  FutureEither<void> call(DeleteProductParams params) async =>
      await repository.deleteProduct(params.id);
}

class DeleteProductParams extends Equatable {
  final String id;

  const DeleteProductParams({required this.id});

  @override
  List<Object?> get props => [id];
}
