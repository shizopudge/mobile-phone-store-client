import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/manufacturers_repository.dart';

class DeleteManufacturer implements UseCase<void, DeleteManufacturerParams> {
  final ManufacturersRepository repository;

  DeleteManufacturer(this.repository);
  @override
  FutureEither<void> call(DeleteManufacturerParams params) async =>
      await repository.deleteManufacturer(params.id);
}

class DeleteManufacturerParams extends Equatable {
  final String id;

  const DeleteManufacturerParams({required this.id});

  @override
  List<Object?> get props => [id];
}
