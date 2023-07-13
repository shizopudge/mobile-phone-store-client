import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/manufacturer.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_manufacturer_repository.dart';

class EditManufacturer
    implements UseCase<Manufacturer, EditManufacturerParams> {
  final CreateEditManufacturerRepository repository;

  EditManufacturer(this.repository);
  @override
  FutureEither<Manufacturer> call(EditManufacturerParams params) async =>
      await repository.editManufacturer(id: params.id, name: params.name);
}

class EditManufacturerParams extends Equatable {
  final String id;
  final String name;

  const EditManufacturerParams({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
