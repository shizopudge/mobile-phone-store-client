import 'package:equatable/equatable.dart';

import '../../../../core/data/models/manufacturer/manufacturer_model.dart';
import '../../../../core/domain/entities/info.dart';
import '../../../../core/domain/entities/manufacturer.dart';
import '../../data/models/manufacturers_response_model.dart';

class ManufacturersResponse extends Equatable {
  final Info info;
  final List<Manufacturer> manufacturers;

  const ManufacturersResponse({
    required this.info,
    required this.manufacturers,
  });

  factory ManufacturersResponse.fromModel(ManufacturersResponseModel model) {
    final List<Manufacturer> manufacturers = [];
    for (ManufacturerModel manufacturerModel in model.manufacturers) {
      manufacturers.add(Manufacturer.fromModel(manufacturerModel));
    }
    return ManufacturersResponse(
      info: Info.fromModel(model.info),
      manufacturers: manufacturers,
    );
  }

  @override
  List<Object?> get props => [info, manufacturers];
}
