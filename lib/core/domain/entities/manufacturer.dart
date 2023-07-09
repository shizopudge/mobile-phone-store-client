import 'package:equatable/equatable.dart';

import '../../data/models/manufacturer/manufacturer_model.dart';

class Manufacturer extends Equatable {
  final String id;
  final String name;
  final String? image;
  const Manufacturer({
    required this.id,
    required this.name,
    this.image,
  });

  Manufacturer copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return Manufacturer(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  factory Manufacturer.fromModel(ManufacturerModel model) =>
      Manufacturer(id: model.id, name: model.name, image: model.image);

  @override
  List<Object?> get props => [id, name, image];

  factory Manufacturer.fromJson(Map<String, dynamic> json) =>
      Manufacturer.fromModel(ManufacturerModel.fromJson(json));

  Map<String, dynamic> toJson() => ManufacturerModel.fromEntity(this).toJson();
}
