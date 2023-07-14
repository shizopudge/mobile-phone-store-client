import 'package:equatable/equatable.dart';

import '../../../../core/constants/type_defs.dart';
import '../../../../core/domain/entities/manufacturer.dart';
import '../../../../core/domain/usecases/usecase.dart';
import '../repositories/create_edit_manufacturer_repository.dart';

class CreateManufacturer
    implements UseCase<Manufacturer, CreateManufacturerParams> {
  final CreateEditManufacturerRepository repository;

  CreateManufacturer(this.repository);
  @override
  FutureEither<Manufacturer> call(CreateManufacturerParams params) async =>
      await repository.createManufacturer(name: params.name);
}

class CreateManufacturerParams extends Equatable {
  final String name;

  const CreateManufacturerParams({required this.name});

  @override
  List<Object?> get props => [name];
}
