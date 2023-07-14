import 'package:equatable/equatable.dart';

import '../../constants/enums.dart';
import '../../data/models/model/model_model.dart';
import '../../data/models/product/product_model.dart';
import 'manufacturer.dart';
import 'product.dart';

class Model extends Equatable {
  final String id;
  final String name;
  final String description;
  final int pixelDensity;
  final int screenRefreshRate;
  final double screenDiagonal;
  final int weight;
  final String screenResolution;
  final OperatingSystem operatingSystem;
  final DisplayType displayType;
  final Manufacturer manufacturer;
  final List<Product> products;
  const Model({
    required this.id,
    required this.name,
    required this.description,
    required this.pixelDensity,
    required this.screenRefreshRate,
    required this.screenDiagonal,
    required this.weight,
    required this.screenResolution,
    required this.operatingSystem,
    required this.displayType,
    required this.manufacturer,
    required this.products,
  });

  Model copyWith({
    String? id,
    String? name,
    String? description,
    int? pixelDensity,
    int? screenRefreshRate,
    double? screenDiagonal,
    int? weight,
    String? screenResolution,
    OperatingSystem? operatingSystem,
    DisplayType? displayType,
    Manufacturer? manufacturer,
    List<Product>? products,
  }) {
    return Model(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      pixelDensity: pixelDensity ?? this.pixelDensity,
      screenRefreshRate: screenRefreshRate ?? this.screenRefreshRate,
      screenDiagonal: screenDiagonal ?? this.screenDiagonal,
      weight: weight ?? this.weight,
      screenResolution: screenResolution ?? this.screenResolution,
      operatingSystem: operatingSystem ?? this.operatingSystem,
      displayType: displayType ?? this.displayType,
      manufacturer: manufacturer ?? this.manufacturer,
      products: products ?? this.products,
    );
  }

  factory Model.fromModel(ModelModel model) {
    final Set<Product> products = {};
    for (ProductModel productModel in model.products) {
      products.add(Product.fromModel(productModel));
    }
    return Model(
      id: model.id,
      name: model.name,
      description: model.description,
      pixelDensity: model.pixelDensity,
      screenRefreshRate: model.screenRefreshRate,
      screenDiagonal: model.screenDiagonal,
      weight: model.weight,
      screenResolution: model.screenResolution,
      operatingSystem: model.operatingSystem,
      displayType: model.displayType,
      manufacturer: Manufacturer.fromModel(model.manufacturer),
      products: products.toList(),
    );
  }

  @override
  List<Object> get props {
    return [
      id,
      name,
      pixelDensity,
      screenRefreshRate,
      screenDiagonal,
      weight,
      screenResolution,
      operatingSystem,
      displayType,
      manufacturer,
      products,
    ];
  }

  String _getScreenWidth() => screenResolution.split('x')[0];

  String _getScreenHeight() => screenResolution.split('x')[1];

  String get screenWidth => _getScreenWidth();

  String get screenHeight => _getScreenHeight();

  factory Model.fromJson(Map<String, dynamic> json) =>
      Model.fromModel(ModelModel.fromJson(json));

  Map<String, dynamic> toJson() => ModelModel.fromEntity(this).toJson();
}
