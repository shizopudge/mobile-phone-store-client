import 'package:equatable/equatable.dart';

import '../../data/models/product/product_model.dart';
import 'model.dart';

class Product extends Equatable {
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String title;
  final List<String> images;
  final int inStockCount;
  final double cost;
  final String slug;
  final String color;
  final String colorCode;
  final int storage;
  final int? discount;
  final Model? model;
  const Product({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.title,
    required this.images,
    required this.inStockCount,
    required this.cost,
    required this.slug,
    required this.color,
    required this.colorCode,
    required this.storage,
    required this.discount,
    required this.model,
  });

  Product copyWith({
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? title,
    List<String>? images,
    int? inStockCount,
    double? cost,
    String? slug,
    String? color,
    String? colorCode,
    int? storage,
    int? discount,
    Model? model,
  }) {
    return Product(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
      images: images ?? this.images,
      inStockCount: inStockCount ?? this.inStockCount,
      cost: cost ?? this.cost,
      slug: slug ?? this.slug,
      color: color ?? this.color,
      colorCode: colorCode ?? this.colorCode,
      storage: storage ?? this.storage,
      discount: discount ?? this.discount,
      model: model ?? this.model,
    );
  }

  factory Product.fromModel(ProductModel model) => Product(
        id: model.id,
        createdAt: model.createdAt,
        updatedAt: model.updatedAt,
        title: model.title,
        images: model.images,
        inStockCount: model.inStockCount,
        cost: model.cost,
        slug: model.slug,
        color: model.color,
        colorCode: model.colorCode,
        storage: model.storage,
        discount: model.discount,
        model: model.model != null ? Model.fromModel(model.model!) : null,
      );

  @override
  List<Object?> get props {
    return [
      id,
      title,
      images,
      inStockCount,
      cost,
      slug,
      color,
      colorCode,
      storage,
      discount,
      model,
    ];
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      Product.fromModel(ProductModel.fromJson(json));

  Map<String, dynamic> toJson() => ProductModel.fromEntity(this).toJson();
}

extension ProductMethods on Product {
  bool isInCart(List<Product> cart) => cart.contains(this);

  bool isInWishlist(List<Product> wishlist) => wishlist.contains(this);

  bool isInPurchases(List<Product> purchases) => purchases.contains(this);

  List<String> _getColors() {
    final Set<String> colorsSet = {};
    for (Product product in products) {
      colorsSet.add(product.colorCode);
    }
    return colorsSet.toList()..sort();
  }

  List<String> _getAvailableColors() {
    final Set<String> colorsSet = {};
    for (Product product in products) {
      if (product.storage == storage) {
        colorsSet.add(product.colorCode);
      }
    }
    return colorsSet.toList()..sort();
  }

  List<int> _getStorages() {
    final Set<int> storagesSet = {};
    for (Product product in products) {
      storagesSet.add(product.storage);
    }
    return storagesSet.toList()..sort();
  }

  List<int> _getAvailableStorages() {
    final Set<int> storagesSet = {};
    for (Product product in products) {
      if (product.colorCode == colorCode) {
        storagesSet.add(product.storage);
      }
    }
    return storagesSet.toList()..sort();
  }

  List<Product> _getProducts() {
    if (model != null) {
      final Set<Product> products = {};
      for (Product product in model!.products) {
        products.add(product.copyWith(model: model));
      }
      return products.toList();
    }
    return [];
  }

  bool isAvailableColor(String colorCode) =>
      _getAvailableColors().contains(colorCode);

  bool isAvailableStorage(int storage) =>
      _getAvailableStorages().contains(storage);

  List<String> get colors => _getColors();

  List<String> get availableColors => _getAvailableColors();

  List<int> get storages => _getStorages();

  List<int> get availableStorages => _getAvailableStorages();

  List<Product> get products => _getProducts();

  double get discountCost =>
      discount == null ? cost : cost - (cost / 100 * discount!);

  bool get isNew => DateTime.now().difference(createdAt).inDays < 7;

  bool get isOutOfStock => inStockCount == 0;

  bool get isDiscounted => discount != null;
}
